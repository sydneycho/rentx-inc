import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/booking/booking_widget.dart';
import '/components/empty/empty_widget.dart';
import '/components/review/review_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/request_manager.dart';

import 'hostinventory_widget.dart' show HostinventoryWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HostinventoryModel extends FlutterFlowModel<HostinventoryWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController1;
  int get tabBarCurrentIndex1 =>
      tabBarController1 != null ? tabBarController1!.index : 0;

  // State field(s) for TabBar widget.
  TabController? tabBarController2;
  int get tabBarCurrentIndex2 =>
      tabBarController2 != null ? tabBarController2!.index : 0;

  /// Query cache managers for this widget.

  final _hostManager = StreamRequestManager<UserRecord>();
  Stream<UserRecord> host({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<UserRecord> Function() requestFn,
  }) =>
      _hostManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearHostCache() => _hostManager.clear();
  void clearHostCacheKey(String? uniqueKey) =>
      _hostManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    tabBarController1?.dispose();
    tabBarController2?.dispose();

    /// Dispose query cache managers for this widget.

    clearHostCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
