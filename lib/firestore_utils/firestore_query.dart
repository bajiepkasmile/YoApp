import 'package:cloud_firestore/cloud_firestore.dart';

import 'docunent_snapshot_map_function.dart';
import 'firestore_object.dart';

class FirestoreQuery<TItem extends FirestoreObject> {

  final Query _query;
  final DocumentSnapshotMapFunction<TItem> _mapFunction;

  FirestoreQuery(this._query, this._mapFunction);

  Future<List<TItem>> loadAll() async {
    final querySnapshot = await _query.getDocuments();
    return querySnapshot.documents.map(_mapFunction).toList();
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
    final query = _query.where(
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
    return FirestoreQuery(query, _mapFunction);
  }
}
