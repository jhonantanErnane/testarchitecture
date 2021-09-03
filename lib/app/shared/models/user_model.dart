import 'package:firebase_auth/firebase_auth.dart' as fb;

class User {
  late String email;
  late String displayName;
  late bool isAnonymous;
  late String photoUrl;
  late String uid;

  User({
    required this.email,
    required this.displayName,
    required this.isAnonymous,
    required this.photoUrl,
    required this.uid,
  });

  User.fromFirebaseUser(fb.User fbUser) {
    this.email = fbUser.email!;
    this.displayName = fbUser.displayName!;
    this.isAnonymous = fbUser.isAnonymous;
    this.photoUrl = fbUser.photoURL!;
    this.uid = fbUser.uid;
  }
}
