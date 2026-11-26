import 'package:cloud_firestore/cloud_firestore.dart';

import 'model/my_user.dart';

class FirebaseUtils {
  static CollectionReference<MyUser> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.collectionName)
        .withConverter(
          fromFirestore: (snapshot, options) =>
              MyUser.fromJson(snapshot.data()!),
          toFirestore: (user, options) => user.toJson(),
        );
  }

  static Future<void> addUserInFireStore(MyUser myUser) {
    //todo 1: collection
    CollectionReference<MyUser> collectionRef = getUserCollection();
    //todo 2: document
    DocumentReference<MyUser> docRef = collectionRef.doc(myUser.id);
    //getUserCollection().doc(myUser.id).set(myUser);
    return docRef.set(myUser);
  }

  static Future<MyUser?> getUserFromFireStore(String uId) async {
    var docUser = await getUserCollection().doc(uId).get();
    return docUser.data();
  }
}
