import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddCarModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Car_name widget.
  TextEditingController? carNameController;
  String? Function(BuildContext, String?)? carNameControllerValidator;
  String? _carNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return ' Car name field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for lastName widget.
  TextEditingController? lastNameController;
  String? Function(BuildContext, String?)? lastNameControllerValidator;
  String? _lastNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Brand name field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for costperday widget.
  TextEditingController? costperdayController;
  String? Function(BuildContext, String?)? costperdayControllerValidator;
  String? _costperdayControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Cost per day field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for number widget.
  TextEditingController? numberController;
  String? Function(BuildContext, String?)? numberControllerValidator;
  String? _numberControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Plate number field is required';
    }

    return null;
  }

  // State field(s) for Color widget.
  TextEditingController? colorController;
  String? Function(BuildContext, String?)? colorControllerValidator;
  String? _colorControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Color field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }
    if (val.length > 8) {
      return 'Maximum 8 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for address widget.
  TextEditingController? addressController;
  String? Function(BuildContext, String?)? addressControllerValidator;
  String? _addressControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Address field is required';
    }

    if (val.length < 5) {
      return 'Requires at least 5 characters.';
    }
    if (val.length > 50) {
      return 'Maximum 50 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for Transmission widget.
  String? transmissionValue;
  FormFieldController<String>? transmissionValueController;
  // State field(s) for fueltype widget.
  String? fueltypeValue;
  FormFieldController<String>? fueltypeValueController;
  // State field(s) for Districts widget.
  String? districtsValue;
  FormFieldController<String>? districtsValueController;
  // State field(s) for Description widget.
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  String? _descriptionControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }
    if (val.length > 300) {
      return 'Maximum 300 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    carNameControllerValidator = _carNameControllerValidator;
    lastNameControllerValidator = _lastNameControllerValidator;
    costperdayControllerValidator = _costperdayControllerValidator;
    numberControllerValidator = _numberControllerValidator;
    colorControllerValidator = _colorControllerValidator;
    addressControllerValidator = _addressControllerValidator;
    descriptionControllerValidator = _descriptionControllerValidator;
  }

  void dispose() {
    carNameController?.dispose();
    lastNameController?.dispose();
    costperdayController?.dispose();
    numberController?.dispose();
    colorController?.dispose();
    addressController?.dispose();
    descriptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
