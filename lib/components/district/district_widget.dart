import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'district_model.dart';
export 'district_model.dart';

class DistrictWidget extends StatefulWidget {
  const DistrictWidget({Key? key}) : super(key: key);

  @override
  _DistrictWidgetState createState() => _DistrictWidgetState();
}

class _DistrictWidgetState extends State<DistrictWidget> {
  late DistrictModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DistrictModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
      child: FlutterFlowDropDown<String>(
        controller: _model.stateValueController ??= FormFieldController<String>(
          _model.stateValue ??= 'Nalolo',
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
        onChanged: (val) => setState(() => _model.stateValue = val),
        width: double.infinity,
        height: 56.0,
        searchHintTextStyle: TextStyle(),
        textStyle: FlutterFlowTheme.of(context).bodyMedium,
        hintText: 'Select district',
        searchHintText: 'Search here.......',
        searchCursorColor: FlutterFlowTheme.of(context).accent3,
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 15.0,
        ),
        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
        elevation: 2.0,
        borderColor: FlutterFlowTheme.of(context).accent3,
        borderWidth: 2.0,
        borderRadius: 8.0,
        margin: EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 12.0, 4.0),
        hidesUnderline: true,
        isSearchable: true,
        isMultiSelect: false,
      ),
    );
  }
}
