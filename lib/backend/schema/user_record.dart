import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "district" field.
  String? _district;
  String get district => _district ?? '';
  bool hasDistrict() => _district != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "is_admin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "is_host" field.
  bool? _isHost;
  bool get isHost => _isHost ?? false;
  bool hasIsHost() => _isHost != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "user_status" field.
  String? _userStatus;
  String get userStatus => _userStatus ?? '';
  bool hasUserStatus() => _userStatus != null;

  // "user_type" field.
  String? _userType;
  String get userType => _userType ?? '';
  bool hasUserType() => _userType != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "Modified_time" field.
  DateTime? _modifiedTime;
  DateTime? get modifiedTime => _modifiedTime;
  bool hasModifiedTime() => _modifiedTime != null;

  // "dob" field.
  DateTime? _dob;
  DateTime? get dob => _dob;
  bool hasDob() => _dob != null;

  // "user_refs" field.
  List<DocumentReference>? _userRefs;
  List<DocumentReference> get userRefs => _userRefs ?? const [];
  bool hasUserRefs() => _userRefs != null;

  // "referral_link" field.
  String? _referralLink;
  String get referralLink => _referralLink ?? '';
  bool hasReferralLink() => _referralLink != null;

  // "push_notification" field.
  bool? _pushNotification;
  bool get pushNotification => _pushNotification ?? false;
  bool hasPushNotification() => _pushNotification != null;

  // "email_notification" field.
  bool? _emailNotification;
  bool get emailNotification => _emailNotification ?? false;
  bool hasEmailNotification() => _emailNotification != null;

  // "location_services" field.
  bool? _locationServices;
  bool get locationServices => _locationServices ?? false;
  bool hasLocationServices() => _locationServices != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _address = snapshotData['address'] as String?;
    _bio = snapshotData['bio'] as String?;
    _district = snapshotData['district'] as String?;
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _isAdmin = snapshotData['is_admin'] as bool?;
    _isHost = snapshotData['is_host'] as bool?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _userStatus = snapshotData['user_status'] as String?;
    _userType = snapshotData['user_type'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _modifiedTime = snapshotData['Modified_time'] as DateTime?;
    _dob = snapshotData['dob'] as DateTime?;
    _userRefs = getDataList(snapshotData['user_refs']);
    _referralLink = snapshotData['referral_link'] as String?;
    _pushNotification = snapshotData['push_notification'] as bool?;
    _emailNotification = snapshotData['email_notification'] as bool?;
    _locationServices = snapshotData['location_services'] as bool?;
    _time = snapshotData['time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('User');

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  String? phoneNumber,
  String? address,
  String? bio,
  String? district,
  String? firstName,
  String? lastName,
  bool? isAdmin,
  bool? isHost,
  DocumentReference? userRef,
  String? userStatus,
  String? userType,
  DateTime? createdTime,
  DateTime? modifiedTime,
  DateTime? dob,
  String? referralLink,
  bool? pushNotification,
  bool? emailNotification,
  bool? locationServices,
  DateTime? time,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'phone_number': phoneNumber,
      'address': address,
      'bio': bio,
      'district': district,
      'first_name': firstName,
      'last_name': lastName,
      'is_admin': isAdmin,
      'is_host': isHost,
      'user_ref': userRef,
      'user_status': userStatus,
      'user_type': userType,
      'created_time': createdTime,
      'Modified_time': modifiedTime,
      'dob': dob,
      'referral_link': referralLink,
      'push_notification': pushNotification,
      'email_notification': emailNotification,
      'location_services': locationServices,
      'time': time,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRecordDocumentEquality implements Equality<UserRecord> {
  const UserRecordDocumentEquality();

  @override
  bool equals(UserRecord? e1, UserRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.address == e2?.address &&
        e1?.bio == e2?.bio &&
        e1?.district == e2?.district &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.isAdmin == e2?.isAdmin &&
        e1?.isHost == e2?.isHost &&
        e1?.userRef == e2?.userRef &&
        e1?.userStatus == e2?.userStatus &&
        e1?.userType == e2?.userType &&
        e1?.createdTime == e2?.createdTime &&
        e1?.modifiedTime == e2?.modifiedTime &&
        e1?.dob == e2?.dob &&
        listEquality.equals(e1?.userRefs, e2?.userRefs) &&
        e1?.referralLink == e2?.referralLink &&
        e1?.pushNotification == e2?.pushNotification &&
        e1?.emailNotification == e2?.emailNotification &&
        e1?.locationServices == e2?.locationServices &&
        e1?.time == e2?.time;
  }

  @override
  int hash(UserRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.phoneNumber,
        e?.address,
        e?.bio,
        e?.district,
        e?.firstName,
        e?.lastName,
        e?.isAdmin,
        e?.isHost,
        e?.userRef,
        e?.userStatus,
        e?.userType,
        e?.createdTime,
        e?.modifiedTime,
        e?.dob,
        e?.userRefs,
        e?.referralLink,
        e?.pushNotification,
        e?.emailNotification,
        e?.locationServices,
        e?.time
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
