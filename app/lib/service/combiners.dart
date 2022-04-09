import 'dart:math';

import 'package:app/repository/aspects_repository.dart';
import 'package:app/repository/test_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/aspects.dart';
import '../domain/questions.dart';
import '../domain/resources.dart';
import '../domain/tests.dart';

typedef Combiner = List<Question> Function(List<Aspect>,
    [int answerCount, int count]);

class TestService extends Cubit<List<Test>> {
  final AspectsRepository aspectsRepository;
  final TestRepository testRepository;
  static final List<Combiner> _combiners = [
    combineImageQuestion,
    combineImageQuestionReversed
  ];

  factory TestService.fromRepository(
          AspectsRepository aspectsRepository, TestRepository testRepository) =>
      TestService(aspectsRepository, testRepository,
          testRepository.tests ?? _createTest(aspectsRepository, 10));

  TestService(this.aspectsRepository, this.testRepository, List<Test> tests)
      : super(tests);

  void createTest(int count) {
    List<Test> tests = _createTest(aspectsRepository, count);
    testRepository.save(tests);
    emit(tests);
  }

  static List<Test> _createTest(
      AspectsRepository aspectsRepository, int count) {
    final result = <Question>[];
    for (var i = 0; i < _combiners.length; i++) {
      var questions = count ~/ _combiners.length;
      if (questions == 0 || i == _combiners.length - 1) {
        questions = count % _combiners.length;
      }

      result.addAll(_combiners[i](aspectsRepository.aspects, 4, questions));
    }

    return result.map((e) => Test.fromQuestion(e)).toList();
  }

  void notify() => emit(state);

  bool get hasTest => testRepository.hasItems;

  void prepareTests() {
    if (!hasTest) createTest(10);
  }
}

List<Question> combineImageQuestion(List<Aspect> aspects,
    [int answerCount = 4, count = 5]) {
  aspects.shuffle();

  return aspects
      .where((element) => element.images.isNotEmpty)
      .map((ansEl) => Question.oneAnswer(
            answer: ansEl.images.first,
            question: ResourceContainer(
              ResourceType.image,
              ansEl.images.first,
            ),
            answers: [
              ResourceContainer(
                ResourceType.name,
                ansEl.name,
              ),
              ...randomAspectsExceptOne(
                aspects,
                ansEl,
                answerCount - 1,
              ).map((aspect) => ResourceContainer(
                    ResourceType.name,
                    aspect.name,
                  ))
            ],
          ))
      .take(count)
      .toList(growable: false);
}

List<Question> combineImageQuestionReversed(List<Aspect> aspects,
    [int answerCount = 4, int count = 5]) {
  aspects.shuffle();

  final aspectsWithImage =
      aspects.where((element) => element.images.isNotEmpty).toList();

  return aspectsWithImage
      .map((ansEl) => Question.oneAnswer(
            answer: ansEl.images.first,
            question: ResourceContainer(
              ResourceType.name,
              ansEl.name,
            ),
            answers: [
              ResourceContainer(
                ResourceType.image,
                ansEl.images.first,
              ),
              ...randomAspectsExceptOne(
                aspectsWithImage,
                ansEl,
                answerCount - 1,
              ).map((aspect) => ResourceContainer(
                    ResourceType.image,
                    aspect.images.first,
                  ))
            ],
          ))
      .toList(growable: false);
}

List<Aspect> randomAspectsExceptOne(
  List<Aspect> aspects,
  Aspect excluded,
  int count,
) {
  final random = Random();
  final filteredAspects = <Aspect>[];

  while (filteredAspects.length != count) {
    final aspect = aspects[random.nextInt(aspects.length)];
    if (aspect != excluded) {
      filteredAspects.add(aspect);
    }
  }

  return filteredAspects;
}
