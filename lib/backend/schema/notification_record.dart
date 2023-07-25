import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationRecord extends FirestoreRecord {
  NotificationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "notification_message" field.
  String? _notificationMessage;
  String get notificationMessage => _notificationMessage ?? '';
  bool hasNotificationMessage() => _notificationMessage != null;

  // "notification_name" field.
  String? _notificationName;
  String get notificationName => _notificationName ?? '';
  bool hasNotificationName() => _notificationName != null;

  // "notification_status" field.
  String? _notificationStatus;
  String get notificationStatus => _notificationStatus ?? '';
  bool hasNotificationStatus() => _notificationStatus != null;

  // "post_status" field.
  String? _postStatus;
  String get postStatus => _postStatus ?? '';
  bool hasPostStatus() => _postStatus != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _notificationMessage = snapshotData['notification_message'] as String?;
    _notificationName = snapshotData['notification_name'] as String?;
    _notificationStatus = snapshotData['notification_status'] as String?;
    _postStatus = snapshotData['post_status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Notification');

  static Stream<NotificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationRecord.fromSnapshot(s));

  static Future<NotificationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationRecord.fromSnapshot(s));

  static NotificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationRecordData({
  DateTime? createdAt,
  String? notificationMessage,
  String? notificationName,
  String? notificationStatus,
  String? postStatus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'notification_message': notificationMessage,
      'notification_name': notificationName,
      'notification_status': notificationStatus,
      'post_status': postStatus,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationRecordDocumentEquality
    implements Equality<NotificationRecord> {
  const NotificationRecordDocumentEquality();

  @override
  bool equals(NotificationRecord? e1, NotificationRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.notificationMessage == e2?.notificationMessage &&
        e1?.notificationName == e2?.notificationName &&
        e1?.notificationStatus == e2?.notificationStatus &&
        e1?.postStatus == e2?.postStatus;
  }

  @override
  int hash(NotificationRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.notificationMessage,
        e?.notificationName,
        e?.notificationStatus,
        e?.postStatus
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationRecord;
}
