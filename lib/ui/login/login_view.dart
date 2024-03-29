import 'package:authentication/ui/login/login_view.form.dart';
import 'package:authentication/ui/shared/styles.dart';
import 'package:authentication/ui/widgets/box_input_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:authentication/ui/dumb_widgets/authentication_layout.dart';
import 'package:authentication/ui/login/login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class LoginView extends StatelessWidget with $LoginView {
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      onViewModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => Scaffold(
        body: AuthenticationLayout(
          busy: model.isBusy,
          onMainButtonTapped: model.saveData,
          onCreateAccountTapped: model.navigateToCreateAccount,
          validationMessage: model.validationMessage,
          title: 'Welcome',
          subtitle: 'Enter your email address to sign in. Enjoy your job search!',
          mainButtonTitle: 'SIGN IN',
          form: Column(children: [
            FocusScope(
              child: Focus(
                onFocusChange: model.onFocusChanged,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  margin: model.focus ? EdgeInsets.only(top: 10.0) : EdgeInsets.only(top: 15.0),
                  child: BoxInputField(
                    controller: emailController,
                    leading: const Icon(Icons.email_outlined, color: kcPrimaryColor),
                    placeholder: "Email",
                  ),
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
                    controller: passwordController,
                    password: true,
                    minLines: 1,
                    maxLines: 1,
                    leading: Icon(Icons.lock_outline_rounded, color: kcPrimaryColor),
                    trailing: Icon(Icons.remove_red_eye_outlined, color: kcMediumGreyColor),
                    trailingTapped: () => passwordController.clear(),
                    placeholder: "Password",
                  ),
                ),
              ),
            ),
          ]),
          onForgetPasswordTapped: () {},
        ),
      ),
    );
  }
}
