import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'account_model.dart';
export 'account_model.dart';

class AccountWidget extends StatefulWidget {
  const AccountWidget({Key? key}) : super(key: key);

  @override
  _AccountWidgetState createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  late AccountModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccountModel());

    _model.suggestionsController ??= TextEditingController();
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
      alignment: AlignmentDirectional(0.00, 0.00),
      child: Material(
        color: Colors.transparent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Container(
          width: 400.0,
          height: 380.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Container(
                        width: 50.0,
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 0.0),
                  child: Text(
                    'Create Note',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Open Sans',
                          fontSize: 18.0,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 0.0),
                  child: Text(
                    'Help us improve our APP',
                    style: FlutterFlowTheme.of(context).labelMedium,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      AuthUserStreamWidget(
                        builder: (context) => ClipRRect(
                          borderRadius: BorderRadius.circular(40.0),
                          child: Image.network(
                            currentUserPhoto,
                            width: 40.0,
                            height: 40.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Text(
                            valueOrDefault(currentUserDocument?.firstName, ''),
                            style: FlutterFlowTheme.of(context).titleLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                  child: TextFormField(
                    controller: _model.suggestionsController,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Why are leaving  ?',
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).accent3,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).accent3,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 32.0, 20.0, 12.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    textAlign: TextAlign.start,
                    maxLines: 4,
                    keyboardType: TextInputType.multiline,
                    validator: _model.suggestionsControllerValidator
                        .asValidator(context),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'ACCOUNT_COMP_DEACTIVATE_BTN_ON_TAP');
                          logFirebaseEvent('Button_backend_call');

                          await EnquiryRecord.collection
                              .doc()
                              .set(createEnquiryRecordData(
                                date: getCurrentTimestamp,
                                description: _model.suggestionsController.text,
                                name: 'Deleted User',
                                serviceType: 'Account Deletion',
                                status: 'new',
                                userType: 'Deleted user',
                                userRef: currentUserReference,
                              ));
                          logFirebaseEvent('Button_backend_call');

                          await currentUserReference!
                              .update(createUserRecordData(
                            userStatus: 'deleted',
                          ));
                          logFirebaseEvent('Button_bottom_sheet');
                          Navigator.pop(context);
                          logFirebaseEvent('Button_alert_dialog');
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Account deactivation'),
                                content: Text(
                                    'It hurts us to see you leave so soon.you account will be deactivated after 14 days,If you change your mnind you can always contact us and we will reactivate it if the 14 days has not passed.We will make sure to put your suggestion into consideration. '),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                          logFirebaseEvent('Button_auth');
                          GoRouter.of(context).prepareAuthEvent();
                          await authManager.signOut();
                          GoRouter.of(context).clearRedirectLocation();

                          context.goNamedAuth('signin', context.mounted);
                        },
                        text: 'Deactivate',
                        options: FFButtonOptions(
                          width: 150.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Open Sans',
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
