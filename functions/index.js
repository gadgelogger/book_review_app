const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.copyBookToAllUsersBooks = functions.firestore
    .document("users/{userId}/books/{bookId}")
    .onCreate((snap, context) => {
        // 新しく追加された本のデータを取得
        const newBook = snap.data();
        const { userId } = context.params;

        // allUsersBooksコレクションに本のデータを追加
        // ここでbannedフィールドをfalseに設定
        return admin.firestore().collection("allUsersBooks").add({
            ...newBook,
            uid: userId, // 投稿者のUIDを追加
            banned: false, // bannedフィールドを追加
        });
    });
