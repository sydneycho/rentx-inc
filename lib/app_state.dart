import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _color = await secureStorage.getString('ff_color') ?? _color;
    });
    await _safeInitAsync(() async {
      _favorite = (await secureStorage.getStringList('ff_favorite'))
              ?.map((path) => path.ref)
              .toList() ??
          _favorite;
    });
    await _safeInitAsync(() async {
      _notification = (await secureStorage.getStringList('ff_notification'))
              ?.map((path) => path.ref)
              .toList() ??
          _notification;
    });
    await _safeInitAsync(() async {
      _userRef = (await secureStorage.getString('ff_userRef'))?.ref ?? _userRef;
    });
    await _safeInitAsync(() async {
      _notifications =
          (await secureStorage.getString('ff_notifications'))?.ref ??
              _notifications;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  int _size = 0;
  int get size => _size;
  set size(int _value) {
    _size = _value;
  }

  String _color = '';
  String get color => _color;
  set color(String _value) {
    _color = _value;
    secureStorage.setString('ff_color', _value);
  }

  void deleteColor() {
    secureStorage.delete(key: 'ff_color');
  }

  bool _searchonof = false;
  bool get searchonof => _searchonof;
  set searchonof(bool _value) {
    _searchonof = _value;
  }

  List<DocumentReference> _favorite = [];
  List<DocumentReference> get favorite => _favorite;
  set favorite(List<DocumentReference> _value) {
    _favorite = _value;
    secureStorage.setStringList(
        'ff_favorite', _value.map((x) => x.path).toList());
  }

  void deleteFavorite() {
    secureStorage.delete(key: 'ff_favorite');
  }

  void addToFavorite(DocumentReference _value) {
    _favorite.add(_value);
    secureStorage.setStringList(
        'ff_favorite', _favorite.map((x) => x.path).toList());
  }

  void removeFromFavorite(DocumentReference _value) {
    _favorite.remove(_value);
    secureStorage.setStringList(
        'ff_favorite', _favorite.map((x) => x.path).toList());
  }

  void removeAtIndexFromFavorite(int _index) {
    _favorite.removeAt(_index);
    secureStorage.setStringList(
        'ff_favorite', _favorite.map((x) => x.path).toList());
  }

  void updateFavoriteAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _favorite[_index] = updateFn(_favorite[_index]);
    secureStorage.setStringList(
        'ff_favorite', _favorite.map((x) => x.path).toList());
  }

  void insertAtIndexInFavorite(int _index, DocumentReference _value) {
    _favorite.insert(_index, _value);
    secureStorage.setStringList(
        'ff_favorite', _favorite.map((x) => x.path).toList());
  }

  DocumentReference? _carpay = FirebaseFirestore.instance.doc('/Car/car_list');
  DocumentReference? get carpay => _carpay;
  set carpay(DocumentReference? _value) {
    _carpay = _value;
  }

  List<DocumentReference> _notification = [];
  List<DocumentReference> get notification => _notification;
  set notification(List<DocumentReference> _value) {
    _notification = _value;
    secureStorage.setStringList(
        'ff_notification', _value.map((x) => x.path).toList());
  }

  void deleteNotification() {
    secureStorage.delete(key: 'ff_notification');
  }

  void addToNotification(DocumentReference _value) {
    _notification.add(_value);
    secureStorage.setStringList(
        'ff_notification', _notification.map((x) => x.path).toList());
  }

  void removeFromNotification(DocumentReference _value) {
    _notification.remove(_value);
    secureStorage.setStringList(
        'ff_notification', _notification.map((x) => x.path).toList());
  }

  void removeAtIndexFromNotification(int _index) {
    _notification.removeAt(_index);
    secureStorage.setStringList(
        'ff_notification', _notification.map((x) => x.path).toList());
  }

  void updateNotificationAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _notification[_index] = updateFn(_notification[_index]);
    secureStorage.setStringList(
        'ff_notification', _notification.map((x) => x.path).toList());
  }

  void insertAtIndexInNotification(int _index, DocumentReference _value) {
    _notification.insert(_index, _value);
    secureStorage.setStringList(
        'ff_notification', _notification.map((x) => x.path).toList());
  }

  bool _Answer1 = false;
  bool get Answer1 => _Answer1;
  set Answer1(bool _value) {
    _Answer1 = _value;
  }

  bool _Answer2 = false;
  bool get Answer2 => _Answer2;
  set Answer2(bool _value) {
    _Answer2 = _value;
  }

  bool _Answer3 = false;
  bool get Answer3 => _Answer3;
  set Answer3(bool _value) {
    _Answer3 = _value;
  }

  bool _Answer4 = false;
  bool get Answer4 => _Answer4;
  set Answer4(bool _value) {
    _Answer4 = _value;
  }

  DocumentReference? _userRef =
      FirebaseFirestore.instance.doc('/User/user_list');
  DocumentReference? get userRef => _userRef;
  set userRef(DocumentReference? _value) {
    _userRef = _value;
    _value != null
        ? secureStorage.setString('ff_userRef', _value.path)
        : secureStorage.remove('ff_userRef');
  }

  void deleteUserRef() {
    secureStorage.delete(key: 'ff_userRef');
  }

  DocumentReference? _notifications =
      FirebaseFirestore.instance.doc('/Notification/notification');
  DocumentReference? get notifications => _notifications;
  set notifications(DocumentReference? _value) {
    _notifications = _value;
    _value != null
        ? secureStorage.setString('ff_notifications', _value.path)
        : secureStorage.remove('ff_notifications');
  }

  void deleteNotifications() {
    secureStorage.delete(key: 'ff_notifications');
  }

  double _subtotal = 0.0;
  double get subtotal => _subtotal;
  set subtotal(double _value) {
    _subtotal = _value;
  }

  double _Totalcost = 0.0;
  double get Totalcost => _Totalcost;
  set Totalcost(double _value) {
    _Totalcost = _value;
  }

  DateTime? _enddate = DateTime.fromMillisecondsSinceEpoch(1698312360000);
  DateTime? get enddate => _enddate;
  set enddate(DateTime? _value) {
    _enddate = _value;
  }

  DateTime? _startend = DateTime.fromMillisecondsSinceEpoch(1698312360000);
  DateTime? get startend => _startend;
  set startend(DateTime? _value) {
    _startend = _value;
  }

  final _paidadvertsManager = StreamRequestManager<List<PaidAdvertsRecord>>();
  Stream<List<PaidAdvertsRecord>> paidadverts({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<PaidAdvertsRecord>> Function() requestFn,
  }) =>
      _paidadvertsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPaidadvertsCache() => _paidadvertsManager.clear();
  void clearPaidadvertsCacheKey(String? uniqueKey) =>
      _paidadvertsManager.clearRequest(uniqueKey);

  final _carsManager = StreamRequestManager<List<CarRecord>>();
  Stream<List<CarRecord>> cars({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CarRecord>> Function() requestFn,
  }) =>
      _carsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCarsCache() => _carsManager.clear();
  void clearCarsCacheKey(String? uniqueKey) =>
      _carsManager.clearRequest(uniqueKey);

  final _carDetailsManager = StreamRequestManager<CarRecord>();
  Stream<CarRecord> carDetails({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<CarRecord> Function() requestFn,
  }) =>
      _carDetailsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCarDetailsCache() => _carDetailsManager.clear();
  void clearCarDetailsCacheKey(String? uniqueKey) =>
      _carDetailsManager.clearRequest(uniqueKey);

  final _tripsManager = FutureRequestManager<int>();
  Future<int> trips({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<int> Function() requestFn,
  }) =>
      _tripsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTripsCache() => _tripsManager.clear();
  void clearTripsCacheKey(String? uniqueKey) =>
      _tripsManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
