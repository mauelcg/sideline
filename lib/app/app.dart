import 'package:authentication/services/firestore_service.dart';
import 'package:authentication/services/api_service.dart';
import 'package:authentication/services/environment_service.dart';
import 'package:authentication/services/job_posts_service.dart';
import 'package:authentication/services/user_service.dart';
import 'package:authentication/ui/address_selection/address_selection_view.dart';
import 'package:authentication/ui/home/home_view.dart';
import 'package:authentication/ui/job_search/job_search_viewmodel.dart';
import 'package:authentication/ui/startup/startup_view.dart';
import 'package:places_service/places_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/create_account/create_account_view.dart';
import '../ui/job_detail/job_detail_view.dart';
import '../ui/login/login_view.dart';
import '../ui/job_results/job_results_view.dart';
import '../ui/profile/profile_view.dart';
import '../ui/profile/profile_viewmodel.dart';

@StackedApp(
  routes: [
    CupertinoRoute(page: AddressSelectionView),
    CupertinoRoute(page: CreateAccountView),
    CupertinoRoute(page: StartUpView, initial: true),
    CupertinoRoute(page: HomeView),
    CupertinoRoute(page: LoginView),
    CupertinoRoute(page: ProfileView),
    CupertinoRoute(page: JobResultsView),
    CupertinoRoute(page: JobDetailView)
  ],
  dependencies: [
    // Services
    Singleton(classType: FirebaseAuthenticationService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: FirestoreService),
    LazySingleton(classType: PlacesService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: EnvironmentService),
    LazySingleton(classType: JobPostsService),
    // View Models
    Singleton(classType: ProfileViewModel),
    Singleton(classType: JobSearchViewModel),
  ],
  logger: StackedLogger(),
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it **/
}
