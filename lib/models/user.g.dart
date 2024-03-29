// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      firstName: json['firstName'] as String?,
      middleInitial: json['middleInitial'] as String?,
      lastName: json['lastName'] as String?,
      personalSummary: json['personalSummary'] as String?,
      careerHistory: (json['careerHistory'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      education: (json['education'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      licenses: (json['licenses'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      skills:
          (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList(),
      resumes: (json['resumes'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      email: json['email'] as String?,
      defaultAddress: json['defaultAddress'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'middleInitial': instance.middleInitial,
      'lastName': instance.lastName,
      'personalSummary': instance.personalSummary,
      'careerHistory': instance.careerHistory,
      'education': instance.education,
      'licenses': instance.licenses,
      'skills': instance.skills,
      'resumes': instance.resumes,
      'email': instance.email,
      'defaultAddress': instance.defaultAddress,
    };
