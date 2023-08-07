import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _cartsum = await secureStorage.getDouble('ff_cartsum') ?? _cartsum;
    });
    await _safeInitAsync(() async {
      _color = await secureStorage.getString('ff_color') ?? _color;
    });
    await _safeInitAsync(() async {
      _cart = (await secureStorage.getStringList('ff_cart'))
              ?.map((path) => path.ref)
              .toList() ??
          _cart;
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
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  double _cartsum = 0;
  double get cartsum => _cartsum;
  set cartsum(double _value) {
    _cartsum = _value;
    secureStorage.setDouble('ff_cartsum', _value);
  }

  void deleteCartsum() {
    secureStorage.delete(key: 'ff_cartsum');
  }

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

  List<DocumentReference> _cart = [];
  List<DocumentReference> get cart => _cart;
  set cart(List<DocumentReference> _value) {
    _cart = _value;
    secureStorage.setStringList('ff_cart', _value.map((x) => x.path).toList());
  }

  void deleteCart() {
    secureStorage.delete(key: 'ff_cart');
  }

  void addToCart(DocumentReference _value) {
    _cart.add(_value);
    secureStorage.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  void removeFromCart(DocumentReference _value) {
    _cart.remove(_value);
    secureStorage.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  void removeAtIndexFromCart(int _index) {
    _cart.removeAt(_index);
    secureStorage.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  void updateCartAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _cart[_index] = updateFn(_cart[_index]);
    secureStorage.setStringList('ff_cart', _cart.map((x) => x.path).toList());
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
