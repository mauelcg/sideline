import 'package:authentication/app/app.locator.dart';
import 'package:authentication/services/job_posts_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../models/job_post.dart';

class JobDetailViewModel extends FutureViewModel<List<JobPost>?> {
  final _postsService = locator<JobPostsService>();
  final _navigationService = locator<NavigationService>();

  final JobPost jobPost;

  JobDetailViewModel({required this.jobPost});

  @override
  Future<List<JobPost>> futureToRun() {
    return _postsService.getJobPostsFromQuery("Python Developer from USA");
  }

  void navigateBack() => _navigationService.back();
}
