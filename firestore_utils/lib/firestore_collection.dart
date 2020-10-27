import 'package:cloud_firestore/cloud_firestore.dart';

import 'document_snapshot_map_function.dart';
import 'firestore_object.dart';
import 'firestore_query.dart';

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

  FirestoreQuery<TItem> where(
      dynamic field,
      {
        dynamic isEqualTo,
        dynamic isLessThan,
        dynamic isLessThanOrEqualTo,
        dynamic isGreaterThan,
        dynamic isGreaterThanOrEqualTo,
        dynamic arrayContains,
        List<dynamic> arrayContainsAny,
        List<dynamic> whereIn,
        bool isNull,
      }
  ) {
    final query = reference.where(
        field,
        isEqualTo: isEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        isNull: isNull
    );
    return FirestoreQuery<TItem>(query, _mapFunction);
  }
}
