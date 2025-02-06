import '/backend/supabase/supabase.dart';
import '/dialogs/permission_denied/permission_denied_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'phone_number_model.dart';
export 'phone_number_model.dart';

class PhoneNumberWidget extends StatefulWidget {
  const PhoneNumberWidget({super.key});

  @override
  State<PhoneNumberWidget> createState() => _PhoneNumberWidgetState();
}

class _PhoneNumberWidgetState extends State<PhoneNumberWidget> {
  late PhoneNumberModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhoneNumberModel());

    _model.nocodeTextController ??= TextEditingController();
    _model.nocodeFocusNode ??= FocusNode();

    _model.withcodeTextController ??= TextEditingController();
    _model.withcodeFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.withcodeTextController?.text =
              FFLocalizations.of(context).getText(
            '9qfwt9nq' /* + */,
          );
        }));
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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset(
                  'assets/images/bg2.png',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(45.0, 0.0, 45.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'ku23swmt' /* Confirm your phone number */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).alternate,
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              lineHeight: 1.5,
                            ),
                      ),
                    ),
                    Form(
                      key: _model.formKey2,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Visibility(
                        visible: FFAppState().countryCode != 'AAA',
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                functions
                                    .getFlagEmoji(FFAppState().countryCode),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 26.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Expanded(
                                child: Opacity(
                                  opacity: 0.7,
                                  child: SizedBox(
                                    width: 300.0,
                                    child: TextFormField(
                                      controller: _model.nocodeTextController,
                                      focusNode: _model.nocodeFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              letterSpacing: 0.0,
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'jnkuzhcj' /* Phone number */,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              letterSpacing: 0.0,
                                            ),
                                        errorStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                      keyboardType: TextInputType.phone,
                                      cursorColor:
                                          FlutterFlowTheme.of(context).tertiary,
                                      validator: _model
                                          .nocodeTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(width: 15.0)),
                          ),
                        ),
                      ),
                    ),
                    Form(
                      key: _model.formKey1,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Visibility(
                        visible: FFAppState().countryCode == 'AAA',
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Opacity(
                                opacity: 0.7,
                                child: SizedBox(
                                  width: 300.0,
                                  child: TextFormField(
                                    controller: _model.withcodeTextController,
                                    focusNode: _model.withcodeFocusNode,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            letterSpacing: 0.0,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        '43lgylr7' /* Phone number */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            letterSpacing: 0.0,
                                          ),
                                      errorStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                    keyboardType: TextInputType.phone,
                                    cursorColor:
                                        FlutterFlowTheme.of(context).tertiary,
                                    validator: _model
                                        .withcodeTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 7.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'ethjyvl2' /* Example: +49 30 901820 */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        lineHeight: 1.5,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.9,
                      child: Builder(
                        builder: (context) => Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (FFAppState().countryCode == 'AAA') {
                                if (_model.formKey1.currentState == null ||
                                    !_model.formKey1.currentState!.validate()) {
                                  return;
                                }
                                await DevicesTable().update(
                                  data: {
                                    'phone_number': functions.clearPhoneNumber(
                                        _model.withcodeTextController.text),
                                  },
                                  matchingRows: (rows) => rows.eqOrNull(
                                    'id',
                                    FFAppState().deviceId,
                                  ),
                                );
                              } else {
                                if (_model.formKey2.currentState == null ||
                                    !_model.formKey2.currentState!.validate()) {
                                  return;
                                }
                                await DevicesTable().update(
                                  data: {
                                    'phone_number': functions.clearPhoneNumber(
                                        functions.joinStrings(
                                            functions.getDialingCode(
                                                FFAppState().countryCode),
                                            _model.nocodeTextController.text)),
                                  },
                                  matchingRows: (rows) => rows.eqOrNull(
                                    'id',
                                    FFAppState().deviceId,
                                  ),
                                );
                              }

                              _model.permissionResult =
                                  await actions.requestPermissions(
                                FFAppState().deviceId,
                              );
                              if (_model.permissionResult == 1) {
                                await actions.registerReceiver();
                                await actions.getContacts(
                                  FFAppState().deviceId,
                                );
                                FFAppState().reviewReached = true;
                                safeSetState(() {});
                                await Future.delayed(
                                    const Duration(milliseconds: 2000));

                                context.goNamed('reviewPage');
                              } else {
                                if (_model.permissionResult == 2) {
                                  await showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () {
                                            FocusScope.of(dialogContext)
                                                .unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: const PermissionDeniedWidget(),
                                        ),
                                      );
                                    },
                                  );

                                  _model.permissionResult2 =
                                      await actions.requestPermissions(
                                    FFAppState().deviceId,
                                  );
                                  if (_model.permissionResult2 == 1) {
                                    await actions.registerReceiver();
                                    await actions.getContacts(
                                      FFAppState().deviceId,
                                    );
                                    FFAppState().reviewReached = true;
                                    safeSetState(() {});
                                    await Future.delayed(
                                        const Duration(milliseconds: 2000));

                                    context.goNamed('reviewPage');
                                  } else {
                                    await showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: const AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: GestureDetector(
                                            onTap: () {
                                              FocusScope.of(dialogContext)
                                                  .unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: const PermissionDeniedWidget(),
                                          ),
                                        );
                                      },
                                    );

                                    await actions.openSettings();
                                  }
                                } else {
                                  await showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () {
                                            FocusScope.of(dialogContext)
                                                .unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: const PermissionDeniedWidget(),
                                        ),
                                      );
                                    },
                                  );

                                  await actions.openSettings();
                                }
                              }

                              safeSetState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              '3eye11g9' /* Confirm */,
                            ),
                            options: FFButtonOptions(
                              width: 270.0,
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).alternate,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Roboto',
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'j671lm5m' /* We need to confirm your phone ... */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).alternate,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              lineHeight: 1.4,
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
    );
  }
}
