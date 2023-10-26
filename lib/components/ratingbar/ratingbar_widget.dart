import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ratingbar_model.dart';
export 'ratingbar_model.dart';

class RatingbarWidget extends StatefulWidget {
  const RatingbarWidget({
    Key? key,
    this.parameter1,
  }) : super(key: key);

  final int? parameter1;

  @override
  _RatingbarWidgetState createState() => _RatingbarWidgetState();
}

class _RatingbarWidgetState extends State<RatingbarWidget> {
  late RatingbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RatingbarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
        child: RatingBar.builder(
          onRatingUpdate: (newValue) =>
              setState(() => _model.ratingBarValue = newValue),
          itemBuilder: (context, index) => Icon(
            Icons.star_rounded,
            color: FlutterFlowTheme.of(context).primary,
          ),
          direction: Axis.horizontal,
          initialRating: _model.ratingBarValue ??=
              widget.parameter1!.toDouble(),
          unratedColor: Color(0xFFE0E3E7),
          itemCount: 5,
          itemSize: 18.0,
          glowColor: FlutterFlowTheme.of(context).primary,
        ),
      ),
    );
  }
}
