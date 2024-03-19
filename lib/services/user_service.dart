import 'package:authentication/api/firestore_api.dart';
import 'package:authentication/app/app.logger.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import '../app/app.locator.dart';
import '../models/application_models.dart' as app_models;

class UserService {
  final logger = getLogger('UserService');

  final _firestoreApi = locator<FirestoreApi>();
  final _firebaseAuthenticationService = locator<FirebaseAuthenticationService>();

  app_models.User? _currentUser;

  app_models.User get currentUser => _currentUser!;

  bool get hasLoggedInUser => _firebaseAuthenticationService.hasUser;

  Future<void> syncUserAccount() async {
    final firebaseUserId = _firebaseAuthenticationService.firebaseAuth.currentUser!.uid;

    logger.v('Sync user $firebaseUserId');

    final userAccount = await _firestoreApi.getUser(userId: firebaseUserId);

    if (userAccount != null) {
      logger.v('User account exists. Save as _currentUser');
      _currentUser = userAccount;
    }
  }

  Future<void> syncOrCreateUserAccount({required app_models.User user}) async {
    logger.i('user:$user');

    await syncUserAccount();

    if (_currentUser == null) {
      logger.v('We have no user account. Create a new user ...');
      await _firestoreApi.createUser(user: user);
      _currentUser = user;
      logger.v('_currentUser has been saved');
    }
  }
}
