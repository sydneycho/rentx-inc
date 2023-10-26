import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'advertise_widget.dart' show AdvertiseWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdvertiseModel extends FlutterFlowModel<AdvertiseWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  String? _nameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for sellername widget.
  FocusNode? sellernameFocusNode;
  TextEditingController? sellernameController;
  String? Function(BuildContext, String?)? sellernameControllerValidator;
  String? _sellernameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for sellerphonenumber widget.
  FocusNode? sellerphonenumberFocusNode;
  TextEditingController? sellerphonenumberController;
  String? Function(BuildContext, String?)? sellerphonenumberControllerValidator;
  String? _sellerphonenumberControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for selleremail widget.
  FocusNode? selleremailFocusNode;
  TextEditingController? selleremailController;
  String? Function(BuildContext, String?)? selleremailControllerValidator;
  String? _selleremailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for price widget.
  FocusNode? priceFocusNode;
  TextEditingController? priceController;
  String? Function(BuildContext, String?)? priceControllerValidator;
  String? _priceControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nameControllerValidator = _nameControllerValidator;
    sellernameControllerValidator = _sellernameControllerValidator;
    sellerphonenumberControllerValidator =
        _sellerphonenumberControllerValidator;
    selleremailControllerValidator = _selleremailControllerValidator;
    priceControllerValidator = _priceControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    nameFocusNode?.dispose();
    nameController?.dispose();

    sellernameFocusNode?.dispose();
    sellernameController?.dispose();

    sellerphonenumberFocusNode?.dispose();
    sellerphonenumberController?.dispose();

    selleremailFocusNode?.dispose();
    selleremailController?.dispose();

    priceFocusNode?.dispose();
    priceController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
