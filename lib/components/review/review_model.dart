import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'review_widget.dart' show ReviewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReviewModel extends FlutterFlowModel<ReviewWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for Revie widget.
  FocusNode? revieFocusNode;
  TextEditingController? revieController;
  String? Function(BuildContext, String?)? revieControllerValidator;
  String? _revieControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'please,Leave a review based on your experience.';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    revieControllerValidator = _revieControllerValidator;
  }

  void dispose() {
    revieFocusNode?.dispose();
    revieController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
