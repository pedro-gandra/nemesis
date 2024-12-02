import '/flutter_flow/flutter_flow_util.dart';
import 'phone_number_widget.dart' show PhoneNumberWidget;
import 'package:flutter/material.dart';

class PhoneNumberModel extends FlutterFlowModel<PhoneNumberWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^\\+[1-9]\\d{1,14}(\\s*\\(?\\d+\\)?[\\s-]*)*\$')
        .hasMatch(val)) {
      return 'Use a valid phone number';
    }
    return null;
  }

  // Stores action output result for [Custom Action - requestPermissions] action in Button widget.
  int? permissionResult;
  // Stores action output result for [Custom Action - requestPermissions] action in Button widget.
  int? permissionResult2;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
