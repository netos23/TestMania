// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validators.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleAnswerValidator _$SingleAnswerValidatorFromJson(
        Map<String, dynamic> json) =>
    SingleAnswerValidator(
      json['correctAnswer'] as int,
    );

Map<String, dynamic> _$SingleAnswerValidatorToJson(
        SingleAnswerValidator instance) =>
    <String, dynamic>{
      'correctAnswer': instance.correctAnswer,
    };

MultipleAnswerValidator _$MultipleAnswerValidatorFromJson(
        Map<String, dynamic> json) =>
    MultipleAnswerValidator(
      (json['correctAnswer'] as List<dynamic>).map((e) => e as int).toSet(),
    );

Map<String, dynamic> _$MultipleAnswerValidatorToJson(
        MultipleAnswerValidator instance) =>
    <String, dynamic>{
      'correctAnswer': instance.correctAnswer.toList(),
    };

SequenceValidator _$SequenceValidatorFromJson(Map<String, dynamic> json) =>
    SequenceValidator(
      (json['correctAnswer'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$SequenceValidatorToJson(SequenceValidator instance) =>
    <String, dynamic>{
      'correctAnswer': instance.correctAnswer,
    };
