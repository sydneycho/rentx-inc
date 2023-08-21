import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'vendor_model.dart';
export 'vendor_model.dart';

class VendorWidget extends StatefulWidget {
  const VendorWidget({
    Key? key,
    required this.vendorDetails,
  }) : super(key: key);

  final DocumentReference? vendorDetails;

  @override
  _VendorWidgetState createState() => _VendorWidgetState();
}

class _VendorWidgetState extends State<VendorWidget> {
  late VendorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VendorModel());
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
      alignment: AlignmentDirectional(0.0, 0.0),
      child: StreamBuilder<CarRecord>(
        stream: CarRecord.getDocument(widget.vendorDetails!),
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
          final containerCarRecord = snapshot.data!;
          return Container(
            width: MediaQuery.sizeOf(context).width * 0.8,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(2.0),
                          child: Image.network(
                            containerCarRecord.vendorPhoto,
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            height: MediaQuery.sizeOf(context).height * 0.3,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderRadius: 20.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.cancel_presentation,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'VENDOR_cancel_presentation_ICN_ON_TAP');
                          logFirebaseEvent('IconButton_bottom_sheet');
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Vendor',
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 8.0),
                          child: Text(
                            containerCarRecord.vendorName,
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Open Sans',
                                  fontSize: 20.0,
                                ),
                          ),
                        ),
                        Text(
                          'Location : ${containerCarRecord.district}',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            'Description',
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 12.0),
                            child: Text(
                              containerCarRecord.vendorDescription,
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
