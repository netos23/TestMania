import 'package:app/domain/questions.dart';
import 'package:app/domain/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/tests.dart';
import '../../service/test_model.dart';

const assetPrefix = 'assets/flags/';
const assetSuffix = '.png';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestCubit, Test>(builder: (context, test) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildQuestion(test.questions.question),
          Flexible(
            child: _buildAnswers(context,test.questions.answers),
          ),
        ],
      );
    });
  }

  Widget _buildQuestion(ResourceContainer question) {
    assert(question.type == ResourceType.image ||
        question.type == ResourceType.name);

    if (question.type == ResourceType.image) {
      return _buildImageQuestion(question.resource);
    }

    return _buildNameQuestion(question.resource);
  }

  Widget _buildNameQuestion(String resource) {
    return Text('Choose the flag of $resource.');
  }

  Widget _buildImageQuestion(String resource) {
    return Column(
      children: [
        const Text('Whose flag?'),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ClipRRect(
            child: Image.asset('$assetPrefix${resource.toLowerCase()}$assetSuffix'),
            borderRadius: BorderRadius.circular(15),
          ),
        )
      ],
    );
  }

  Widget _buildAnswers(BuildContext context,List<ResourceContainer> answers) {
    return GridView.builder(
      itemCount: answers.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: context.read<TestCubit>().answer(index),
          child: Card(
            elevation: 3,
            child: Center(
              child: _buildAnswer(answers[index]),
            ),
          ),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }

  Widget _buildAnswer(ResourceContainer answer) {
    assert(
        answer.type == ResourceType.image || answer.type == ResourceType.name);

    if (answer.type == ResourceType.image) {
      return _buildImageAnswer(answer.resource);
    }

    return _buildNameAnswer(answer.resource);
  }

  Widget _buildImageAnswer(String resource) {
    return Image.asset('$assetPrefix${resource.toLowerCase()}$assetSuffix');
  }

  Widget _buildNameAnswer(String resource) {
    return Text(resource);
  }
}
