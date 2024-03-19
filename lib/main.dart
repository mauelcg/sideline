import 'package:authentication/app/app.locator.dart';
import 'package:authentication/app/app.router.dart';
import 'package:authentication/firebase_options.dart';
import 'package:authentication/ui/login/login_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

const bool USE_EMULATOR = false;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  if (USE_EMULATOR) {
    await _connectToFirebaseEmulator();
  }

  setupLocator();
  runApp(MyApp());
}

Future _connectToFirebaseEmulator() async {
  // final localHostString = Platform.isAndroid ? '10.0.2.2' : 'localhost';
  final localHostString = Platform.isAndroid ? '10.0.2.2' : '127.0.0.1';

  FirebaseFirestore.instance.settings = Settings(
    host: '$localHostString:8000',
    sslEnabled: false,
    persistenceEnabled: false,
  );

  // await FirebaseAuth.instance.useAuthEmulator('http://$localHostString', 9099);
  await FirebaseAuth.instance.useAuthEmulator(localHostString, 9099);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      home: LoginView(),
    );
  }
}
