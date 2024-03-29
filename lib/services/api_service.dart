import 'dart:convert';
import 'package:authentication/app/app.logger.dart';
import 'package:authentication/models/comment.dart';
import 'package:authentication/models/job_post.dart';
import 'package:authentication/models/user.dart';
import 'package:http/http.dart' as http;

// Rapid API Keys
const String RapidApiValueKey = 'X-RapidAPI-Key';
const String RapidApiHostValueKey = 'X-RapidAPI-Host';

class ApiService {
  static const authority = 'https://jsonplaceholder.typicode.com';

  final logger = getLogger('Api');

  var client = http.Client();

  Future<List<Comment>> getCommentsForPost(int postId) async {
    var comments = List<Comment>.empty();
    var response = await client.get(Uri.https(authority, '/comments', {'postId': postId}));
    var parsed = json.decode(response.body) as List<dynamic>;
    for (var comment in parsed) {
      comments.add(Comment.fromJson(comment));
    }
    return comments;
  }

  Future<List<JobPost>> getJobPostsFromQuery(String query) async {
    var posts = List<JobPost>.empty(growable: true);
    query = query.trim().replaceAll(RegExp(r'\s'), '%20');
    var host = const String.fromEnvironment(RapidApiHostValueKey);
    var url = Uri.parse('https://$host/search?query=$query&page=1&num_pages=1');
    var headers = <String, String>{};
    headers.addAll({
      RapidApiValueKey: const String.fromEnvironment(RapidApiValueKey),
      RapidApiHostValueKey: const String.fromEnvironment(RapidApiHostValueKey),
    });

    try {
      // Await the http get response, then decode the json-formatted response.
      var response = await client.get(url, headers: headers);
      var parsed = json.decode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      for (var post in parsed['data']) {
        posts.add(JobPost.fromJson(post));
      }
    } catch (e) {
      logger.e(e);
    }

    return posts;
  }

  Future<User> getUserProfile(int userId) async {
    var response = await client.get(Uri.https(authority, '/users/$userId'));
    return User.fromJson(json.decode(response.body));
  }
}
