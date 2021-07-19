import 'package:firebase_auth/firebase_auth.dart';
import 'package:movieapp/infrastructure/models/user.dart';
import 'package:movieapp/infrastructure/services/database_services.dart';

class AuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Userid _userfromfirebase(User user) {
    return user != null
        ? Userid(uid: user.uid, name: user.displayName, email: user.email)
        : null;
  }

  //signinwithemailandpass
  Future signinwithemailandpass(String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = result.user;
      return _userfromfirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future regwithemailandpass(String email, String password, String name) async {
    try {
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      await user.updateDisplayName(name);

      // await Databaseservices(uid: user.uid)
      //     .updatedata(name, 'movie1', 'movie2', 0, 0);
      // await Databaseservices(uid: user.uid).updateuserinfo(name, email);
      return _userfromfirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signout() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Stream<Userid> get user {
    return _firebaseAuth.authStateChanges().map(_userfromfirebase);
  }
}
