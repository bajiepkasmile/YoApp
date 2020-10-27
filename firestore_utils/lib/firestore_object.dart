import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

/// Базовый класс объектов Firestore.
abstract class FirestoreObject {

  final String id;

  final DocumentReference _reference;

  FirestoreObject(this.id) :
    _reference = null
  ;

  FirestoreObject.fromSnapshot(DocumentSnapshot documentSnapshot) :
        id = documentSnapshot.documentID,
        _reference = documentSnapshot.reference
  ;

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    addFieldsToMap(map);
    return map;
  }

  Future<void> update() => _reference?.updateData(toMap()) ?? Future.value();

  Future<void> delete() => _reference?.delete() ?? Future.value();

  @protected
  void addFieldsToMap(Map<String, dynamic> map);
}
