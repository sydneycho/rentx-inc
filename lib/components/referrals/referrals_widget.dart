import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'referrals_model.dart';
export 'referrals_model.dart';

class ReferralsWidget extends StatefulWidget {
  const ReferralsWidget({Key? key}) : super(key: key);

  @override
  _ReferralsWidgetState createState() => _ReferralsWidgetState();
}

class _ReferralsWidgetState extends State<ReferralsWidget> {
  late ReferralsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReferralsModel());
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
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.supervised_user_circle,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 50.0,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
              child: Text(
                'Opps ! you have no active referrals',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Open Sans',
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
