import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/photoupload/photoupload_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'editprofile_model.dart';
export 'editprofile_model.dart';

class EditprofileWidget extends StatefulWidget {
  const EditprofileWidget({Key? key}) : super(key: key);

  @override
  _EditprofileWidgetState createState() => _EditprofileWidgetState();
}

class _EditprofileWidgetState extends State<EditprofileWidget> {
  late EditprofileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditprofileModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Editprofile'});
    _model.firstnameController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.firstName, ''));
    _model.lastNameController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.lastName, ''));
    _model.numberController ??= TextEditingController(text: currentPhoneNumber);
    _model.addressController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.address, ''));
    _model.myBioController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.bio, ''));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
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
            logFirebaseEvent('EDITPROFILE_arrow_back_rounded_ICN_ON_TA');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          'edit Profile',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Open Sans',
                color: FlutterFlowTheme.of(context).secondaryBackground,
                fontSize: 18.0,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Form(
          key: _model.formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(2.0, 20.0, 2.0, 20.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Semantics(
                        label: 'Profile photo',
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.35,
                          height: MediaQuery.sizeOf(context).width * 0.35,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 500),
                            fadeOutDuration: Duration(milliseconds: 500),
                            imageUrl: currentUserPhoto,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                    child: Semantics(
                      label: 'Upload  profile photo button',
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'EDITPROFILE_PAGE_UPLOAD_BTN_ON_TAP');
                          logFirebaseEvent('Button_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: PhotouploadWidget(),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        text: 'Upload',
                        options: FFButtonOptions(
                          height: 30.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Open Sans',
                                    color: Colors.white,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Semantics(
                        label: 'First name field',
                        child: TextFormField(
                          controller: _model.firstnameController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'First Name',
                            labelStyle: FlutterFlowTheme.of(context).bodySmall,
                            hintText: 'Enter your name....',
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  fontFamily: 'Open Sans',
                                  color: FlutterFlowTheme.of(context).accent3,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).accent3,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 24.0, 0.0, 24.0),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          maxLines: null,
                          validator: _model.firstnameControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Semantics(
                        label: 'Last name field',
                        child: TextFormField(
                          controller: _model.lastNameController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Last Name',
                            labelStyle: FlutterFlowTheme.of(context).bodySmall,
                            hintText: 'Enter your name....',
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  fontFamily: 'Open Sans',
                                  color: FlutterFlowTheme.of(context).accent3,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).accent3,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 24.0, 0.0, 24.0),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          maxLines: null,
                          validator: _model.lastNameControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Semantics(
                        label: ' Mobile number field',
                        child: TextFormField(
                          controller: _model.numberController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Mobile no',
                            labelStyle: FlutterFlowTheme.of(context).bodySmall,
                            hintText: 'Enter your mobile number...',
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  fontFamily: 'Open Sans',
                                  color: FlutterFlowTheme.of(context).accent3,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).accent3,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 24.0, 0.0, 24.0),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          maxLines: null,
                          validator: _model.numberControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Semantics(
                        label: 'Enter your address',
                        child: TextFormField(
                          controller: _model.addressController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Street address',
                            labelStyle: FlutterFlowTheme.of(context).bodySmall,
                            hintText: 'Enter  street address',
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  fontFamily: 'Open Sans',
                                  color: FlutterFlowTheme.of(context).accent3,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).accent3,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 24.0, 0.0, 24.0),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          maxLines: null,
                          validator: _model.addressControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: Semantics(
                      label: 'Pick the date of birth',
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        height: MediaQuery.sizeOf(context).height * 0.07,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).accent3,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  dateTimeFormat(
                                    'd/M/y',
                                    _model.datePicked,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  'Pick the date of birth',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
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
                                      'EDITPROFILE_PAGE_Icon_5cbk6pqf_ON_TAP');
                                  logFirebaseEvent('Icon_date_time_picker');
                                  final _datePickedDate = await showDatePicker(
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Semantics(
                        label:
                            'Select your district from the list in the drop down',
                        child: FlutterFlowDropDown<String>(
                          controller:
                              _model.districtselectionValueController ??=
                                  FormFieldController<String>(
                            _model.districtselectionValue ??=
                                valueOrDefault<String>(
                              valueOrDefault(currentUserDocument?.district, ''),
                              'Select your district',
                            ),
                          ),
                          options: [
                            'Chibombo ',
                            'Chisamba',
                            'Chitambo ',
                            'Kabwe ',
                            'Kapiri Mposhi ',
                            'Luano ',
                            'Mkushi ',
                            'Mumbwa ',
                            'Ngabwe ',
                            'Serenje ',
                            'Shibuyunji ',
                            ' Chililabombwe',
                            'Chingola',
                            ' Kalulushi',
                            ' Kitwe',
                            ' Luanshya',
                            ' Lufwanyama',
                            ' Masaiti',
                            ' Mpongwe',
                            ' Mufulira',
                            ' Ndola',
                            ' Chadiza',
                            ' Chama',
                            'Chasefu',
                            ' Chipangali',
                            ' Chipata',
                            ' Kasenengwa',
                            ' Katete',
                            ' Lumezi',
                            'Lundazi',
                            'Lusangazi ',
                            'Mambwe ',
                            ' Nyimba',
                            ' Petauke',
                            'Sinda',
                            ' Vubwi',
                            'Chembe',
                            ' Chiengi',
                            ' Chifunabuli',
                            ' Chipili',
                            'Kawambwa',
                            ' Lunga',
                            'Mansa',
                            ' Milenge',
                            ' Mwansabombwe',
                            ' Mwense ',
                            'Nchelenge',
                            'Samfya',
                            ' Chilanga',
                            'Chongwe',
                            'Luangwa',
                            ' Lusaka',
                            ' Rufunsa',
                            'Chinsali',
                            'Isoka',
                            'Kanchibiya',
                            'Lavushimanda',
                            'Mafinga',
                            'Mpika',
                            'Nakonde',
                            'Shiwa\'Ngandu',
                            'Chilubi',
                            'Mungwi',
                            'Nsama',
                            'Kaputa',
                            'Senga',
                            'Kasama',
                            'Lunte',
                            'Lupososhi',
                            'Luwingu',
                            'Mbala',
                            'Mporokoso',
                            'Mpulungu',
                            'Chavuma',
                            'Ikelenge',
                            'Mwinilunga',
                            'Solwezi',
                            'Zambezi',
                            'Kabompo',
                            'Kalumbila',
                            'Kasempa',
                            'Manyinga',
                            'Mufumbwe',
                            'Mushindano',
                            'Chikankata',
                            'Chirundu',
                            'Mazabuka',
                            'Monze',
                            'Namwala',
                            'Choma',
                            'Pemba',
                            'Gwembe',
                            'Siavonga',
                            'Itezhi-Tezhi',
                            'Sinazongwe',
                            'Kalomo',
                            'Zimba',
                            'Kazungula',
                            'Livingstone',
                            'Kalabo',
                            'Nkeyema',
                            'Kaoma',
                            'Senanga',
                            'Limulungu',
                            'Sesheke',
                            'Luampa',
                            'Shangombo',
                            'Lukulu',
                            'Sikongo',
                            'Mitete',
                            'Sikongo',
                            'Mongu',
                            'Sioma',
                            'Mulobezi',
                            'Mwandi',
                            'Nalolo',
                            ''
                          ],
                          onChanged: (val) => setState(
                              () => _model.districtselectionValue = val),
                          width: double.infinity,
                          height: 56.0,
                          searchHintTextStyle: TextStyle(),
                          textStyle: FlutterFlowTheme.of(context).bodyMedium,
                          hintText: 'Select district',
                          searchHintText: 'Search here',
                          searchCursorColor:
                              FlutterFlowTheme.of(context).accent3,
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 15.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).accent3,
                          borderWidth: 2.0,
                          borderRadius: 6.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              20.0, 4.0, 12.0, 4.0),
                          hidesUnderline: true,
                          isSearchable: true,
                          isMultiSelect: false,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Semantics(
                        label: 'Enter your about',
                        child: TextFormField(
                          controller: _model.myBioController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'bio',
                            labelStyle: FlutterFlowTheme.of(context).bodySmall,
                            hintText: 'Your bio',
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  fontFamily: 'Open Sans',
                                  color: FlutterFlowTheme.of(context).accent3,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).accent3,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 24.0, 0.0, 24.0),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          textAlign: TextAlign.start,
                          maxLines: 10,
                          minLines: 3,
                          validator: _model.myBioControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.05),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                      child: Semantics(
                        label: 'Save changes button',
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'EDITPROFILE_PAGE_SAVE_CHANGES_BTN_ON_TAP');
                            logFirebaseEvent('Button_backend_call');

                            await currentUserReference!
                                .update(createUserRecordData(
                              email: currentUserEmail,
                              displayName:
                                  '${_model.firstnameController.text}${_model.lastNameController.text}',
                              phoneNumber: _model.numberController.text,
                              address: _model.addressController.text,
                              bio: _model.myBioController.text,
                              district: _model.districtselectionValue,
                              firstName: _model.firstnameController.text,
                              lastName: _model.lastNameController.text,
                              isAdmin: false,
                              isHost: valueOrDefault<bool>(
                                  currentUserDocument?.isHost, false),
                              userRef: currentUserReference,
                              userStatus: valueOrDefault<bool>(
                                      currentUserDocument?.isHost, false)
                                  .toString(),
                              dob: _model.datePicked,
                            ));
                            logFirebaseEvent('Button_show_snack_bar');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Your profile is updated successfully.',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            );
                            logFirebaseEvent('Button_navigate_to');

                            context.goNamed(
                              'Profile',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.leftToRight,
                                  duration: Duration(milliseconds: 250),
                                ),
                              },
                            );
                          },
                          text: 'Save Changes',
                          options: FFButtonOptions(
                            width: 180.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Open Sans',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  fontSize: 16.0,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(2.0),
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
      ),
    );
  }
}
