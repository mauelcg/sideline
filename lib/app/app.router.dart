import 'package:authentication/models/job_post.dart';
import 'package:authentication/ui/job_detail/job_detail_view.dart';
import 'package:authentication/ui/job_results/job_results_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:authentication/ui/address_selection/address_selection_view.dart';
import 'package:authentication/ui/create_account/create_account_view.dart';
import 'package:authentication/ui/home/home_view.dart';
import 'package:authentication/ui/login/login_view.dart';
import 'package:authentication/ui/startup/startup_view.dart';

class Routes {
  static const String startUpView = '/';
  static const String addressSelectionView = '/address-selection-view';
  static const String createAccountView = '/create-account-view';
  static const String createAccountSidelinerView = '/create-account-sideliner-view';
  static const String loginView = '/login-view';
  static const String homeView = '/home-view';
  static const String jobResultsView = '/job-results-view';
  static const String jobDetailView = '/job-detail-view';
  static const all = <String>{startUpView, addressSelectionView, createAccountView, loginView, homeView, jobResultsView, jobDetailView};
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.addressSelectionView, page: AddressSelectionView),
    RouteDef(Routes.createAccountView, page: CreateAccountView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.jobResultsView, page: JobResultsView),
    RouteDef(Routes.jobDetailView, page: JobDetailView),
  ];

  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const StartUpView(),
        settings: data,
      );
    },
    JobResultsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => JobResultsView(searchParameters: (data.arguments as JobResultsViewArguments).searchParameters),
        settings: data,
      );
    },
    JobDetailView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => JobDetailView(jobPost: (data.arguments as JobDetailViewArguments).jobPost),
        settings: data,
      );
    },
    AddressSelectionView: (data) {
      var args = data.getArgs<AddressSelectionViewArguments>(orElse: () => AddressSelectionViewArguments());
      return CupertinoPageRoute<dynamic>(builder: (context) => AddressSelectionView(key: args.key), settings: data);
    },
    CreateAccountView: (data) {
      var args = data.getArgs<CreateAccountViewArguments>(
        orElse: () => CreateAccountViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(builder: (context) => CreateAccountView(key: args.key), settings: data);
    },
    LoginView: (data) {
      var args = data.getArgs<LoginViewArguments>(
        orElse: () => LoginViewArguments(),
      );
      return CupertinoPageRoute(builder: (context) => LoginView(key: args.key), settings: data);
    },
    HomeView: (data) {
      return CupertinoPageRoute(builder: (context) => const HomeView(), settings: data);
    }
  };
}

// AddressSelectionView arguments holder class
class AddressSelectionViewArguments {
  final Key? key;
  AddressSelectionViewArguments({this.key});
}

class JobDetailViewArguments {
  final Key? key;
  final JobPost jobPost;
  JobDetailViewArguments({this.key, required this.jobPost});
}

class JobResultsViewArguments {
  final Key? key;
  final Map<String, String> searchParameters;
  JobResultsViewArguments({this.key, required this.searchParameters});
}

// CreateAccountView arguments holder class
class CreateAccountViewArguments {
  final Key? key;
  CreateAccountViewArguments({this.key});
}

// CreateAccountSidelinerView arguments holder class
class CreateAccountSidelinerViewArguments {
  final Key? key;
  CreateAccountSidelinerViewArguments({this.key});
}

// LoginView arguments holder class
class LoginViewArguments {
  final Key? key;
  LoginViewArguments({this.key});
}

// LoginView arguments holder class
class PostsViewArguments {
  final Key? key;
  PostsViewArguments({this.key});
}
