import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:peerview/models/app_user.dart';

class UserService {
  final _db = FirebaseFirestore.instance;

  DocumentReference<Map<String, dynamic>> _userDoc(String uid) =>
      _db.collection('users').doc(uid);

  Future<AppUser?> fetchUser(String uid) async {
    final snap = await _userDoc(uid).get();
    if (!snap.exists) return null;
    return AppUser.fromMap(snap.data()!);
  }

  Future<void> createUserIfAbsent({
    required User firebaseUser,
    required String role, // "admin" | "student"
  }) async {
    final ref = _userDoc(firebaseUser.uid);
    final snap = await ref.get();

    final now = FieldValue.serverTimestamp();

    if (!snap.exists) {
      final appUser = AppUser(
        uid: firebaseUser.uid,
        role: role,
        email: firebaseUser.email,
        displayName: firebaseUser.displayName,
        photoURL: firebaseUser.photoURL,
      );

      await ref.set({
        ...appUser.toMap(),
        'createdAt': now,
        'updatedAt': now,
      });
    } else {
      // role 변경 같은 케이스 대비(원하면 막아도 됨)
      await ref.update({
        'updatedAt': now,
      });
    }
  }
}
