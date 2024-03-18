const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

// 本が追加された時にallUsersBooksコレクションにコピーする
exports.copyBookToAllUsersBooks = functions.firestore
    .document("users/{userId}/books/{bookId}")
    .onCreate((snap, context) => {
        const newBook = snap.data();
        const { userId } = context.params;
        return admin.firestore().collection("allUsersBooks").add({
            ...newBook,
            uid: userId,
            banned: false,
        });
    });

// 本が削除された時にallUsersBooksコレクションから該当の本を削除する
exports.deleteBookFromAllUsersBooks = functions.firestore
    .document("users/{userId}/books/{bookId}")
    .onDelete((snap, context) => {
        const { bookId } = context.params;
        return admin.firestore().collection("allUsersBooks").where("bookId", "==", bookId)
            .get()
            .then(querySnapshot => {
                querySnapshot.forEach(doc => {
                    doc.ref.delete();
                });
            });
    });

// ユーザーの投稿した本の数を増やす
exports.incrementBookCount = functions.firestore
    .document("users/{userId}/books/{bookId}")
    .onCreate((snap, context) => {
        const { userId } = context.params;
        const userRef = admin.firestore().collection("users").doc(userId);
        
        return admin.firestore().runTransaction(transaction => {
            return transaction.get(userRef).then(userDoc => {
                if (!userDoc.exists) {
                    throw "Document does not exist!";
                }
                const newCount = (userDoc.data().bookCount || 0) + 1;
                transaction.update(userRef, { bookCount: newCount });
            });
        });
    });

// ユーザーの投稿した本の数を減らす
exports.decrementBookCount = functions.firestore
    .document("users/{userId}/books/{bookId}")
    .onDelete((snap, context) => {
        const { userId } = context.params;
        const userRef = admin.firestore().collection("users").doc(userId);
        
        return admin.firestore().runTransaction(transaction => {
            return transaction.get(userRef).then(userDoc => {
                if (!userDoc.exists) {
                    throw "Document does not exist!";
                }
                const newCount = Math.max((userDoc.data().bookCount || 0) - 1, 0);
                transaction.update(userRef, { bookCount: newCount });
            });
        });
    });
