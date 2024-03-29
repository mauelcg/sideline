import 'package:authentication/app/app.locator.dart';
import 'package:authentication/ui/base/authentication_viewmodel.dart';
import 'package:authentication/ui/login/login_view.form.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:authentication/app/app.router.dart';

class LoginViewModel extends AuthenticationViewModel {
  final FirebaseAuthenticationService? _firebaseAuthenticationService = locator<FirebaseAuthenticationService>();
  LoginViewModel() : super(successRoute: Routes.homeView);
  bool focus = false;

  @override
  Future<FirebaseAuthenticationResult> runAuthentication() {
    return _firebaseAuthenticationService!.loginWithEmail(
      email: emailValue!,
      password: passwordValue!,
    );
  }

  void navigateToCreateAccount() => navigationService.navigateTo(Routes.createAccountView);

  // Updates the [BoxInputField] focus state
  void onFocusChanged(bool isFocus) {
    focus = isFocus;
    notifyListeners();
  }
}
