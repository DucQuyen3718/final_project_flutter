import 'package:firebase_auth/firebase_auth.dart';
import 'package:risky_coin/data/data_source/database_user.dart';
import 'package:risky_coin/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final firebaseFirestore = DatabaseUser.db.firestore;

  @override
  Future<void> login(String email, String password) async {
    final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    _handleFirebase(userCredential);
  }

  @override
  Future<void> register(String email, String password) async {
    final UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  void _handleFirebase(UserCredential user) {
    if(user.user != null) {
      firebaseFirestore.collection('users').doc(user.user!.uid).get().then((value) {
        if(value.exists) {
          print('User exists');
        } else {
          firebaseFirestore.collection('users').doc(user.user!.uid).set(
              {
                'email': user.user!.email,
                'password': user.user!.uid,
              }
          );
        }
      });
    }
  }
}