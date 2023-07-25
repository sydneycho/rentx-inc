import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReservedRecord extends FirestoreRecord {
  ReservedRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "booking_status" field.
  String? _bookingStatus;
  String get bookingStatus => _bookingStatus ?? '';
  bool hasBookingStatus() => _bookingStatus != null;

  // "subtotal" field.
  double? _subtotal;
  double get subtotal => _subtotal ?? 0.0;
  bool hasSubtotal() => _subtotal != null;

  // "startdate" field.
  DateTime? _startdate;
  DateTime? get startdate => _startdate;
  bool hasStartdate() => _startdate != null;

  // "enddate" field.
  DateTime? _enddate;
  DateTime? get enddate => _enddate;
  bool hasEnddate() => _enddate != null;

  // "totalcost" field.
  double? _totalcost;
  double get totalcost => _totalcost ?? 0.0;
  bool hasTotalcost() => _totalcost != null;

  // "numberofdays" field.
  int? _numberofdays;
  int get numberofdays => _numberofdays ?? 0;
  bool hasNumberofdays() => _numberofdays != null;

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "rentee_name" field.
  String? _renteeName;
  String get renteeName => _renteeName ?? '';
  bool hasRenteeName() => _renteeName != null;

  // "rentee_email" field.
  String? _renteeEmail;
  String get renteeEmail => _renteeEmail ?? '';
  bool hasRenteeEmail() => _renteeEmail != null;

  // "rentee_phone_number" field.
  String? _renteePhoneNumber;
  String get renteePhoneNumber => _renteePhoneNumber ?? '';
  bool hasRenteePhoneNumber() => _renteePhoneNumber != null;

  // "rentee_photo" field.
  String? _renteePhoto;
  String get renteePhoto => _renteePhoto ?? '';
  bool hasRenteePhoto() => _renteePhoto != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _bookingStatus = snapshotData['booking_status'] as String?;
    _subtotal = castToType<double>(snapshotData['subtotal']);
    _startdate = snapshotData['startdate'] as DateTime?;
    _enddate = snapshotData['enddate'] as DateTime?;
    _totalcost = castToType<double>(snapshotData['totalcost']);
    _numberofdays = castToType<int>(snapshotData['numberofdays']);
    _uid = snapshotData['uid'] as DocumentReference?;
    _renteeName = snapshotData['rentee_name'] as String?;
    _renteeEmail = snapshotData['rentee_email'] as String?;
    _renteePhoneNumber = snapshotData['rentee_phone_number'] as String?;
    _renteePhoto = snapshotData['rentee_photo'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('reserved')
          : FirebaseFirestore.instance.collectionGroup('reserved');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('reserved').doc();

  static Stream<ReservedRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReservedRecord.fromSnapshot(s));

  static Future<ReservedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReservedRecord.fromSnapshot(s));

  static ReservedRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReservedRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReservedRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReservedRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReservedRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReservedRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReservedRecordData({
  String? bookingStatus,
  double? subtotal,
  DateTime? startdate,
  DateTime? enddate,
  double? totalcost,
  int? numberofdays,
  DocumentReference? uid,
  String? renteeName,
  String? renteeEmail,
  String? renteePhoneNumber,
  String? renteePhoto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'booking_status': bookingStatus,
      'subtotal': subtotal,
      'startdate': startdate,
      'enddate': enddate,
      'totalcost': totalcost,
      'numberofdays': numberofdays,
      'uid': uid,
      'rentee_name': renteeName,
      'rentee_email': renteeEmail,
      'rentee_phone_number': renteePhoneNumber,
      'rentee_photo': renteePhoto,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReservedRecordDocumentEquality implements Equality<ReservedRecord> {
  const ReservedRecordDocumentEquality();

  @override
  bool equals(ReservedRecord? e1, ReservedRecord? e2) {
    return e1?.bookingStatus == e2?.bookingStatus &&
        e1?.subtotal == e2?.subtotal &&
        e1?.startdate == e2?.startdate &&
        e1?.enddate == e2?.enddate &&
        e1?.totalcost == e2?.totalcost &&
        e1?.numberofdays == e2?.numberofdays &&
        e1?.uid == e2?.uid &&
        e1?.renteeName == e2?.renteeName &&
        e1?.renteeEmail == e2?.renteeEmail &&
        e1?.renteePhoneNumber == e2?.renteePhoneNumber &&
        e1?.renteePhoto == e2?.renteePhoto;
  }

  @override
  int hash(ReservedRecord? e) => const ListEquality().hash([
        e?.bookingStatus,
        e?.subtotal,
        e?.startdate,
        e?.enddate,
        e?.totalcost,
        e?.numberofdays,
        e?.uid,
        e?.renteeName,
        e?.renteeEmail,
        e?.renteePhoneNumber,
        e?.renteePhoto
      ]);

  @override
  bool isValidKey(Object? o) => o is ReservedRecord;
}
