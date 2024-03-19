import 'package:authentication/ui/create_account/create_account_view.form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
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
      onViewModelReady: (model) => listenToFormUpdated(model) ,
      builder: (context, model, child) => Scaffold(
          body: AuthenticationLayout(
        onMainButtonTapped: model.saveData,
        busy: model.isBusy,
        onBackPressed: model.navigateBack,
        validationMessage: model.validationMessage,
        title: 'Create Account',
        subtitle: 'Enter your name email and password for sign up',
        mainButtonTitle: 'SIGN UP',
        form: Column(children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Full Name'),
            controller: fullNameController,
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Email'),
            controller: emailController,
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Password'),
            controller: passwordController,
          ),
        ]),
        showTermsText: true,
      )),
    );
  }
}
