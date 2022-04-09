// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      validator: Validator.fromJson(json['validator'] as Map<String, dynamic>),
      question:
          ResourceContainer.fromJson(json['question'] as Map<String, dynamic>),
      answers: (json['answers'] as List<dynamic>)
          .map((e) => ResourceContainer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'question': instance.question,
      'answers': instance.answers,
      'validator': instance.validator,
    };
