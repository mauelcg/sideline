import 'package:authentication/app/app.locator.dart';
import 'package:authentication/ui/base/authentication_viewmodel.dart';
import 'package:authentication/ui/login/login_view.form.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

import '../../app/app.router.dart';

class CreateAccountViewModel extends AuthenticationViewModel {
  final _firebaseAuthenticationService = locator<FirebaseAuthenticationService>();
  CreateAccountViewModel() : super(successRoute: Routes.addressSelectionView);

  @override
  Future<FirebaseAuthenticationResult> runAuthentication() {
    return _firebaseAuthenticationService.createAccountWithEmail(
      email: emailValue!,
      password: passwordValue!,
    );
  }

  void navigateBack() => navigationService.back();
}
