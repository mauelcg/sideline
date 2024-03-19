import 'package:authentication/ui/login/login_view.form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String FullNameValueKey = 'fullName';
const String EmailValueKey = 'email';
const String PasswordValueKey = 'password';

mixin $CreateAccountView on StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode fullNameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  void listenToFormUpdated(FormViewModel model) {
    fullNameController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));
    passwordController.addListener(() => _updateFormData(model));
  }

  // Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(model.formValueMap
    ..addAll({
      FullNameValueKey: fullNameController.text,
      EmailValueKey: emailController.text,
      PasswordValueKey: passwordController.text,
    }));

  void disposeForm() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get fullNameValue => formValueMap[FullNameValueKey];
  String? get emailValue => formValueMap[EmailValueKey];
  String? get passwordValue => formValueMap[PasswordValueKey];

  bool get hasFullName => formValueMap.containsKey(FullNameValueKey);
  bool get hasEmail => formValueMap.containsKey(EmailValueKey);
  bool get hasPassword => formValueMap.containsKey(PasswordValueKey);
}

extension Methods on FormViewModel {}
