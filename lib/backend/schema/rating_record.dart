import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RatingRecord extends FirestoreRecord {
  RatingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "review" field.
  String? _review;
  String get review => _review ?? '';
  bool hasReview() => _review != null;

  // "review_photo" field.
  String? _reviewPhoto;
  String get reviewPhoto => _reviewPhoto ?? '';
  bool hasReviewPhoto() => _reviewPhoto != null;

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "review_name" field.
  String? _reviewName;
  String get reviewName => _reviewName ?? '';
  bool hasReviewName() => _reviewName != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _review = snapshotData['review'] as String?;
    _reviewPhoto = snapshotData['review_photo'] as String?;
    _uid = snapshotData['uid'] as DocumentReference?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _reviewName = snapshotData['review_name'] as String?;
    _rating = castToType<int>(snapshotData['rating']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('rating')
          : FirebaseFirestore.instance.collectionGroup('rating');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('rating').doc();

  static Stream<RatingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RatingRecord.fromSnapshot(s));

  static Future<RatingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RatingRecord.fromSnapshot(s));

  static RatingRecord fromSnapshot(DocumentSnapshot snapshot) => RatingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RatingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RatingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RatingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RatingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRatingRecordData({
  String? review,
  String? reviewPhoto,
  DocumentReference? uid,
  DateTime? createdTime,
  String? reviewName,
  int? rating,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'review': review,
      'review_photo': reviewPhoto,
      'uid': uid,
      'created_time': createdTime,
      'review_name': reviewName,
      'rating': rating,
    }.withoutNulls,
  );

  return firestoreData;
}

class RatingRecordDocumentEquality implements Equality<RatingRecord> {
  const RatingRecordDocumentEquality();

  @override
  bool equals(RatingRecord? e1, RatingRecord? e2) {
    return e1?.review == e2?.review &&
        e1?.reviewPhoto == e2?.reviewPhoto &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.reviewName == e2?.reviewName &&
        e1?.rating == e2?.rating;
  }

  @override
  int hash(RatingRecord? e) => const ListEquality().hash([
        e?.review,
        e?.reviewPhoto,
        e?.uid,
        e?.createdTime,
        e?.reviewName,
        e?.rating
      ]);

  @override
  bool isValidKey(Object? o) => o is RatingRecord;
}
