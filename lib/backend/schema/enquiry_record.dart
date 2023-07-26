import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EnquiryRecord extends FirestoreRecord {
  EnquiryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "service_type" field.
  String? _serviceType;
  String get serviceType => _serviceType ?? '';
  bool hasServiceType() => _serviceType != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "user_type" field.
  String? _userType;
  String get userType => _userType ?? '';
  bool hasUserType() => _userType != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _description = snapshotData['description'] as String?;
    _name = snapshotData['name'] as String?;
    _serviceType = snapshotData['service_type'] as String?;
    _status = snapshotData['status'] as String?;
    _userType = snapshotData['user_type'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Enquiry');

  static Stream<EnquiryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EnquiryRecord.fromSnapshot(s));

  static Future<EnquiryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EnquiryRecord.fromSnapshot(s));

  static EnquiryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EnquiryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EnquiryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EnquiryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EnquiryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EnquiryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEnquiryRecordData({
  DateTime? date,
  String? description,
  String? name,
  String? serviceType,
  String? status,
  String? userType,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'description': description,
      'name': name,
      'service_type': serviceType,
      'status': status,
      'user_type': userType,
      'user_ref': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class EnquiryRecordDocumentEquality implements Equality<EnquiryRecord> {
  const EnquiryRecordDocumentEquality();

  @override
  bool equals(EnquiryRecord? e1, EnquiryRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.description == e2?.description &&
        e1?.name == e2?.name &&
        e1?.serviceType == e2?.serviceType &&
        e1?.status == e2?.status &&
        e1?.userType == e2?.userType &&
        e1?.userRef == e2?.userRef;
  }

  @override
  int hash(EnquiryRecord? e) => const ListEquality().hash([
        e?.date,
        e?.description,
        e?.name,
        e?.serviceType,
        e?.status,
        e?.userType,
        e?.userRef
      ]);

  @override
  bool isValidKey(Object? o) => o is EnquiryRecord;
}
