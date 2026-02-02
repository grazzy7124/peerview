class AppUser {
  final String uid;
  final String? email;
  final String? displayName;
  final String? photoURL;
  final String role; // "admin" | "student"

  AppUser({
    required this.uid,
    required this.role,
    this.email,
    this.displayName,
    this.photoURL,
  });

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      uid: map['uid'] as String,
      role: map['role'] as String,
      email: map['email'] as String?,
      displayName: map['displayName'] as String?,
      photoURL: map['photoURL'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
    'uid': uid,
    'role': role,
    'email': email,
    'displayName': displayName,
    'photoURL': photoURL,
  };
}