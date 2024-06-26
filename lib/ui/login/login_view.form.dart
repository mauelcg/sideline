import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String EmailValueKey = 'email';
const String PasswordValueKey = 'password';

mixin $LoginView on StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  void listenToFormUpdated(FormViewModel model) {
    emailController.addListener(() => _updateFormData(model));
    passwordController.addListener(() => _updateFormData(model));
  }

  void _updateFormData(FormViewModel model) =>
      model.setData(model.formValueMap..addAll({EmailValueKey: emailController.text, PasswordValueKey: passwordController.text}));

  void disposeForm() {
    // The dispose function for TextEditingController sets all listeners to null
    emailController.dispose();
    passwordController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get emailValue => formValueMap[EmailValueKey];
  String? get passwordValue => formValueMap[PasswordValueKey];

  bool get hasEmail => formValueMap.containsKey(EmailValueKey);
  bool get hasPassword => formValueMap.containsKey(PasswordValueKey);
}

extension Methods on FormViewModel {}
