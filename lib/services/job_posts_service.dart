import 'package:authentication/app/app.locator.dart';
import '../models/job_post.dart';
import 'api_service.dart';

class JobPostsService {
  final _apiService = locator<ApiService>();
  late List<JobPost> _jobPosts;
  List<JobPost> get posts => _jobPosts;

  bool get hasJobPosts => _jobPosts != null && _jobPosts.isNotEmpty;

  Future<List<JobPost>> getJobPostsFromQuery(String query) async {
    _jobPosts = await _apiService.getJobPostsFromQuery(query);
    return _jobPosts;
  }
}
