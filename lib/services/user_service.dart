import 'package:authentication/app/app.locator.dart';
import 'package:authentication/exception/firestore_api_exception.dart';
import 'package:authentication/services/firestore_service.dart';
import 'package:authentication/models/user.dart' as user;
import 'package:authentication/app/app.logger.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

class UserService {
  final logger = getLogger('UserService');

  final _firestoreService = locator<FirestoreService>();
  final _firebaseAuthenticationService = locator<FirebaseAuthenticationService>();

  user.User? _currentUser;

  user.User get currentUser => _currentUser!;

  bool get hasLoggedInUser => _firebaseAuthenticationService.hasUser;

  Future<void> syncUserAccount() async {
    final firebaseUserId = _firebaseAuthenticationService.firebaseAuth.currentUser!.uid;

    logger.v('Sync user $firebaseUserId');

    final userAccount = await _firestoreService.getUser(userId: firebaseUserId);

    if (userAccount != null) {
      logger.v('User account exists. Save as _currentUser');
      _currentUser = userAccount;
    }
  }

  Future<void> syncAndUpdateUserAccount({required user.User user}) async {
    logger.i('user:$user');

    logger.v('Updating user account. Please wait ...');
    await _firestoreService.updateUser(user: user);
    logger.v('_currentUser has been updated');

    throw (FirestoreApiException(message: "An error has occured"));

    // await syncUserAccount();
  }

  Future<void> syncOrCreateUserAccount({required user.User user}) async {
    logger.i('user:$user');

    await syncUserAccount();

    if (_currentUser == null) {
      logger.v('We have no user account. Create a new user ...');
      await _firestoreService.createUser(user: user);
      _currentUser = user;
      logger.v('_currentUser has been saved');
    }
  }
}
