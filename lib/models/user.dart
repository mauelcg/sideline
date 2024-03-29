import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  User._();

  factory User({
    required String id,
    String? firstName,
    String? middleInitial,
    String? lastName,
    String? personalSummary,
    List<Map<String, dynamic>>? careerHistory,
    List<Map<String, dynamic>>? education,
    List<Map<String, dynamic>>? licenses,
    List<String>? skills,
    List<Map<String, dynamic>>? resumes,
    String? email,
    String? defaultAddress,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  bool get hasAddress => defaultAddress?.isNotEmpty ?? false;
}
