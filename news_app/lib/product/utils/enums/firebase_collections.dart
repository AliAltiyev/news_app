import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollections {
  versionControl;

  // ignore: constant_identifier_names
  CollectionReference get ref => FirebaseFirestore.instance.collection(name);
}
