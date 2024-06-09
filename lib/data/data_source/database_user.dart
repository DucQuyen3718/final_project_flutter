import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:risky_coin/data/model/user_model.dart';
import 'package:uuid/uuid.dart';

class DatabaseUser {
  DatabaseUser._();
  static final DatabaseUser db = DatabaseUser._();
  final firestore = FirebaseFirestore.instance;
  final authFirebase = FirebaseAuth.instance;
  final uuid = const Uuid();

  Future<List<UserModel>> getAllUser() async {
    final user = authFirebase.currentUser;
    final CollectionReference usersCollection = firestore.collection('users').doc(user!.uid).collection('users');
    final QuerySnapshot snapshot = await usersCollection.get();
    return snapshot.docs.map((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>, snapshot.docs.first.id)).toList();
  }

  Future<void> createUser(UserModel userModel) async {
    final user = authFirebase.currentUser;
    userModel.id = uuid.v4();
    firestore.collection('users').doc(user!.uid).collection('users').doc(userModel.id).set(userModel.toJson());
  }

  Future<UserModel> getUser(String id) async {
    final user = authFirebase.currentUser;
    final CollectionReference usersCollection = firestore.collection('users').doc(user!.uid).collection('users');
    final QuerySnapshot snapshot = await usersCollection.where('id', isEqualTo: id).get();
    return UserModel.fromJson(snapshot.docs.first.data() as Map<String, dynamic>, snapshot.docs.first.id);
  }

  Future<void> updateUser(UserModel userModel) async {
    final user = authFirebase.currentUser;
    firestore.collection('users').doc(user!.uid).collection('users').doc(userModel.id).update(userModel.toJson());
  }

  Future<void> deleteUser(String id) async {
    final user = authFirebase.currentUser;
    final CollectionReference usersCollection = firestore.collection('users').doc(user!.uid).collection('users');
    await usersCollection.doc(id).delete();
  }
}