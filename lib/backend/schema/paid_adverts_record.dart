import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaidAdvertsRecord extends FirestoreRecord {
  PaidAdvertsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "modified_at" field.
  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _modifiedAt;
  bool hasModifiedAt() => _modifiedAt != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "seller_price" field.
  double? _sellerPrice;
  double get sellerPrice => _sellerPrice ?? 0.0;
  bool hasSellerPrice() => _sellerPrice != null;

  // "seller_name" field.
  String? _sellerName;
  String get sellerName => _sellerName ?? '';
  bool hasSellerName() => _sellerName != null;

  // "seller_email" field.
  String? _sellerEmail;
  String get sellerEmail => _sellerEmail ?? '';
  bool hasSellerEmail() => _sellerEmail != null;

  // "seller_phone_number" field.
  String? _sellerPhoneNumber;
  String get sellerPhoneNumber => _sellerPhoneNumber ?? '';
  bool hasSellerPhoneNumber() => _sellerPhoneNumber != null;

  // "seller_photo" field.
  String? _sellerPhoto;
  String get sellerPhoto => _sellerPhoto ?? '';
  bool hasSellerPhoto() => _sellerPhoto != null;

  // "thumb" field.
  String? _thumb;
  String get thumb => _thumb ?? '';
  bool hasThumb() => _thumb != null;

  // "on_sale" field.
  bool? _onSale;
  bool get onSale => _onSale ?? false;
  bool hasOnSale() => _onSale != null;

  // "advert_status" field.
  String? _advertStatus;
  String get advertStatus => _advertStatus ?? '';
  bool hasAdvertStatus() => _advertStatus != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _modifiedAt = snapshotData['modified_at'] as DateTime?;
    _name = snapshotData['name'] as String?;
    _sellerPrice = castToType<double>(snapshotData['seller_price']);
    _sellerName = snapshotData['seller_name'] as String?;
    _sellerEmail = snapshotData['seller_email'] as String?;
    _sellerPhoneNumber = snapshotData['seller_phone_number'] as String?;
    _sellerPhoto = snapshotData['seller_photo'] as String?;
    _thumb = snapshotData['thumb'] as String?;
    _onSale = snapshotData['on_sale'] as bool?;
    _advertStatus = snapshotData['advert_status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('paid_adverts');

  static Stream<PaidAdvertsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaidAdvertsRecord.fromSnapshot(s));

  static Future<PaidAdvertsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaidAdvertsRecord.fromSnapshot(s));

  static PaidAdvertsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaidAdvertsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaidAdvertsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaidAdvertsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaidAdvertsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaidAdvertsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaidAdvertsRecordData({
  DateTime? createdAt,
  DateTime? modifiedAt,
  String? name,
  double? sellerPrice,
  String? sellerName,
  String? sellerEmail,
  String? sellerPhoneNumber,
  String? sellerPhoto,
  String? thumb,
  bool? onSale,
  String? advertStatus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'modified_at': modifiedAt,
      'name': name,
      'seller_price': sellerPrice,
      'seller_name': sellerName,
      'seller_email': sellerEmail,
      'seller_phone_number': sellerPhoneNumber,
      'seller_photo': sellerPhoto,
      'thumb': thumb,
      'on_sale': onSale,
      'advert_status': advertStatus,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaidAdvertsRecordDocumentEquality implements Equality<PaidAdvertsRecord> {
  const PaidAdvertsRecordDocumentEquality();

  @override
  bool equals(PaidAdvertsRecord? e1, PaidAdvertsRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.modifiedAt == e2?.modifiedAt &&
        e1?.name == e2?.name &&
        e1?.sellerPrice == e2?.sellerPrice &&
        e1?.sellerName == e2?.sellerName &&
        e1?.sellerEmail == e2?.sellerEmail &&
        e1?.sellerPhoneNumber == e2?.sellerPhoneNumber &&
        e1?.sellerPhoto == e2?.sellerPhoto &&
        e1?.thumb == e2?.thumb &&
        e1?.onSale == e2?.onSale &&
        e1?.advertStatus == e2?.advertStatus;
  }

  @override
  int hash(PaidAdvertsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.modifiedAt,
        e?.name,
        e?.sellerPrice,
        e?.sellerName,
        e?.sellerEmail,
        e?.sellerPhoneNumber,
        e?.sellerPhoto,
        e?.thumb,
        e?.onSale,
        e?.advertStatus
      ]);

  @override
  bool isValidKey(Object? o) => o is PaidAdvertsRecord;
}
