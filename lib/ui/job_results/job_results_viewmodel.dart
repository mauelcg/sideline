import 'package:authentication/app/app.locator.dart';
import 'package:authentication/services/job_posts_service.dart';
import 'package:http/http.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.router.dart';
import '../../models/job_post.dart';

class JobResultsViewModel extends FutureViewModel<List<JobPost>?> {
  final _postsService = locator<JobPostsService>();
  final _navigationService = locator<NavigationService>();

  final Map<String, String> searchParameters;
  JobResultsViewModel({required this.searchParameters});

  @override
  Future<List<JobPost>> futureToRun() {
    return _postsService.getJobPostsFromQuery('${searchParameters['keywords']} ${searchParameters['location']} ${searchParameters['category']}');
  }

  void navigateBack() => _navigationService.back();
  void browseJob(JobPost jobPost) => _navigationService.navigateTo(Routes.jobDetailView, arguments: JobDetailViewArguments(jobPost: jobPost));
}
