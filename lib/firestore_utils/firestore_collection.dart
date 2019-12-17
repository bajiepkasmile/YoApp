import 'package:cloud_firestore/cloud_firestore.dart';

typedef DocumentSnapshotMapFunction<TItem> = TItem Function(DocumentSnapshot);

/// Представление коллекции в Firestore.
class FirestoreCollection<TItem> {
  final CollectionReference reference;
  final DocumentSnapshotMapFunction<TItem> _mapFunction;

  FirestoreCollection(this.reference, this._mapFunction);

  Future<TItem> load(String id) async => _mapFunction(await reference.document(id).get());

  Future<List<TItem>> loadAll() async {
    final querySnapshot = await reference.getDocuments();
    return querySnapshot.documents.map(_mapFunction).toList();
  }
}
