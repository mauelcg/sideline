import 'package:authentication/exception/firestore_api_exception.dart';
import 'package:authentication/models/user.dart' as user;
import 'package:authentication/services/user_service.dart';
import 'package:stacked/stacked.dart';
import '../../app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import '../../app/app.logger.dart';

abstract class AuthenticationViewModel extends FormViewModel {
  final logger = getLogger('AuthenticationViewModel');

  final userService = locator<UserService>();
  final navigationService = locator<NavigationService>();

  final firebaseAuthenticationService = locator<FirebaseAuthenticationService>();

  final String successRoute;
  AuthenticationViewModel({required this.successRoute});

  @override
  void setFormStatus() {}

  Future<FirebaseAuthenticationResult> runAuthentication();

  Future saveData() async {
    logger.i('valued:$formValueMap');

    try {
      final result = await runBusyFuture(runAuthentication(), throwException: true);
      await _handleAuthenticationResponse(result);
    } on FirestoreApiException catch (e) {
      logger.e(e.toString());
      setValidationMessage(e.toString());
    }
  }

  Future<void> useGoogleAuthentication() async {
    final result = await firebaseAuthenticationService.signInWithGoogle();
    await _handleAuthenticationResponse(result);
  }

  Future<void> useAppleAuthentication() async {
    final result = await firebaseAuthenticationService.signInWithApple(
      appleClientId: '',
      appleRedirectUri: 'https://boxtout-production.firebaseapp.com/__/auth/handler',
    );
    await _handleAuthenticationResponse(result);
  }

  Future<void> _handleAuthenticationResponse(FirebaseAuthenticationResult authResult) async {
    logger.v('authResult.hasError:${authResult.hasError}');

    if (!authResult.hasError && authResult.user != null) {
      await userService.syncOrCreateUserAccount(user: user.User(id: authResult.user!.uid, email: authResult.user!.email));
      navigationService.replaceWith(successRoute);
    } else {
      if (!authResult.hasError && authResult.user == null) {
        logger.wtf('We have no error but the user is null. This should not be happening');
      }

      logger.w('Authentication Failed: ${authResult.errorMessage}');

      setValidationMessage(authResult.errorMessage);
      notifyListeners();
    }
  }
}
