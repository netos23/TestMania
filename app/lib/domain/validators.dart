import 'package:json_annotation/json_annotation.dart';

part 'validators.g.dart';

abstract class Validator {
  final ValidatorType type;

  Validator(this.type);

  List<bool> validate(List<Object> answer);

  factory Validator.fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case ValidatorType.single:
        return SingleAnswerValidator.fromJson(json);
      case ValidatorType.multiple:
        return MultipleAnswerValidator.fromJson(json);
      case ValidatorType.sequence:
        return SequenceValidator.fromJson(json);
    }

    throw Exception('Missing factory');
  }

  /// Connect the generated [_$ValidatorToJson] function to the `toJson` method.
  Map<String, dynamic> toJson();
}

enum ValidatorType { single, multiple, sequence }

@JsonSerializable()
class SingleAnswerValidator extends Validator {
  final int correctAnswer;

  SingleAnswerValidator(this.correctAnswer) : super(ValidatorType.single);

  SingleAnswerValidator.fromObject(Object correct) : this(correct.hashCode);

  @override
  List<bool> validate(List<Object> answer) => answer
      .map((e) => e.hashCode)
      .map((e) => e == correctAnswer)
      .toList(growable: false);

  factory SingleAnswerValidator.fromJson(Map<String, dynamic> json) =>
      _$SingleAnswerValidatorFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SingleAnswerValidatorToJson(this);
}

@JsonSerializable()
class MultipleAnswerValidator extends Validator {
  final Set<int> correctAnswer;

  MultipleAnswerValidator(this.correctAnswer) : super(ValidatorType.multiple);

  MultipleAnswerValidator.fromObjects(Iterable<Object> correct)
      : this(correct.map((e) => e.hashCode).toSet());

  @override
  List<bool> validate(List<Object> answer) => answer
      .map((e) => e.hashCode)
      .map(correctAnswer.contains)
      .toList(growable: false);

  factory MultipleAnswerValidator.fromJson(Map<String, dynamic> json) =>
      _$MultipleAnswerValidatorFromJson(json);

  /// Connect the generated [_$MultipleAnswerValidatorToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MultipleAnswerValidatorToJson(this);
}

@JsonSerializable()
class SequenceValidator extends Validator {
  final List<int> correctAnswer;

  SequenceValidator(this.correctAnswer) : super(ValidatorType.sequence);

  SequenceValidator.fromObjects(Iterable<Object> correct)
      : this(correct.map((e) => e.hashCode).toList());

  @override
  List<bool> validate(List<Object> answer) =>
      Iterable.generate(correctAnswer.length)
          .map((e) => e.hashCode)
          .map((i) => (correctAnswer[i] == answer[i]))
          .toList();

  factory SequenceValidator.fromJson(Map<String, dynamic> json) =>
      _$SequenceValidatorFromJson(json);

  /// Connect the generated [_$SequenceValidatorToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SequenceValidatorToJson(this);
}
