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
import 'package:aligned_tooltip/aligned_tooltip.dart';
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

    _model.carNameController ??= TextEditingController();
    _model.lastNameController ??= TextEditingController();
    _model.costperdayController ??= TextEditingController();
    _model.numberController ??= TextEditingController();
    _model.colorController ??= TextEditingController();
    _model.addressController ??= TextEditingController();
    _model.descriptionController ??= TextEditingController();
    _model.noteController ??= TextEditingController();
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
            context.pop();
          },
        ),
        title: Text(
          'Add car',
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
      body: Form(
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
                      EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 0.0, 16.0),
                  child: Builder(
                    builder: (context) {
                      final carphotos = _model.uploadedFileUrls.toList();
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            List.generate(carphotos.length, (carphotosIndex) {
                          final carphotosItem = carphotos[carphotosIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 4.0, 4.0, 4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.network(
                                carphotosItem,
                                width: 350.0,
                                height: 250.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
                  child: TextFormField(
                    controller: _model.carNameController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Car Name',
                      labelStyle: FlutterFlowTheme.of(context).bodySmall,
                      hintText: 'Enter your car  name....',
                      hintStyle:
                          FlutterFlowTheme.of(context).bodySmall.override(
                                fontFamily: 'Open Sans',
                                color: FlutterFlowTheme.of(context).accent3,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).accent3,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).accent3,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    maxLines: null,
                    validator:
                        _model.carNameControllerValidator.asValidator(context),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
                  child: TextFormField(
                    controller: _model.lastNameController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'brand Name',
                      labelStyle: FlutterFlowTheme.of(context).bodySmall,
                      hintText: 'Enter your car brand  name....',
                      hintStyle:
                          FlutterFlowTheme.of(context).bodySmall.override(
                                fontFamily: 'Open Sans',
                                color: FlutterFlowTheme.of(context).accent3,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).accent3,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).accent3,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    maxLines: null,
                    validator:
                        _model.lastNameControllerValidator.asValidator(context),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
                  child: TextFormField(
                    controller: _model.costperdayController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'cost per day',
                      labelStyle: FlutterFlowTheme.of(context).bodySmall,
                      hintText: 'Enter cost of your car per day',
                      hintStyle:
                          FlutterFlowTheme.of(context).bodySmall.override(
                                fontFamily: 'Open Sans',
                                color: FlutterFlowTheme.of(context).accent3,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).accent3,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).accent3,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    maxLines: null,
                    validator: _model.costperdayControllerValidator
                        .asValidator(context),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
                  child: TextFormField(
                    controller: _model.numberController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Plate number',
                      labelStyle: FlutterFlowTheme.of(context).bodySmall,
                      hintText: 'Enter your car plate number...',
                      hintStyle:
                          FlutterFlowTheme.of(context).bodySmall.override(
                                fontFamily: 'Open Sans',
                                color: FlutterFlowTheme.of(context).accent3,
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
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    maxLines: null,
                    validator:
                        _model.numberControllerValidator.asValidator(context),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
                  child: TextFormField(
                    controller: _model.colorController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: ' Car color',
                      labelStyle: FlutterFlowTheme.of(context).bodySmall,
                      hintText: 'Enter Color of your car...',
                      hintStyle:
                          FlutterFlowTheme.of(context).bodySmall.override(
                                fontFamily: 'Open Sans',
                                color: FlutterFlowTheme.of(context).accent3,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).accent3,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).accent3,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    maxLines: null,
                    validator:
                        _model.colorControllerValidator.asValidator(context),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
                  child: TextFormField(
                    controller: _model.addressController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Address',
                      labelStyle: FlutterFlowTheme.of(context).bodySmall,
                      hintText: 'Enter the address of your car...',
                      hintStyle:
                          FlutterFlowTheme.of(context).bodySmall.override(
                                fontFamily: 'Open Sans',
                                color: FlutterFlowTheme.of(context).accent3,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).accent3,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).accent3,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    maxLines: null,
                    validator:
                        _model.addressControllerValidator.asValidator(context),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
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
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Open Sans',
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                    hintText: 'Select Transmission type',
                    searchHintText: 'Search here',
                    searchCursorColor: FlutterFlowTheme.of(context).accent3,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 15.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 4.0,
                    borderColor: FlutterFlowTheme.of(context).accent4,
                    borderWidth: 1.0,
                    borderRadius: 8.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 12.0, 4.0),
                    hidesUnderline: true,
                    isSearchable: true,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
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
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Open Sans',
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                    hintText: 'Select fuel type',
                    searchHintText: 'Search here',
                    searchCursorColor: FlutterFlowTheme.of(context).accent3,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 15.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 4.0,
                    borderColor: FlutterFlowTheme.of(context).accent4,
                    borderWidth: 1.0,
                    borderRadius: 8.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 12.0, 4.0),
                    hidesUnderline: true,
                    isSearchable: true,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => FlutterFlowDropDown<String>(
                      controller: _model.districtsValueController ??=
                          FormFieldController<String>(
                        _model.districtsValue ??=
                            valueOrDefault(currentUserDocument?.district, ''),
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
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                      hintText: 'Select district',
                      searchHintText: 'Search here',
                      searchCursorColor: FlutterFlowTheme.of(context).accent3,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 15.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 4.0,
                      borderColor: FlutterFlowTheme.of(context).accent4,
                      borderWidth: 1.0,
                      borderRadius: 8.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 12.0, 4.0),
                      hidesUnderline: true,
                      isSearchable: true,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
                  child: TextFormField(
                    controller: _model.descriptionController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle: FlutterFlowTheme.of(context).bodySmall,
                      hintText: 'Describe your car....',
                      hintStyle:
                          FlutterFlowTheme.of(context).bodySmall.override(
                                fontFamily: 'Open Sans',
                                color: FlutterFlowTheme.of(context).accent3,
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
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    textAlign: TextAlign.start,
                    maxLines: 10,
                    minLines: 3,
                    validator: _model.descriptionControllerValidator
                        .asValidator(context),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
                  child: TextFormField(
                    controller: _model.noteController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Notes',
                      labelStyle: FlutterFlowTheme.of(context).bodySmall,
                      hintText: 'Write notee about  your car and conditions',
                      hintStyle:
                          FlutterFlowTheme.of(context).bodySmall.override(
                                fontFamily: 'Open Sans',
                                color: FlutterFlowTheme.of(context).accent3,
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
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    textAlign: TextAlign.start,
                    maxLines: 10,
                    minLines: 3,
                    validator:
                        _model.noteControllerValidator.asValidator(context),
                  ),
                ),
                AlignedTooltip(
                  content: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                      child: Text(
                        'Upload atleast 6 photos of your car!',
                        style: FlutterFlowTheme.of(context).bodyLarge,
                      )),
                  offset: 4.0,
                  preferredDirection: AxisDirection.down,
                  borderRadius: BorderRadius.circular(8.0),
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 4.0,
                  tailBaseWidth: 24.0,
                  tailLength: 12.0,
                  waitDuration: Duration(milliseconds: 100),
                  showDuration: Duration(milliseconds: 1500),
                  triggerMode: TooltipTriggerMode.tap,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        final selectedMedia = await selectMedia(
                          mediaSource: MediaSource.photoGallery,
                          multiImage: true,
                        );
                        if (selectedMedia != null &&
                            selectedMedia.every((m) =>
                                validateFileFormat(m.storagePath, context))) {
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
                                (m) async =>
                                    await uploadData(m.storagePath, m.bytes),
                              ),
                            ))
                                .where((u) => u != null)
                                .map((u) => u!)
                                .toList();
                          } finally {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            _model.isDataUploading = false;
                          }
                          if (selectedUploadedFiles.length ==
                                  selectedMedia.length &&
                              downloadUrls.length == selectedMedia.length) {
                            setState(() {
                              _model.uploadedLocalFiles = selectedUploadedFiles;
                              _model.uploadedFileUrls = downloadUrls;
                            });
                            showUploadMessage(context, 'File upload complete');
                          } else {
                            setState(() {});
                            showUploadMessage(context, 'Failed to upload data');
                            return;
                          }
                        }
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        height: MediaQuery.sizeOf(context).height * 0.06,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).accent3,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Upload photos',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                            ),
                            Icon(
                              Icons.cloud_upload_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.05),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 34.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await CarRecord.collection.doc().set({
                          ...createCarRecordData(
                            availabilityStatus: 'Available',
                            bookingStatus: 'not booked',
                            carName: _model.carNameController.text,
                            carStatus: 'pending',
                            costPerDay: double.tryParse(
                                _model.costperdayController.text),
                            description: _model.descriptionController.text,
                            fuelType: _model.fueltypeValue,
                            listingStatus: 'latest',
                            location: _model.addressController.text,
                            transmissionType: _model.transmissionValue,
                            vendorEmail: currentUserEmail,
                            vendorName:
                                '${valueOrDefault(currentUserDocument?.firstName, '')}  ${valueOrDefault(currentUserDocument?.lastName, '')}',
                            vendorPhoto: currentUserPhoto,
                            plateNumber: _model.numberController.text,
                            carColor: colorFromCssString(
                              _model.colorController.text,
                              defaultColor: Colors.black,
                            ),
                            district: _model.districtsValue,
                            brandName: _model.lastNameController.text,
                            uid: currentUserReference,
                            vendorPhoneNumber: currentPhoneNumber,
                            vendorDescription:
                                valueOrDefault(currentUserDocument?.bio, ''),
                          ),
                          'car_photos': [_model.uploadedFileUrls],
                        });
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

                        context.goNamed('Hostinventory');
                      },
                      text: 'Save Changes',
                      options: FFButtonOptions(
                        width: 180.0,
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              fontFamily: 'Open Sans',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontSize: 16.0,
                            ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(50.0),
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
  }
}
