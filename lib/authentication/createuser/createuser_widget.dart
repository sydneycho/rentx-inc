import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/district/district_widget.dart';
import '/components/photoupload/photoupload_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'createuser_model.dart';
export 'createuser_model.dart';

class CreateuserWidget extends StatefulWidget {
  const CreateuserWidget({Key? key}) : super(key: key);

  @override
  _CreateuserWidgetState createState() => _CreateuserWidgetState();
}

class _CreateuserWidgetState extends State<CreateuserWidget> {
  late CreateuserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateuserModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'createuser'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CREATEUSER_PAGE_createuser_ON_INIT_STATE');
      logFirebaseEvent('createuser_alert_dialog');
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: Text('Email verification'),
            content: Text(
                'Make sure you verify email address after creating your profile.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: Text('Ok'),
              ),
            ],
          );
        },
      );
    });

    _model.firstnameController ??= TextEditingController();
    _model.lastNameController ??= TextEditingController();
    _model.numberController ??= TextEditingController();
    _model.addressController ??= TextEditingController();
    _model.myBioController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, _) => [
              SliverAppBar(
                pinned: false,
                floating: false,
                backgroundColor: FlutterFlowTheme.of(context).primary,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 50.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent(
                        'CREATEUSER_arrow_back_rounded_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_navigate_back');
                    context.pop();
                  },
                ),
                title: Text(
                  'Create ',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Open Sans',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontSize: 18.0,
                      ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 0.0,
              )
            ],
            body: Builder(
              builder: (context) {
                return SafeArea(
                  top: false,
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30.0),
                                    bottomRight: Radius.circular(30.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context).primary,
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30.0),
                                      bottomRight: Radius.circular(30.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 20.0, 10.0, 20.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Opacity(
                                          opacity: 0.9,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2.0, 30.0, 2.0, 30.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Semantics(
                                                label: 'Profile photo',
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.4,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.4,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 500),
                                                    imageUrl: currentUserPhoto,
                                                    fit: BoxFit.fitWidth,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 15.0, 0.0, 15.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'CREATEUSER_PAGE_UPLOAD_BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_bottom_sheet');
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return GestureDetector(
                                                    onTap: () => FocusScope.of(
                                                            context)
                                                        .requestFocus(
                                                            _model.unfocusNode),
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          PhotouploadWidget(),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            },
                                            text: 'Upload',
                                            options: FFButtonOptions(
                                              width: 100.0,
                                              height: 30.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color: Colors.white,
                                                      ),
                                              elevation: 4.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 16.0),
                              child: Semantics(
                                label: 'First name field',
                                child: TextFormField(
                                  controller: _model.firstnameController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'First Name',
                                    labelStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    hintText: 'Enter your name....',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Open Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .accent3,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .accent3,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .accent3,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20.0, 24.0, 0.0, 24.0),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  minLines: 1,
                                  validator: _model.firstnameControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 16.0),
                              child: Semantics(
                                label: 'Last name field',
                                child: TextFormField(
                                  controller: _model.lastNameController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Last Name',
                                    labelStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    hintText: 'Enter your name....',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Open Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .accent3,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .accent3,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .accent3,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20.0, 24.0, 0.0, 24.0),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  minLines: 1,
                                  validator: _model.lastNameControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 16.0),
                              child: Semantics(
                                label: 'Mobile number field',
                                child: TextFormField(
                                  controller: _model.numberController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Mobile No',
                                    labelStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    hintText: 'Enter your mobile number...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Open Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .accent3,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .accent3,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .accent3,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20.0, 24.0, 0.0, 24.0),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  minLines: 1,
                                  keyboardType: TextInputType.phone,
                                  cursorColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  validator: _model.numberControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 16.0),
                              child: Semantics(
                                label: 'Address field',
                                child: TextFormField(
                                  controller: _model.addressController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Street address',
                                    labelStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    hintText: 'Enter  street address',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Open Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .accent3,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .accent3,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .accent3,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20.0, 24.0, 0.0, 24.0),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  maxLines: null,
                                  validator: _model.addressControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Semantics(
                                label: 'Date of birth selection',
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.9,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.07,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(6.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            dateTimeFormat(
                                              'd/M/y',
                                              _model.datePicked,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            'Pick the date of birth',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'CREATEUSER_PAGE_Icon_cvs9o2s0_ON_TAP');
                                            logFirebaseEvent(
                                                'Icon_date_time_picker');
                                            final _datePickedDate =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: getCurrentTimestamp,
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime(2050),
                                            );

                                            if (_datePickedDate != null) {
                                              setState(() {
                                                _model.datePicked = DateTime(
                                                  _datePickedDate.year,
                                                  _datePickedDate.month,
                                                  _datePickedDate.day,
                                                );
                                              });
                                            }
                                          },
                                          child: Icon(
                                            Icons.edit_calendar_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            wrapWithModel(
                              model: _model.districtModel,
                              updateCallback: () => setState(() {}),
                              child: DistrictWidget(),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 12.0),
                              child: Semantics(
                                label: 'About field',
                                child: TextFormField(
                                  controller: _model.myBioController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'bio',
                                    labelStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    hintText: 'Your bio',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Open Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .accent3,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .accent3,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .accent3,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20.0, 24.0, 0.0, 24.0),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  textAlign: TextAlign.start,
                                  maxLines: 10,
                                  minLines: 3,
                                  validator: _model.myBioControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Semantics(
                              label: 'host switch',
                              child: AlignedTooltip(
                                content: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 4.0, 4.0, 4.0),
                                    child: Text(
                                      'Are you a car owner and want to earn some extra cash ? if your answer is yes then turn on this feature',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge,
                                    )),
                                offset: 0.0,
                                preferredDirection: AxisDirection.down,
                                borderRadius: BorderRadius.circular(12.0),
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                elevation: 4.0,
                                tailBaseWidth: 14.0,
                                tailLength: 10.0,
                                waitDuration: Duration(milliseconds: 100),
                                showDuration: Duration(milliseconds: 1500),
                                triggerMode: TooltipTriggerMode.tap,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 16.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.06,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .accent3,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Car owner',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                        Switch.adaptive(
                                          value: _model.switchValue ??= false,
                                          onChanged: (newValue) async {
                                            setState(() =>
                                                _model.switchValue = newValue!);
                                            if (newValue!) {
                                              logFirebaseEvent(
                                                  'CREATEUSER_Switch_ijf0qrkg_ON_TOGGLE_ON');
                                              logFirebaseEvent(
                                                  'Switch_play_sound');
                                              _model.soundPlayer ??=
                                                  AudioPlayer();
                                              if (_model.soundPlayer!.playing) {
                                                await _model.soundPlayer!
                                                    .stop();
                                              }
                                              _model.soundPlayer!
                                                  .setVolume(1.0);
                                              await _model.soundPlayer!
                                                  .setAsset(
                                                      'assets/audios/QKTA234-pop.mp3')
                                                  .then((_) => _model
                                                      .soundPlayer!
                                                      .play());
                                            }
                                          },
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent2,
                                          inactiveTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          inactiveThumbColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.05),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 24.0),
                                child: Semantics(
                                  label: 'Submit',
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'CREATEUSER_PAGE_SAVE_CHANGES_BTN_ON_TAP');
                                      logFirebaseEvent('Button_validate_form');
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        return;
                                      }
                                      if (_model.datePicked == null) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Date of birth'),
                                              content: Text(
                                                  'Pick the date of birth'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        return;
                                      }
                                      if (_model.districtModel.stateValue ==
                                          null) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('District'),
                                              content: Text(
                                                  'Pick your district from the list given.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        return;
                                      }
                                      if (_model.switchValue == true) {
                                        logFirebaseEvent('Button_backend_call');

                                        await currentUserReference!
                                            .update(createUserRecordData(
                                          displayName:
                                              '${_model.firstnameController.text} ${_model.lastNameController.text}',
                                          phoneNumber:
                                              _model.numberController.text,
                                          address:
                                              _model.addressController.text,
                                          bio: _model.myBioController.text,
                                          district:
                                              _model.districtModel.stateValue,
                                          firstName:
                                              _model.firstnameController.text,
                                          lastName:
                                              _model.lastNameController.text,
                                          isAdmin: false,
                                          isHost: _model.switchValue,
                                          userRef: currentUserReference,
                                          userStatus: 'pending',
                                          dob: _model.datePicked,
                                          time: getCurrentTimestamp,
                                        ));
                                        logFirebaseEvent('Button_navigate_to');

                                        context.goNamed(
                                          'Host_registration',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .rightToLeft,
                                              duration:
                                                  Duration(milliseconds: 250),
                                            ),
                                          },
                                        );
                                      } else {
                                        logFirebaseEvent('Button_backend_call');

                                        await currentUserReference!
                                            .update(createUserRecordData(
                                          displayName:
                                              '${_model.firstnameController.text} ${_model.lastNameController.text}',
                                          phoneNumber:
                                              _model.numberController.text,
                                          address:
                                              _model.addressController.text,
                                          bio: _model.myBioController.text,
                                          district:
                                              _model.districtModel.stateValue,
                                          firstName:
                                              _model.firstnameController.text,
                                          lastName:
                                              _model.lastNameController.text,
                                          isAdmin: false,
                                          isHost: _model.switchValue,
                                          userRef: currentUserReference,
                                          userStatus: 'approved',
                                          dob: _model.datePicked,
                                          time: getCurrentTimestamp,
                                        ));
                                        logFirebaseEvent('Button_alert_dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title:
                                                  Text('Created successfully'),
                                              content: Text(
                                                  'Your  account has been created succeffully.Navigate to the home page now'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        logFirebaseEvent('Button_navigate_to');

                                        context.goNamed(
                                          'Home',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.scale,
                                              alignment: Alignment.bottomCenter,
                                              duration:
                                                  Duration(milliseconds: 250),
                                            ),
                                          },
                                        );
                                      }
                                    },
                                    text: 'Save Changes',
                                    options: FFButtonOptions(
                                      width: 150.0,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: 15.0,
                                          ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
