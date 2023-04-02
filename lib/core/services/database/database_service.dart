import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  CollectionReference admins = FirebaseFirestore.instance.collection('admins');
  final db = FirebaseFirestore.instance;
}
