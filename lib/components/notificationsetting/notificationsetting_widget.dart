import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'notificationsetting_model.dart';
export 'notificationsetting_model.dart';

class NotificationsettingWidget extends StatefulWidget {
  const NotificationsettingWidget({Key? key}) : super(key: key);

  @override
  _NotificationsettingWidgetState createState() =>
      _NotificationsettingWidgetState();
}

class _NotificationsettingWidgetState extends State<NotificationsettingWidget> {
  late NotificationsettingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsettingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.00, 1.00),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'NOTIFICATIONSETTING_Icon_lmabb2jc_ON_TAP');
                          logFirebaseEvent('Icon_bottom_sheet');
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.cancel_outlined,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Text(
                          'Choose what notifcations you want to recieve\n below and we will update the settings.',
                          style: FlutterFlowTheme.of(context).bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Push Notifications',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Open Sans',
                                    fontSize: 18.0,
                                  ),
                            ),
                            Text(
                              'Receive Push notifications from our \napplication on a semi regular basis.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      AuthUserStreamWidget(
                        builder: (context) => Switch.adaptive(
                          value: _model.switchValue1 ??= valueOrDefault<bool>(
                              currentUserDocument?.pushNotification, false),
                          onChanged: (newValue) async {
                            setState(() => _model.switchValue1 = newValue!);
                            if (newValue!) {
                              logFirebaseEvent(
                                  'NOTIFICATIONSETTING_Switch_42x6c7np_ON_T');
                              logFirebaseEvent('Switch_play_sound');
                              _model.soundPlayer1 ??= AudioPlayer();
                              if (_model.soundPlayer1!.playing) {
                                await _model.soundPlayer1!.stop();
                              }
                              _model.soundPlayer1!.setVolume(1.0);
                              _model.soundPlayer1!
                                  .setAsset('assets/audios/QKTA234-pop.mp3')
                                  .then((_) => _model.soundPlayer1!.play());

                              logFirebaseEvent('Switch_request_permissions');
                              await requestPermission(notificationsPermission);
                            }
                          },
                          activeColor: FlutterFlowTheme.of(context).primary,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).accent1,
                          inactiveTrackColor:
                              FlutterFlowTheme.of(context).alternate,
                          inactiveThumbColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Location Services',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Open Sans',
                                    fontSize: 18.0,
                                  ),
                            ),
                            Text(
                              'Allow us to track your location, this \nhelps keep track of spending and \nkeeps you safe.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      AuthUserStreamWidget(
                        builder: (context) => Switch.adaptive(
                          value: _model.switchValue2 ??= valueOrDefault<bool>(
                              currentUserDocument?.locationServices, false),
                          onChanged: (newValue) async {
                            setState(() => _model.switchValue2 = newValue!);
                            if (newValue!) {
                              logFirebaseEvent(
                                  'NOTIFICATIONSETTING_Switch_4lysop9e_ON_T');
                              logFirebaseEvent('Switch_request_permissions');
                              await requestPermission(locationPermission);
                              logFirebaseEvent('Switch_play_sound');
                              _model.soundPlayer2 ??= AudioPlayer();
                              if (_model.soundPlayer2!.playing) {
                                await _model.soundPlayer2!.stop();
                              }
                              _model.soundPlayer2!.setVolume(1.0);
                              _model.soundPlayer2!
                                  .setAsset('assets/audios/QKTA234-pop.mp3')
                                  .then((_) => _model.soundPlayer2!.play());
                            }
                          },
                          activeColor: FlutterFlowTheme.of(context).primary,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).accent1,
                          inactiveTrackColor:
                              FlutterFlowTheme.of(context).alternate,
                          inactiveThumbColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email Notifications',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Open Sans',
                                    fontSize: 18.0,
                                  ),
                            ),
                            Text(
                              'Receive email notifications from our \nmarketing team about new features.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      AuthUserStreamWidget(
                        builder: (context) => Switch.adaptive(
                          value: _model.switchValue3 ??= valueOrDefault<bool>(
                              currentUserDocument?.emailNotification, false),
                          onChanged: (newValue) async {
                            setState(() => _model.switchValue3 = newValue!);
                            if (newValue!) {
                              logFirebaseEvent(
                                  'NOTIFICATIONSETTING_Switch_xtl238lx_ON_T');
                              logFirebaseEvent('Switch_request_permissions');
                              await requestPermission(notificationsPermission);
                              logFirebaseEvent('Switch_play_sound');
                              _model.soundPlayer3 ??= AudioPlayer();
                              if (_model.soundPlayer3!.playing) {
                                await _model.soundPlayer3!.stop();
                              }
                              _model.soundPlayer3!.setVolume(1.0);
                              _model.soundPlayer3!
                                  .setAsset('assets/audios/QKTA234-pop.mp3')
                                  .then((_) => _model.soundPlayer3!.play());
                            }
                          },
                          activeColor: FlutterFlowTheme.of(context).primary,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).accent1,
                          inactiveTrackColor:
                              FlutterFlowTheme.of(context).alternate,
                          inactiveThumbColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'NOTIFICATIONSETTING_SAVE_CHANGES_BTN_ON_');
                          logFirebaseEvent('Button_backend_call');

                          await currentUserReference!
                              .update(createUserRecordData(
                            emailNotification: _model.switchValue3,
                            pushNotification: _model.switchValue1,
                            locationServices: _model.switchValue2,
                          ));
                          logFirebaseEvent('Button_bottom_sheet');
                          Navigator.pop(context);
                        },
                        text: 'Save changes',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Open Sans',
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
