import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseService {
  CollectionReference usersgestor =
      FirebaseFirestore.instance.collection('usergestor');
  CollectionReference store = FirebaseFirestore.instance.collection('store');
}
