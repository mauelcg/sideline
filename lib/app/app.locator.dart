import 'package:authentication/services/firestore_service.dart';
import 'package:authentication/services/environment_service.dart';
import 'package:authentication/services/job_posts_service.dart';
import 'package:authentication/services/user_service.dart';
import 'package:authentication/ui/job_search/job_search_viewmodel.dart';
import 'package:places_service/places_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import '../services/api_service.dart';
import '../ui/profile/profile_viewmodel.dart';

// final locator = StackedLocator.asNewInstance();
final locator = StackedLocator.instance;

void setupLocator() {
  // Services
  locator.registerSingleton(FirebaseAuthenticationService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => PlacesService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => EnvironmentService());
  locator.registerLazySingleton(() => JobPostsService());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => BottomSheetService());
  // View Models
  locator.registerSingleton(JobSearchViewModel());
  locator.registerSingleton(ProfileViewModel());
}
