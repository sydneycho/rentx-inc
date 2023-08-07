import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_car_model.dart';
export 'add_car_model.dart';

class AddCarWidget extends StatefulWidget {
  const AddCarWidget({Key? key}) : super(key: key);

  @override
  _AddCarWidgetState createState() => _AddCarWidgetState();
}

class _AddCarWidgetState extends State<AddCarWidget> {
  late AddCarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddCarModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Add_car'});
    _model.carnameController ??= TextEditingController();
    _model.brandnameController ??= TextEditingController();
    _model.textController3 ??= TextEditingController();
    _model.phonenumberController ??= TextEditingController();
    _model.carcolorController ??= TextEditingController();
    _model.textController6 ??= TextEditingController();
    _model.descriptionController ??= TextEditingController();
    _model.notesController ??= TextEditingController();
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 40.0, 0.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Car Details',
                                style:
                                    FlutterFlowTheme.of(context).headlineSmall,
                              ),
                              FlutterFlowIconButton(
                                borderRadius: 30.0,
                                buttonSize: 50.0,
                                icon: Icon(
                                  Icons.close_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'ADD_CAR_PAGE_close_rounded_ICN_ON_TAP');
                                  logFirebaseEvent('IconButton_navigate_to');

                                  context.pushNamed(
                                    'Hostinventory',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.leftToRight,
                                        duration: Duration(milliseconds: 300),
                                      ),
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        TextFormField(
                          controller: _model.carnameController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Car Name',
                            labelStyle: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Open Sans',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 18.0,
                                ),
                            hintText: 'Enter car name',
                            hintStyle:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Open Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
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
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Open Sans',
                                fontSize: 18.0,
                              ),
                          validator: _model.carnameControllerValidator
                              .asValidator(context),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: TextFormField(
                            controller: _model.brandnameController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Brand Name',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 18.0,
                                  ),
                              hintText: 'Enter brand name',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
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
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Open Sans',
                                  fontSize: 18.0,
                                ),
                            validator: _model.brandnameControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: TextFormField(
                            controller: _model.textController3,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Cost per Day',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 18.0,
                                  ),
                              hintText: 'Enter cost per day',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
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
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Open Sans',
                                  fontSize: 18.0,
                                ),
                            validator: _model.textController3Validator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: TextFormField(
                            controller: _model.phonenumberController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Plate Number',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 18.0,
                                  ),
                              hintText: 'Enter plate number',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
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
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Open Sans',
                                  fontSize: 18.0,
                                ),
                            validator: _model.phonenumberControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: TextFormField(
                            controller: _model.carcolorController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Car Color',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 18.0,
                                  ),
                              hintText: 'Enter car color',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
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
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Open Sans',
                                  fontSize: 18.0,
                                ),
                            validator: _model.carcolorControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: TextFormField(
                            controller: _model.textController6,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Address',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 18.0,
                                  ),
                              hintText: 'Enter address',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
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
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Open Sans',
                                  fontSize: 18.0,
                                ),
                            validator: _model.textController6Validator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: FlutterFlowDropDown<String>(
                            controller: _model.transmissionValueController ??=
                                FormFieldController<String>(null),
                            options: ['Manual', 'automatic', 'Other'],
                            onChanged: (val) =>
                                setState(() => _model.transmissionValue = val),
                            width: double.infinity,
                            height: 56.0,
                            searchHintTextStyle: TextStyle(
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Open Sans',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                            hintText: 'Select Transmission type',
                            searchHintText: 'Search here',
                            searchCursorColor:
                                FlutterFlowTheme.of(context).accent3,
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 15.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 4.0,
                            borderColor: FlutterFlowTheme.of(context).accent3,
                            borderWidth: 1.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                20.0, 4.0, 12.0, 4.0),
                            hidesUnderline: true,
                            isSearchable: true,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: FlutterFlowDropDown<String>(
                            controller: _model.fueltypeValueController ??=
                                FormFieldController<String>(null),
                            options: ['Diesel', 'Petrol', 'Other'],
                            onChanged: (val) =>
                                setState(() => _model.fueltypeValue = val),
                            width: double.infinity,
                            height: 56.0,
                            searchHintTextStyle: TextStyle(
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Open Sans',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                            hintText: 'Select fuel type',
                            searchHintText: 'Search here',
                            searchCursorColor:
                                FlutterFlowTheme.of(context).accent3,
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 15.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 4.0,
                            borderColor: FlutterFlowTheme.of(context).accent3,
                            borderWidth: 1.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                20.0, 4.0, 12.0, 4.0),
                            hidesUnderline: true,
                            isSearchable: true,
                          ),
                        ),
                        AuthUserStreamWidget(
                          builder: (context) => FlutterFlowDropDown<String>(
                            controller: _model.districtsValueController ??=
                                FormFieldController<String>(
                              _model.districtsValue ??= valueOrDefault(
                                  currentUserDocument?.district, ''),
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
                            onChanged: (val) =>
                                setState(() => _model.districtsValue = val),
                            width: double.infinity,
                            height: 56.0,
                            searchHintTextStyle: TextStyle(),
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Open Sans',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                            hintText: 'Select district',
                            searchHintText: 'Search here',
                            searchCursorColor:
                                FlutterFlowTheme.of(context).accent3,
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 15.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 4.0,
                            borderColor: FlutterFlowTheme.of(context).accent4,
                            borderWidth: 1.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                20.0, 4.0, 12.0, 4.0),
                            hidesUnderline: true,
                            isSearchable: true,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: TextFormField(
                            controller: _model.descriptionController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Description',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 18.0,
                                  ),
                              hintText: 'Enter description',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
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
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Open Sans',
                                  fontSize: 18.0,
                                ),
                            maxLines: 4,
                            validator: _model.descriptionControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: TextFormField(
                            controller: _model.notesController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Notes',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 18.0,
                                  ),
                              hintText: 'Enter notes',
                              hintStyle: FlutterFlowTheme.of(context).bodyLarge,
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
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Open Sans',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 18.0,
                                ),
                            maxLines: 4,
                            validator: _model.notesControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'ADD_CAR_PAGE_Container_ryd44jjw_ON_TAP');
                              logFirebaseEvent(
                                  'Container_upload_media_to_firebase');
                              final selectedMedia = await selectMedia(
                                mediaSource: MediaSource.photoGallery,
                                multiImage: true,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                setState(() => _model.isDataUploading = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                var downloadUrls = <String>[];
                                try {
                                  showUploadMessage(
                                    context,
                                    'Uploading file',
                                    showLoading: true,
                                  );
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                          ))
                                      .toList();

                                  downloadUrls = (await Future.wait(
                                    selectedMedia.map(
                                      (m) async => await uploadData(
                                          m.storagePath, m.bytes),
                                    ),
                                  ))
                                      .where((u) => u != null)
                                      .map((u) => u!)
                                      .toList();
                                } finally {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  _model.isDataUploading = false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedMedia.length &&
                                    downloadUrls.length ==
                                        selectedMedia.length) {
                                  setState(() {
                                    _model.uploadedLocalFiles =
                                        selectedUploadedFiles;
                                    _model.uploadedFileUrls = downloadUrls;
                                  });
                                  showUploadMessage(
                                      context, 'File upload complete');
                                } else {
                                  setState(() {});
                                  showUploadMessage(
                                      context, 'Failed to upload data');
                                  return;
                                }
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              height: 60.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).accent3,
                                  width: 2.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 5.0, 12.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Upload Car Photos',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Icon(
                                      Icons.cloud_upload_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 16.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'ADD_CAR_PAGE_SUBMIT_BTN_ON_TAP');
                              logFirebaseEvent('Button_backend_call');

                              await CarRecord.collection.doc().set({
                                ...createCarRecordData(
                                  availabilityStatus: 'Available',
                                  bookingStatus: 'not booked',
                                  carName: _model.carnameController.text,
                                  carStatus: 'pending',
                                  costPerDay: double.tryParse(
                                      _model.textController3.text),
                                  description:
                                      _model.descriptionController.text,
                                  fuelType: _model.fueltypeValue,
                                  listingStatus: 'latest',
                                  location: _model.textController6.text,
                                  transmissionType: _model.transmissionValue,
                                  vendorEmail: currentUserEmail,
                                  vendorName:
                                      '${valueOrDefault(currentUserDocument?.firstName, '')}  ${valueOrDefault(currentUserDocument?.lastName, '')}',
                                  vendorPhoto: currentUserPhoto,
                                  plateNumber:
                                      _model.phonenumberController.text,
                                  carColor: colorFromCssString(
                                    _model.carcolorController.text,
                                    defaultColor: Colors.black,
                                  ),
                                  district: _model.districtsValue,
                                  brandName: _model.brandnameController.text,
                                  uid: currentUserReference,
                                  vendorPhoneNumber: currentPhoneNumber,
                                  vendorDescription: valueOrDefault(
                                      currentUserDocument?.bio, ''),
                                  note: _model.notesController.text,
                                  createdTime: getCurrentTimestamp,
                                ),
                                'car_photos': _model.uploadedFileUrls,
                              });
                              logFirebaseEvent('Button_alert_dialog');
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Car registration'),
                                    content: Text(
                                        'Your car details have been sent to our customer care for verification.Once the car is verified,you will be notifiedd throught email  and  your car will appear in the car listing marketplace.'),
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
                              logFirebaseEvent('Button_navigate_to');

                              context.goNamed('Hostinventory');
                            },
                            text: 'Submit',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 55.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              elevation: 2.0,
                            ),
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
      ),
    );
  }
}
