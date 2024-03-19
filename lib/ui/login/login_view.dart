import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../dumb_widgets/authentication_layout.dart';
import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, child) => Scaffold(
              body: AuthenticationLayout(
                busy: model.isBusy,
                onCreateAccountTapped: model.navigateToCreateAccount,
                title: 'Welcome',
                subtitle: 'Enter your email address to sign in. Enjoy your food',
                mainButtonTitle: 'SIGN IN',
                form: const Column(children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Password'),
                  )
                ]),
                onForgetPasswordTapped: () {},
                onMainButtonTapped: () {},
              ),
            ));
  }
}
