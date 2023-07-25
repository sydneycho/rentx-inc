import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HostRecord extends FirestoreRecord {
  HostRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id_card_back" field.
  String? _idCardBack;
  String get idCardBack => _idCardBack ?? '';
  bool hasIdCardBack() => _idCardBack != null;

  // "id_card_front" field.
  String? _idCardFront;
  String get idCardFront => _idCardFront ?? '';
  bool hasIdCardFront() => _idCardFront != null;

  // "insurance_photo" field.
  String? _insurancePhoto;
  String get insurancePhoto => _insurancePhoto ?? '';
  bool hasInsurancePhoto() => _insurancePhoto != null;

  // "licence" field.
  String? _licence;
  String get licence => _licence ?? '';
  bool hasLicence() => _licence != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _idCardBack = snapshotData['id_card_back'] as String?;
    _idCardFront = snapshotData['id_card_front'] as String?;
    _insurancePhoto = snapshotData['insurance_photo'] as String?;
    _licence = snapshotData['licence'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('host')
          : FirebaseFirestore.instance.collectionGroup('host');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('host').doc();

  static Stream<HostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HostRecord.fromSnapshot(s));

  static Future<HostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HostRecord.fromSnapshot(s));

  static HostRecord fromSnapshot(DocumentSnapshot snapshot) => HostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHostRecordData({
  String? idCardBack,
  String? idCardFront,
  String? insurancePhoto,
  String? licence,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_card_back': idCardBack,
      'id_card_front': idCardFront,
      'insurance_photo': insurancePhoto,
      'licence': licence,
    }.withoutNulls,
  );

  return firestoreData;
}

class HostRecordDocumentEquality implements Equality<HostRecord> {
  const HostRecordDocumentEquality();

  @override
  bool equals(HostRecord? e1, HostRecord? e2) {
    return e1?.idCardBack == e2?.idCardBack &&
        e1?.idCardFront == e2?.idCardFront &&
        e1?.insurancePhoto == e2?.insurancePhoto &&
        e1?.licence == e2?.licence;
  }

  @override
  int hash(HostRecord? e) => const ListEquality()
      .hash([e?.idCardBack, e?.idCardFront, e?.insurancePhoto, e?.licence]);

  @override
  bool isValidKey(Object? o) => o is HostRecord;
}
