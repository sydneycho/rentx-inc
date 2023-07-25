import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarRecord extends FirestoreRecord {
  CarRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "availability_status" field.
  String? _availabilityStatus;
  String get availabilityStatus => _availabilityStatus ?? '';
  bool hasAvailabilityStatus() => _availabilityStatus != null;

  // "car_back" field.
  String? _carBack;
  String get carBack => _carBack ?? '';
  bool hasCarBack() => _carBack != null;

  // "car_front" field.
  String? _carFront;
  String get carFront => _carFront ?? '';
  bool hasCarFront() => _carFront != null;

  // "car_id" field.
  String? _carId;
  String get carId => _carId ?? '';
  bool hasCarId() => _carId != null;

  // "car_name" field.
  String? _carName;
  String get carName => _carName ?? '';
  bool hasCarName() => _carName != null;

  // "car_video" field.
  String? _carVideo;
  String get carVideo => _carVideo ?? '';
  bool hasCarVideo() => _carVideo != null;

  // "car_status" field.
  String? _carStatus;
  String get carStatus => _carStatus ?? '';
  bool hasCarStatus() => _carStatus != null;

  // "cost_per_day" field.
  double? _costPerDay;
  double get costPerDay => _costPerDay ?? 0.0;
  bool hasCostPerDay() => _costPerDay != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "fuel_type" field.
  String? _fuelType;
  String get fuelType => _fuelType ?? '';
  bool hasFuelType() => _fuelType != null;

  // "listing_status" field.
  String? _listingStatus;
  String get listingStatus => _listingStatus ?? '';
  bool hasListingStatus() => _listingStatus != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "profile_photo" field.
  String? _profilePhoto;
  String get profilePhoto => _profilePhoto ?? '';
  bool hasProfilePhoto() => _profilePhoto != null;

  // "transmission_type" field.
  String? _transmissionType;
  String get transmissionType => _transmissionType ?? '';
  bool hasTransmissionType() => _transmissionType != null;

  // "vendor_email" field.
  String? _vendorEmail;
  String get vendorEmail => _vendorEmail ?? '';
  bool hasVendorEmail() => _vendorEmail != null;

  // "vendor_name" field.
  String? _vendorName;
  String get vendorName => _vendorName ?? '';
  bool hasVendorName() => _vendorName != null;

  // "vendor_photo" field.
  String? _vendorPhoto;
  String get vendorPhoto => _vendorPhoto ?? '';
  bool hasVendorPhoto() => _vendorPhoto != null;

  // "plate_number" field.
  String? _plateNumber;
  String get plateNumber => _plateNumber ?? '';
  bool hasPlateNumber() => _plateNumber != null;

  // "brand_name" field.
  String? _brandName;
  String get brandName => _brandName ?? '';
  bool hasBrandName() => _brandName != null;

  // "district" field.
  String? _district;
  String get district => _district ?? '';
  bool hasDistrict() => _district != null;

  // "car_color" field.
  Color? _carColor;
  Color? get carColor => _carColor;
  bool hasCarColor() => _carColor != null;

  // "booking_status" field.
  String? _bookingStatus;
  String get bookingStatus => _bookingStatus ?? '';
  bool hasBookingStatus() => _bookingStatus != null;

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "vendor_phone_number" field.
  String? _vendorPhoneNumber;
  String get vendorPhoneNumber => _vendorPhoneNumber ?? '';
  bool hasVendorPhoneNumber() => _vendorPhoneNumber != null;

  // "enddate" field.
  DateTime? _enddate;
  DateTime? get enddate => _enddate;
  bool hasEnddate() => _enddate != null;

  // "numberofdays" field.
  int? _numberofdays;
  int get numberofdays => _numberofdays ?? 0;
  bool hasNumberofdays() => _numberofdays != null;

  // "vendor_description" field.
  String? _vendorDescription;
  String get vendorDescription => _vendorDescription ?? '';
  bool hasVendorDescription() => _vendorDescription != null;

  // "car_photos" field.
  List<String>? _carPhotos;
  List<String> get carPhotos => _carPhotos ?? const [];
  bool hasCarPhotos() => _carPhotos != null;

  void _initializeFields() {
    _availabilityStatus = snapshotData['availability_status'] as String?;
    _carBack = snapshotData['car_back'] as String?;
    _carFront = snapshotData['car_front'] as String?;
    _carId = snapshotData['car_id'] as String?;
    _carName = snapshotData['car_name'] as String?;
    _carVideo = snapshotData['car_video'] as String?;
    _carStatus = snapshotData['car_status'] as String?;
    _costPerDay = castToType<double>(snapshotData['cost_per_day']);
    _description = snapshotData['description'] as String?;
    _fuelType = snapshotData['fuel_type'] as String?;
    _listingStatus = snapshotData['listing_status'] as String?;
    _location = snapshotData['location'] as String?;
    _profilePhoto = snapshotData['profile_photo'] as String?;
    _transmissionType = snapshotData['transmission_type'] as String?;
    _vendorEmail = snapshotData['vendor_email'] as String?;
    _vendorName = snapshotData['vendor_name'] as String?;
    _vendorPhoto = snapshotData['vendor_photo'] as String?;
    _plateNumber = snapshotData['plate_number'] as String?;
    _brandName = snapshotData['brand_name'] as String?;
    _district = snapshotData['district'] as String?;
    _carColor = getSchemaColor(snapshotData['car_color']);
    _bookingStatus = snapshotData['booking_status'] as String?;
    _uid = snapshotData['uid'] as DocumentReference?;
    _vendorPhoneNumber = snapshotData['vendor_phone_number'] as String?;
    _enddate = snapshotData['enddate'] as DateTime?;
    _numberofdays = castToType<int>(snapshotData['numberofdays']);
    _vendorDescription = snapshotData['vendor_description'] as String?;
    _carPhotos = getDataList(snapshotData['car_photos']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Car');

  static Stream<CarRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarRecord.fromSnapshot(s));

  static Future<CarRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CarRecord.fromSnapshot(s));

  static CarRecord fromSnapshot(DocumentSnapshot snapshot) => CarRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarRecord._(reference, mapFromFirestore(data));

  static CarRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      CarRecord.getDocumentFromData(
        {
          'availability_status': snapshot.data['availability_status'],
          'car_back': snapshot.data['car_back'],
          'car_front': snapshot.data['car_front'],
          'car_id': snapshot.data['car_id'],
          'car_name': snapshot.data['car_name'],
          'car_video': snapshot.data['car_video'],
          'car_status': snapshot.data['car_status'],
          'cost_per_day': snapshot.data['cost_per_day']?.toDouble(),
          'description': snapshot.data['description'],
          'fuel_type': snapshot.data['fuel_type'],
          'listing_status': snapshot.data['listing_status'],
          'location': snapshot.data['location'],
          'profile_photo': snapshot.data['profile_photo'],
          'transmission_type': snapshot.data['transmission_type'],
          'vendor_email': snapshot.data['vendor_email'],
          'vendor_name': snapshot.data['vendor_name'],
          'vendor_photo': snapshot.data['vendor_photo'],
          'plate_number': snapshot.data['plate_number'],
          'brand_name': snapshot.data['brand_name'],
          'district': snapshot.data['district'],
          'car_color': safeGet(
            () => fromCssColor(snapshot.data['car_color']),
          ),
          'booking_status': snapshot.data['booking_status'],
          'uid': safeGet(
            () => toRef(snapshot.data['uid']),
          ),
          'vendor_phone_number': snapshot.data['vendor_phone_number'],
          'enddate': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(snapshot.data['enddate']),
          ),
          'numberofdays': snapshot.data['numberofdays']?.round(),
          'vendor_description': snapshot.data['vendor_description'],
          'car_photos': safeGet(
            () => snapshot.data['car_photos'].toList(),
          ),
        },
        CarRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<CarRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'Car',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'CarRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarRecordData({
  String? availabilityStatus,
  String? carBack,
  String? carFront,
  String? carId,
  String? carName,
  String? carVideo,
  String? carStatus,
  double? costPerDay,
  String? description,
  String? fuelType,
  String? listingStatus,
  String? location,
  String? profilePhoto,
  String? transmissionType,
  String? vendorEmail,
  String? vendorName,
  String? vendorPhoto,
  String? plateNumber,
  String? brandName,
  String? district,
  Color? carColor,
  String? bookingStatus,
  DocumentReference? uid,
  String? vendorPhoneNumber,
  DateTime? enddate,
  int? numberofdays,
  String? vendorDescription,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'availability_status': availabilityStatus,
      'car_back': carBack,
      'car_front': carFront,
      'car_id': carId,
      'car_name': carName,
      'car_video': carVideo,
      'car_status': carStatus,
      'cost_per_day': costPerDay,
      'description': description,
      'fuel_type': fuelType,
      'listing_status': listingStatus,
      'location': location,
      'profile_photo': profilePhoto,
      'transmission_type': transmissionType,
      'vendor_email': vendorEmail,
      'vendor_name': vendorName,
      'vendor_photo': vendorPhoto,
      'plate_number': plateNumber,
      'brand_name': brandName,
      'district': district,
      'car_color': carColor,
      'booking_status': bookingStatus,
      'uid': uid,
      'vendor_phone_number': vendorPhoneNumber,
      'enddate': enddate,
      'numberofdays': numberofdays,
      'vendor_description': vendorDescription,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarRecordDocumentEquality implements Equality<CarRecord> {
  const CarRecordDocumentEquality();

  @override
  bool equals(CarRecord? e1, CarRecord? e2) {
    const listEquality = ListEquality();
    return e1?.availabilityStatus == e2?.availabilityStatus &&
        e1?.carBack == e2?.carBack &&
        e1?.carFront == e2?.carFront &&
        e1?.carId == e2?.carId &&
        e1?.carName == e2?.carName &&
        e1?.carVideo == e2?.carVideo &&
        e1?.carStatus == e2?.carStatus &&
        e1?.costPerDay == e2?.costPerDay &&
        e1?.description == e2?.description &&
        e1?.fuelType == e2?.fuelType &&
        e1?.listingStatus == e2?.listingStatus &&
        e1?.location == e2?.location &&
        e1?.profilePhoto == e2?.profilePhoto &&
        e1?.transmissionType == e2?.transmissionType &&
        e1?.vendorEmail == e2?.vendorEmail &&
        e1?.vendorName == e2?.vendorName &&
        e1?.vendorPhoto == e2?.vendorPhoto &&
        e1?.plateNumber == e2?.plateNumber &&
        e1?.brandName == e2?.brandName &&
        e1?.district == e2?.district &&
        e1?.carColor == e2?.carColor &&
        e1?.bookingStatus == e2?.bookingStatus &&
        e1?.uid == e2?.uid &&
        e1?.vendorPhoneNumber == e2?.vendorPhoneNumber &&
        e1?.enddate == e2?.enddate &&
        e1?.numberofdays == e2?.numberofdays &&
        e1?.vendorDescription == e2?.vendorDescription &&
        listEquality.equals(e1?.carPhotos, e2?.carPhotos);
  }

  @override
  int hash(CarRecord? e) => const ListEquality().hash([
        e?.availabilityStatus,
        e?.carBack,
        e?.carFront,
        e?.carId,
        e?.carName,
        e?.carVideo,
        e?.carStatus,
        e?.costPerDay,
        e?.description,
        e?.fuelType,
        e?.listingStatus,
        e?.location,
        e?.profilePhoto,
        e?.transmissionType,
        e?.vendorEmail,
        e?.vendorName,
        e?.vendorPhoto,
        e?.plateNumber,
        e?.brandName,
        e?.district,
        e?.carColor,
        e?.bookingStatus,
        e?.uid,
        e?.vendorPhoneNumber,
        e?.enddate,
        e?.numberofdays,
        e?.vendorDescription,
        e?.carPhotos
      ]);

  @override
  bool isValidKey(Object? o) => o is CarRecord;
}
