// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerInfo _$AnswerInfoFromJson(Map<String, dynamic> json) => AnswerInfo(
      answer: (json['answer'] as List<dynamic>).map((e) => e as int).toList(),
      state: $enumDecode(_$AnswerStateEnumMap, json['state']),
    );

Map<String, dynamic> _$AnswerInfoToJson(AnswerInfo instance) =>
    <String, dynamic>{
      'answer': instance.answer,
      'state': _$AnswerStateEnumMap[instance.state],
    };

const _$AnswerStateEnumMap = {
  AnswerState.empty: 'empty',
  AnswerState.dump: 'dump',
  AnswerState.checked: 'checked',
};
