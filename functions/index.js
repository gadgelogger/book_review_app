const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

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
