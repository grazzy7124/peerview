import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:peerview/models/app_user.dart';
import 'package:peerview/services/firebase/auth_service.dart';
import 'package:peerview/services/firebase/user_service.dart';

enum EntryRoute { login, role, adminHome, studentHome }

class SessionViewModel extends ChangeNotifier {
  final AuthService authService;
  final UserService userService;

  SessionViewModel(this.authService, this.userService);

  StreamSubscription<User?>? _sub;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  User? _firebaseUser;
  AppUser? _appUser;
  AppUser? get appUser => _appUser;

  EntryRoute _entry = EntryRoute.login;
  EntryRoute get entry => _entry;

  String? error;

  void init() {
    _sub?.cancel();

    //  0) 앱 시작 즉시 currentUser로 1차 분기 (로딩 무한 방지)
    final user = authService.currentUser;

    // 기본값
    _isLoading = true;
    error = null;
    notifyListeners();

    if (user == null) {
      _firebaseUser = null;
      _appUser = null;
      _entry = EntryRoute.login;
      _isLoading = false;
      notifyListeners();
    } else {
      // 로그인 상태면 Firestore 확인
      _bootstrapWithUser(user);
    }

    //  1) 이후부터는 authStateChanges로 상태 동기화
    _sub = authService.authStateChanges().listen((u) {
      if (u == null) {
        _firebaseUser = null;
        _appUser = null;
        _entry = EntryRoute.login;
        _isLoading = false;
        notifyListeners();
        return;
      }
      _bootstrapWithUser(u);
    });
  }

  Future<void> _bootstrapWithUser(User user) async {
    _isLoading = true;
    error = null;
    _firebaseUser = user;
    notifyListeners();

    try {
      // 🔥 혹시 Firestore 쪽에서 멈추는 경우 대비: 타임아웃 걸어줌
      final existing = await userService
          .fetchUser(user.uid)
          .timeout(const Duration(seconds: 8), onTimeout: () => null);

      if (existing == null) {
        _appUser = null;
        _entry = EntryRoute.role;
      } else {
        _appUser = existing;
        _entry = (existing.role == 'admin')
            ? EntryRoute.adminHome
            : EntryRoute.studentHome;
      }
    } catch (e) {
      error = e.toString();
      _entry = EntryRoute.login;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signInWithGoogle() async {
    await authService.signInWithGoogle();
    // authStateChanges 리스너가 알아서 entry 갱신함
  }

  Future<void> chooseRoleAndCreateUser(String role) async {
    final user = authService.currentUser;
    if (user == null) throw Exception('No signed-in user');

    _isLoading = true;
    error = null;
    notifyListeners();

    try {
      await userService.createUserIfAbsent(firebaseUser: user, role: role);

      final fetched = await userService.fetchUser(user.uid);
      if (fetched == null) {
        throw Exception('User doc not created/readable yet');
      }

      _appUser = fetched;
      _entry = (fetched.role == 'admin')
          ? EntryRoute.adminHome
          : EntryRoute.studentHome;
    } catch (e) {
      error = e.toString();
      rethrow; // RolePage에서 catch해서 debugPrint 가능
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  Future<void> signOut() async {
    await authService.signOut();
    // authStateChanges가 null 유저를 쏘고
    // Gate가 EntryRoute.login으로 보냄
  }
}
