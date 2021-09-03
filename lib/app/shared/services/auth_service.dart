import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import 'package:rxdart/subjects.dart';
import '../models/user_model.dart';
import '../../shared/custom_dio/custom_dio.dart';
import 'dart:async';

class AuthService extends Disposable {
  final fbAuth.FirebaseAuth _auth = fbAuth.FirebaseAuth.instance;
  final _isLoggedCtrl = BehaviorSubject<bool>();

  static AuthService? _instance;
  late StreamSubscription _streamSubscription;
  late User user;
  fbAuth.User? firebaseUser;

  static AuthService get instance {
    if (_instance == null) {
      _instance = AuthService._();
    }
    return _instance!;
  }

  AuthService._() {
    _authStateChanged();
  }

  _authStateChanged() {
    _streamSubscription = _auth.userChanges().listen((fbAuth.User? user) async {
      firebaseUser = user;
      if (user == null) {
        this.user = await _loginFirebase();
      }
      final resp = await _getUser();

      if (resp && this.user != null) {
        _isLoggedCtrl.add(true);
      } else {
        _isLoggedCtrl.add(false);
      }
    });
  }

  Stream<bool> get isLogged => _isLoggedCtrl.stream;

  Future<String> getToken() async {
    try {
      return await firebaseUser!.getIdToken();
    } catch (e) {
      print(e);
      return '';
    }
  }

  void changeUserState(bool isLogged) {
    _isLoggedCtrl.add(isLogged);
  }

  Future<bool> _getUser() async {
    try {
      final userResp = await CustomDio.instance.client.get('/user');
      print(userResp);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  /// Make login with Firebase
  ///
  /// If the user is not logged, make a login anonymously
  Future<User> _loginFirebase() async {
    fbAuth.User user = _auth.currentUser!;
    if (user == null) {
      final result = await _auth.signInAnonymously();
      user = result.user!;
    }
    return User.fromFirebaseUser(user);
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
  }
}
