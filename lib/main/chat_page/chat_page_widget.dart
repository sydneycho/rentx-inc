import '/backend/backend.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_page_model.dart';
export 'chat_page_model.dart';

class ChatPageWidget extends StatefulWidget {
  const ChatPageWidget({
    Key? key,
    this.chatUser,
    this.chatRef,
  }) : super(key: key);

  final UserRecord? chatUser;
  final DocumentReference? chatRef;

  @override
  _ChatPageWidgetState createState() => _ChatPageWidgetState();
}

class _ChatPageWidgetState extends State<ChatPageWidget> {
  late ChatPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  FFChatInfo? _chatInfo;
  bool isGroupChat() {
    if (widget.chatUser == null) {
      return true;
    }
    if (widget.chatRef == null) {
      return false;
    }
    return _chatInfo?.isGroupChat ?? false;
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ChatPage'});
    FFChatManager.instance
        .getChatInfo(
      otherUserRecord: widget.chatUser,
      chatReference: widget.chatRef,
    )
        .listen((info) {
      if (mounted) {
        setState(() => _chatInfo = info);
      }
    });
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
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: Semantics(
          label: 'Back button',
          child: FlutterFlowIconButton(
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
              logFirebaseEvent('CHAT_arrow_back_rounded_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_to');

              context.pushNamed(
                'AllChatsPage',
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.leftToRight,
                    duration: Duration(milliseconds: 300),
                  ),
                },
              );
            },
          ),
        ),
        title: Stack(
          children: [
            Text(
              '${widget.chatUser?.firstName} ${widget.chatUser?.lastName}',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Lexend Deca',
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ],
        ),
        actions: [],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        top: true,
        child: Semantics(
          label: 'Chat preview page',
          child: StreamBuilder<FFChatInfo>(
            stream: FFChatManager.instance.getChatInfo(
              otherUserRecord: widget.chatUser,
              chatReference: widget.chatRef,
            ),
            builder: (context, snapshot) => snapshot.hasData
                ? FFChatPage(
                    chatInfo: snapshot.data!,
                    allowImages: true,
                    backgroundColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                    timeDisplaySetting: TimeDisplaySetting.visibleOnTap,
                    currentUserBoxDecoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    otherUsersBoxDecoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    currentUserTextStyle: GoogleFonts.getFont(
                      'DM Sans',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      fontStyle: FontStyle.normal,
                    ),
                    otherUsersTextStyle: GoogleFonts.getFont(
                      'DM Sans',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                    ),
                    inputHintTextStyle: GoogleFonts.getFont(
                      'DM Sans',
                      color: Color(0xFF95A1AC),
                      fontWeight: FontWeight.normal,
                      fontSize: 14.0,
                    ),
                    inputTextStyle: GoogleFonts.getFont(
                      'DM Sans',
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 14.0,
                    ),
                    emptyChatWidget: Image.asset(
                      'assets/images/2vqf7_',
                      width: MediaQuery.sizeOf(context).width * 0.76,
                    ),
                  )
                : Center(
                    child: SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: SpinKitDualRing(
                        color: FlutterFlowTheme.of(context).primary,
                        size: 100.0,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
