import 'package:firebase_auth/firebase_auth.dart';

//user email and password validation from firebase
class firebaseauthservices {
  final firebasauthInstance = FirebaseAuth.instance;

//for creating account in firebase
  Future<UserCredential> registerUser({
    required String email,
    required String password,
  }) async {
    final userCred = await firebasauthInstance.createUserWithEmailAndPassword(
        email: email, password: password);

    return userCred;
  }

  Future<UserCredential> siginUser({
    required String email,
    required String password,
  }) async {
    final userCred = await firebasauthInstance.signInWithEmailAndPassword(
        email: email, password: password);

    return userCred;
  }

  Future<void> logoutUser() async {
    await firebasauthInstance.signOut();
  }
}
