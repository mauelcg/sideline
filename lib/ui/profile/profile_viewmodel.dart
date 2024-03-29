import 'dart:collection';
import 'package:authentication/app/app.locator.dart';
import 'package:authentication/app/app.logger.dart';
import 'package:authentication/constants/app_bottom_sheet_type.dart';
import 'package:authentication/models/job_post.dart';
import 'package:authentication/models/user.dart';
import 'package:authentication/services/job_posts_service.dart';
import 'package:authentication/services/user_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends FutureViewModel<List<JobPost>?> {
  var logger = getLogger("ProfileViewModel");

  final CollectionReference samplesCollection = FirebaseFirestore.instance.collection("samples");
  final _postsService = locator<JobPostsService>();
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _bottomSheetService = locator<BottomSheetService>();

  User? _user;
  User get user => _user ?? _userService.currentUser;

  @override
  Future<List<JobPost>> futureToRun() {
    return _postsService.getJobPostsFromQuery("Python Developer from USA");
  }

  Future showPersonalSummaryBottomSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      variant: AppBottomSheetType.personalSummary,
      isScrollControlled: true,
      elevation: 0,
      title: 'Personal summary',
      description: 'The sheet is a custom built bottom sheet that allows us to show it from the business logic',
      mainButtonTitle: 'Awesome',
      secondaryButtonTitle: 'This is cool',
    );
  }

  Future showCareerHistoryBottomSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      variant: AppBottomSheetType.careerHistory,
      isScrollControlled: true,
      elevation: 0,
      title: 'Add role',
      description: 'The sheet is a custom built bottom sheet that allows us to show it from the business logic',
      mainButtonTitle: 'Awesome',
      secondaryButtonTitle: 'This is cool',
    );
  }

  Future showEducationBottomSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      variant: AppBottomSheetType.education,
      isScrollControlled: true,
      elevation: 0,
      title: 'Add education',
      description: 'The sheet is a custom built bottom sheet that allows us to show it from the business logic',
      mainButtonTitle: 'Awesome',
      secondaryButtonTitle: 'This is cool',
    );
  }

  Future showLicensesBottomSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      variant: AppBottomSheetType.licenses,
      isScrollControlled: true,
      elevation: 0,
      title: 'Add license',
      description: 'The sheet is a custom built bottom sheet that allows us to show it from the business logic',
      mainButtonTitle: 'Awesome',
      secondaryButtonTitle: 'This is cool',
    );
  }

  Future showSkillsBottomSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      variant: AppBottomSheetType.skills,
      isScrollControlled: true,
      elevation: 0,
      title: 'Add skills',
      description: 'The sheet is a custom built bottom sheet that allows us to show it from the business logic',
      mainButtonTitle: 'Awesome',
      secondaryButtonTitle: 'This is cool',
    );
  }

  Future showLanguagesBottomSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      variant: AppBottomSheetType.languages,
      isScrollControlled: true,
      elevation: 0,
      title: 'Add language',
      description: 'The sheet is a custom built bottom sheet that allows us to show it from the business logic',
      mainButtonTitle: 'Awesome',
      secondaryButtonTitle: 'This is cool',
    );
  }

  void onUserUpdate(Map<String, dynamic> updates) {
    // Immediately update view by notifying
    _user = _userService.currentUser.copyWith(personalSummary: updates['summary']);
    notifyListeners();

    _userService.syncAndUpdateUserAccount(user: user).then((value) => null, onError: (error) {
      logger.v(error);
      Future.delayed(const Duration(seconds: 3), () => _user = _userService.currentUser).then((value) => notifyListeners());
    });

    // _userService.currentUser.personalSummary = updates['summary'] ?? _userService.currentUser.personalSummary;

    Map<String, Object> data = HashMap();
    var sample1List = List<String>.generate(3, (int index) => index.toString(), growable: false);
    var sample2List = List<String>.generate(4, (int index) => index.toString(), growable: false);

    // var sample1 = Sample(attr1: 'Marcus', attr2: "Aurelius", attr3: 4, attr4: sample1List);
    // var sample2 = Sample(attr1: 'Gautama', attr2: "Buddha", attr3: 4, attr4: sample2List);

    // data.putIfAbsent(
    //     "data",
    //     () => List.empty(growable: true)
    //       ..add(sample1.toJson())
    //       ..add(sample2.toJson()));

    samplesCollection.doc("one").set(data).whenComplete(() => logger.i("Done"));
  }

  void navigateBack() => _navigationService.back();
}
