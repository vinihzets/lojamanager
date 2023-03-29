import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseService {
  CollectionReference admins = FirebaseFirestore.instance.collection('admins');
  final db = FirebaseFirestore.instance;
}
