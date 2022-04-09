import 'package:json_annotation/json_annotation.dart';
part 'answers.g.dart';

enum AnswerState {
  empty,
  dump,
  checked,
}

@JsonSerializable()
class AnswerInfo {
  final List<int> answer;
  final AnswerState state;

  AnswerInfo({
    required this.answer,
    required this.state,
  });

  AnswerInfo.empty() : this(answer: [], state: AnswerState.empty);

  factory AnswerInfo.fromJson(Map<String, dynamic> json) => _$AnswerInfoFromJson(json);

  /// Connect the generated [_$AnswerInfoToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AnswerInfoToJson(this);
}
