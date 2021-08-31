import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:miiti/models/myUser.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  UserRepository(this._firebaseAuth, this._firebaseFirestore);

  MyUser? _userFromFirebase(User user) {
    return MyUser(uid: user.uid, email: user.email);
  }

  Future<void> signInEmail(
      {required String email, required String password}) async {
    _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<bool> isFirst(String uid) async {
    bool mevcut = false;
    await _firebaseFirestore
        .collection("users")
        .doc(uid)
        .get()
        .then((user) => mevcut = user.exists);
    return mevcut;
  }

  Future<MyUser?> signUpEmail(String email, String password) async {
    UserCredential sonuc;
    print(_firebaseAuth);
    sonuc = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(sonuc.user!);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  Future<bool> isSigned() async {
    final currentuser = _firebaseAuth.currentUser;
    return currentuser != null;
  }

  Future<String> getUser() async {
    return _firebaseAuth.currentUser!.uid;
  }
}
