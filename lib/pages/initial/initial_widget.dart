import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'initial_model.dart';
export 'initial_model.dart';

class InitialWidget extends StatefulWidget {
  const InitialWidget({super.key});

  @override
  State<InitialWidget> createState() => _InitialWidgetState();
}

class _InitialWidgetState extends State<InitialWidget> {
  late InitialModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InitialModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().countryCode = functions.getUserCountry()!;
      safeSetState(() {});
      _model.statusInfo = await StatusTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'id',
          1,
        ),
      );
      if (_model.statusInfo?.elementAtOrNull(0)?.type == 1) {
        if (FFAppState().reviewReached) {
          context.goNamed('reviewPage');
        } else {
          context.goNamed('HomePage');
        }
      } else if (_model.statusInfo?.elementAtOrNull(0)?.type == 2) {
        if (FFAppState().reviewReached2) {
          context.goNamed('reviewPage2');
        } else {
          context.goNamed('Home2');
        }
      } else if (_model.statusInfo?.elementAtOrNull(0)?.type == 3) {
        if (FFAppState().reviewReached3) {
          context.goNamed('reviewPage3');
        } else {
          if (FFAppState().signUp) {
            context.goNamed('signUp');
          } else {
            context.goNamed('Home3');
          }
        }
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
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/bg2.png',
                    ).image,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Container(
                  decoration: const BoxDecoration(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/49svh_2.png',
                      width: 150.0,
                      height: 150.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
