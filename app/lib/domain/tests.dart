import 'package:app/domain/answers.dart';
import 'package:app/domain/questions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tests.g.dart';

@JsonSerializable()
class Test {
  final Question questions;
  final AnswerInfo answers;

  Test(this.questions, this.answers);

  Test.fromQuestion(Question questions)
      : this(
          questions,
          AnswerInfo.empty(),
        );

  factory Test.fromJson(Map<String, dynamic> json) => _$TestFromJson(json);

  /// Connect the generated [_$TestToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TestToJson(this);
}
