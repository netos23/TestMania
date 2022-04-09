import 'package:json_annotation/json_annotation.dart';

import 'resources.dart';
import 'validators.dart';

part 'questions.g.dart';

@JsonSerializable()
class Question {
  const Question({
    required this.validator,
    required this.question,
    required this.answers,
  });

  final ResourceContainer question;
  final List<ResourceContainer> answers;
  final Validator validator;

  Question.oneAnswer({
    required Object answer,
    required ResourceContainer question,
    required List<ResourceContainer> answers,
  }) : this(
          validator: SingleAnswerValidator.fromObject(answer),
          question: question,
          answers: answers,
        );

  Question.multipleAnswer({
    required Set<Object> answer,
    required ResourceContainer question,
    required List<ResourceContainer> answers,
  }) : this(
          validator: MultipleAnswerValidator.fromObjects(answer),
          question: question,
          answers: answers,
        );

  Question.sequenceQuestion({
    required List<Object> answer,
    required ResourceContainer question,
    required List<ResourceContainer> answers,
  }) : this(
          validator: SequenceValidator.fromObjects(answer),
          question: question,
          answers: answers,
        );

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);

  /// Connect the generated [_$QuestionToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
