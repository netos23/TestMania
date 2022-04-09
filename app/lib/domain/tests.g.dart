// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Test _$TestFromJson(Map<String, dynamic> json) => Test(
      Question.fromJson(json['questions'] as Map<String, dynamic>),
      AnswerInfo.fromJson(json['answers'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TestToJson(Test instance) => <String, dynamic>{
      'questions': instance.questions,
      'answers': instance.answers,
    };
