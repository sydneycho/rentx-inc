import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationModel extends FlutterFlowModel {
  /// Query cache managers for this widget.

  final _notificationManager = StreamRequestManager<List<NotificationRecord>>();
  Stream<List<NotificationRecord>> notification({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<NotificationRecord>> Function() requestFn,
  }) =>
      _notificationManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearNotificationCache() => _notificationManager.clear();
  void clearNotificationCacheKey(String? uniqueKey) =>
      _notificationManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    /// Dispose query cache managers for this widget.

    clearNotificationCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
