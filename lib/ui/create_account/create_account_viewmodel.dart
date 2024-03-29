import 'package:authentication/app/app.locator.dart';
import 'package:authentication/ui/base/authentication_viewmodel.dart';
import 'package:authentication/ui/login/login_view.form.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

import '../../app/app.router.dart';

class CreateAccountViewModel extends AuthenticationViewModel {
  final _firebaseAuthenticationService = locator<FirebaseAuthenticationService>();
  CreateAccountViewModel() : super(successRoute: Routes.addressSelectionView);
  bool focus = false;

  @override
  Future<FirebaseAuthenticationResult> runAuthentication() {
    return _firebaseAuthenticationService.createAccountWithEmail(
      email: emailValue!,
      password: passwordValue!,
    );
  }

  void navigateBack() => navigationService.back();
  void navigateToCreateAccountSideliner() => navigationService.navigateTo(Routes.createAccountSidelinerView);
  // Updates the [BoxInputField] focus state
  void onFocusChanged(bool isFocus) {
    focus = isFocus;
    notifyListeners();
  }
}
