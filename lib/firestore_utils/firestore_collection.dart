import 'package:cloud_firestore/cloud_firestore.dart';

import 'firestore_object.dart';

typedef DocumentSnapshotMapFunction<TItem> = TItem Function(DocumentSnapshot);

/// Представление коллекции в Firestore.
class FirestoreCollection<TItem extends FirestoreObject> {

  final CollectionReference reference;
  final DocumentSnapshotMapFunction<TItem> _mapFunction;

  FirestoreCollection(this.reference, this._mapFunction);

  Future<TItem> load(String id) async {
    final documentSnapshot = await reference.document(id).get();
    return _mapFunction(documentSnapshot);
  }

  Future<List<TItem>> loadAll() async {
    final querySnapshot = await reference.getDocuments();
    return querySnapshot.documents.map(_mapFunction).toList();
  }

  Future<TItem> add(TItem item) async {
    final map = item.toMap();
    final documentReference = await reference.add(map);
    final documentSnapshot = await documentReference.get();
    return _mapFunction(documentSnapshot);
  }

  Future<List<TItem>> where(dynamic field, dynamic isEqualTo) async {
    final querySnapshot = await reference.where(field, isEqualTo: isEqualTo).getDocuments();
    return querySnapshot.documents.map(_mapFunction).toList();
  }
}
