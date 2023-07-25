import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CardDetailsRecord extends FirestoreRecord {
  CardDetailsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Billing_address" field.
  String? _billingAddress;
  String get billingAddress => _billingAddress ?? '';
  bool hasBillingAddress() => _billingAddress != null;

  // "Card_No" field.
  int? _cardNo;
  int get cardNo => _cardNo ?? 0;
  bool hasCardNo() => _cardNo != null;

  // "full_name" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  bool hasFullName() => _fullName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "Name_On_Card" field.
  String? _nameOnCard;
  String get nameOnCard => _nameOnCard ?? '';
  bool hasNameOnCard() => _nameOnCard != null;

  // "CVV" field.
  int? _cvv;
  int get cvv => _cvv ?? 0;
  bool hasCvv() => _cvv != null;

  // "expiry_date" field.
  String? _expiryDate;
  String get expiryDate => _expiryDate ?? '';
  bool hasExpiryDate() => _expiryDate != null;

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _billingAddress = snapshotData['Billing_address'] as String?;
    _cardNo = castToType<int>(snapshotData['Card_No']);
    _fullName = snapshotData['full_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _nameOnCard = snapshotData['Name_On_Card'] as String?;
    _cvv = castToType<int>(snapshotData['CVV']);
    _expiryDate = snapshotData['expiry_date'] as String?;
    _uid = snapshotData['uid'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Card_details');

  static Stream<CardDetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CardDetailsRecord.fromSnapshot(s));

  static Future<CardDetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CardDetailsRecord.fromSnapshot(s));

  static CardDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CardDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CardDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CardDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CardDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CardDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCardDetailsRecordData({
  String? billingAddress,
  int? cardNo,
  String? fullName,
  String? phoneNumber,
  String? nameOnCard,
  int? cvv,
  String? expiryDate,
  DocumentReference? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Billing_address': billingAddress,
      'Card_No': cardNo,
      'full_name': fullName,
      'phone_number': phoneNumber,
      'Name_On_Card': nameOnCard,
      'CVV': cvv,
      'expiry_date': expiryDate,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class CardDetailsRecordDocumentEquality implements Equality<CardDetailsRecord> {
  const CardDetailsRecordDocumentEquality();

  @override
  bool equals(CardDetailsRecord? e1, CardDetailsRecord? e2) {
    return e1?.billingAddress == e2?.billingAddress &&
        e1?.cardNo == e2?.cardNo &&
        e1?.fullName == e2?.fullName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.nameOnCard == e2?.nameOnCard &&
        e1?.cvv == e2?.cvv &&
        e1?.expiryDate == e2?.expiryDate &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(CardDetailsRecord? e) => const ListEquality().hash([
        e?.billingAddress,
        e?.cardNo,
        e?.fullName,
        e?.phoneNumber,
        e?.nameOnCard,
        e?.cvv,
        e?.expiryDate,
        e?.uid
      ]);

  @override
  bool isValidKey(Object? o) => o is CardDetailsRecord;
}
