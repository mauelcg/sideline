import 'package:authentication/api/firestore_api.dart';
import 'package:authentication/services/environment_service.dart';
import 'package:authentication/services/user_service.dart';
import 'package:places_service/places_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

final locator = StackedLocator.asNewInstance();

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => FirestoreApi());
  locator.registerLazySingleton(() => PlacesService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => EnvironmentService());
  locator.registerSingleton(FirebaseAuthenticationService());
}
