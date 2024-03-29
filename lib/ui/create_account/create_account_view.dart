import 'package:authentication/ui/create_account/create_account_view.form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import '../shared/styles.dart';
import '../widgets/box_input_field.dart';
import 'create_account_viewmodel.dart';
import '../dumb_widgets/authentication_layout.dart';

@FormView(fields: [
  FormTextField(name: 'fullName'),
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class CreateAccountView extends StatelessWidget with $CreateAccountView {
  CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateAccountViewModel>.reactive(
      viewModelBuilder: () => CreateAccountViewModel(),
      onViewModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => Scaffold(
          body: AuthenticationLayout(
        onMainButtonTapped: model.saveData,
        busy: model.isBusy,
        onBackPressed: model.navigateBack,
        validationMessage: model.validationMessage,
        onCreateAccountSidelinerTapped: model.navigateToCreateAccountSideliner,
        title: 'Create Account',
        subtitle: 'Enter your name email and password for sign up',
        mainButtonTitle: 'SIGN UP',
        form: Column(children: [
          FocusScope(
            child: Focus(
              onFocusChange: model.onFocusChanged,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                margin: model.focus ? EdgeInsets.only(top: 10.0) : EdgeInsets.only(top: 15.0),
                child: BoxInputField(controller: fullNameController, placeholder: "Full Name"),
              ),
            ),
          ),
          FocusScope(
            child: Focus(
              onFocusChange: model.onFocusChanged,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                margin: model.focus ? EdgeInsets.only(top: 10.0) : EdgeInsets.only(top: 15.0),
                child: BoxInputField(
                  controller: emailController,
                  placeholder: "Email",
                ),
              ),
            ),
          ),
          FocusScope(
            child: Focus(
              onFocusChange: model.onFocusChanged,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                margin: model.focus ? const EdgeInsets.only(top: 10.0) : EdgeInsets.only(top: 15.0),
                child: BoxInputField(
                  controller: passwordController,
                  trailing: const Icon(Icons.remove_red_eye_outlined, color: kcMediumGreyColor),
                  trailingTapped: () => passwordController.clear(),
                  placeholder: "Password",
                ),
              ),
            ),
          ),
        ]),
        showTermsText: true,
      )),
    );
  }
}
