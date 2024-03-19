import 'package:authentication/api/firestore_api.dart';
import 'package:authentication/services/environment_service.dart';
import 'package:authentication/services/user_service.dart';
import 'package:authentication/ui/address_selection/address_selection_view.dart';
import 'package:authentication/ui/home/home_view.dart';
import 'package:authentication/ui/startup/startup_view.dart';
import 'package:places_service/places_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/create_account/create_account_view.dart';
import '../ui/login/login_view.dart';

@StackedApp(
  routes: [
    CupertinoRoute(page: AddressSelectionView),
    CupertinoRoute(page: CreateAccountView),
    CupertinoRoute(page: StartUpView, initial: true),
    CupertinoRoute(page: HomeView),
    CupertinoRoute(page: LoginView, initial: true)
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: FirestoreApi),
    LazySingleton(classType: PlacesService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: EnvironmentService),
    Singleton(classType: FirebaseAuthenticationService),
  ],
  logger: StackedLogger(),
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it **/
}
