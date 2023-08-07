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

  final unfocusNode = FocusNode();
  // State field(s) for Carname widget.
  TextEditingController? carnameController;
  String? Function(BuildContext, String?)? carnameControllerValidator;
  // State field(s) for Brandname widget.
  TextEditingController? brandnameController;
  String? Function(BuildContext, String?)? brandnameControllerValidator;
  // State field(s) for TextField widget.
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for Phonenumber widget.
  TextEditingController? phonenumberController;
  String? Function(BuildContext, String?)? phonenumberControllerValidator;
  // State field(s) for carcolor widget.
  TextEditingController? carcolorController;
  String? Function(BuildContext, String?)? carcolorControllerValidator;
  // State field(s) for TextField widget.
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
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
  // State field(s) for Notes widget.
  TextEditingController? notesController;
  String? Function(BuildContext, String?)? notesControllerValidator;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    carnameController?.dispose();
    brandnameController?.dispose();
    textController3?.dispose();
    phonenumberController?.dispose();
    carcolorController?.dispose();
    textController6?.dispose();
    descriptionController?.dispose();
    notesController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
