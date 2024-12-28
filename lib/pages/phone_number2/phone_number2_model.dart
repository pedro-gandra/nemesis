import '/flutter_flow/flutter_flow_util.dart';
import 'phone_number2_widget.dart' show PhoneNumber2Widget;
import 'package:flutter/material.dart';

class PhoneNumber2Model extends FlutterFlowModel<PhoneNumber2Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for nocode widget.
  FocusNode? nocodeFocusNode;
  TextEditingController? nocodeTextController;
  String? Function(BuildContext, String?)? nocodeTextControllerValidator;
  String? _nocodeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'wk6kzy5h' /* Field is required */,
      );
    }

    if (!RegExp('^[\\d]{8,15}([-\\s\\(\\)]?[\\d]{1,4})*\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'usbckpy0' /* Use a valid phone number */,
      );
    }
    return null;
  }

  // State field(s) for withcode widget.
  FocusNode? withcodeFocusNode;
  TextEditingController? withcodeTextController;
  String? Function(BuildContext, String?)? withcodeTextControllerValidator;
  String? _withcodeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'dluegfji' /* Field is required */,
      );
    }

    if (!RegExp('^\\+[1-9]\\d{1,14}(\\s*\\(?\\d+\\)?[\\s-]*)*\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'k1hjcgg1' /* Use a valid phone number */,
      );
    }
    return null;
  }

  // Stores action output result for [Custom Action - requestPermissions] action in Button widget.
  int? permissionResult;
  // Stores action output result for [Custom Action - requestPermissions] action in Button widget.
  int? permissionResult2;

  @override
  void initState(BuildContext context) {
    nocodeTextControllerValidator = _nocodeTextControllerValidator;
    withcodeTextControllerValidator = _withcodeTextControllerValidator;
  }

  @override
  void dispose() {
    nocodeFocusNode?.dispose();
    nocodeTextController?.dispose();

    withcodeFocusNode?.dispose();
    withcodeTextController?.dispose();
  }
}
