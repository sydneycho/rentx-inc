import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'termsform_model.dart';
export 'termsform_model.dart';

class TermsformWidget extends StatefulWidget {
  const TermsformWidget({
    Key? key,
    required this.carRef,
  }) : super(key: key);

  final DocumentReference? carRef;

  @override
  _TermsformWidgetState createState() => _TermsformWidgetState();
}

class _TermsformWidgetState extends State<TermsformWidget> {
  late TermsformModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsformModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<BookingRecord>>(
      stream: queryBookingRecord(
        parent: widget.carRef,
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 100.0,
              height: 100.0,
              child: SpinKitDualRing(
                color: FlutterFlowTheme.of(context).primary,
                size: 100.0,
              ),
            ),
          );
        }
        List<BookingRecord> containerBookingRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final containerBookingRecord = containerBookingRecordList.isNotEmpty
            ? containerBookingRecordList.first
            : null;
        return Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 10.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: StreamBuilder<CarRecord>(
            stream:
                CarRecord.getDocument(containerBookingRecord!.parentReference),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: SpinKitDualRing(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 100.0,
                    ),
                  ),
                );
              }
              final columnCarRecord = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      'https://picsum.photos/seed/565/600',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 16.0),
                    child: Text(
                      columnCarRecord.vendorName,
                      style: FlutterFlowTheme.of(context).headlineMedium,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                    child: Text(
                      'Location : ${columnCarRecord.district}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 8.0, 8.0, 8.0),
                          child: FlutterFlowIconButton(
                            borderRadius: 30.0,
                            buttonSize: 50.0,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            icon: Icon(
                              Icons.call,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              await launchUrl(Uri(
                                scheme: 'tel',
                                path: columnCarRecord.vendorPhoneNumber,
                              ));
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 8.0, 8.0, 8.0),
                          child: FlutterFlowIconButton(
                            borderRadius: 30.0,
                            buttonSize: 50.0,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            icon: Icon(
                              Icons.email,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              await launchUrl(Uri(
                                  scheme: 'mailto',
                                  path: columnCarRecord.vendorEmail,
                                  query: {
                                    'subject': 'car booking',
                                  }
                                      .entries
                                      .map((MapEntry<String, String> e) =>
                                          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                      .join('&')));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (isiOS) {
                          await launchUrl(Uri.parse(
                              "sms:${columnCarRecord.vendorPhoneNumber}&body=${Uri.encodeComponent('Your car has been booked by ${containerBookingRecord?.renteeName}.send the letter of aggrement to ${containerBookingRecord?.renteeEmail}so that they can read and sign the papers befor you deliver the vehicles.')}"));
                        } else {
                          await launchUrl(Uri(
                            scheme: 'sms',
                            path: columnCarRecord.vendorPhoneNumber,
                            queryParameters: <String, String>{
                              'body':
                                  'Your car has been booked by ${containerBookingRecord?.renteeName}.send the letter of aggrement to ${containerBookingRecord?.renteeEmail}so that they can read and sign the papers befor you deliver the vehicles.',
                            },
                          ));
                        }
                      },
                      text: 'Go home',
                      options: FFButtonOptions(
                        width: 150.0,
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Open Sans',
                                  color: Colors.white,
                                ),
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
