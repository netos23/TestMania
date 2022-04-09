import 'package:app/domain/answers.dart';
import 'package:app/domain/questions.dart';
import 'package:app/domain/resources.dart';
import 'package:app/service/combiners.dart';
import 'package:app/service/test_model.dart';
import 'package:app/ui/widgets/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/tests.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TestCubit(0, context.read<TestService>()),
      child: Scaffold(
        appBar: _buildAppBar(context),
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: _buildBody(context),
        bottomNavigationBar: _buildBottomAppBar(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () {},
        ),
      ),
    );
  }

  BottomAppBar _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).pushReplacementNamed('/'),
            icon: const Icon(Icons.menu),
          )
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: QuestionWidget(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        Flexible(
          child: BlocBuilder<TestService, List<Test>>(
            builder: (context, state) {
              return ListView.builder(
                padding: const EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                itemCount: state.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => context.read<TestCubit>().setTest(state[index]),
                    child: CircleAvatar(
                      backgroundColor:
                          _buildColorFromState(context, state[index].answers),
                      child: Text('$index'),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Color _buildColorFromState(BuildContext context, AnswerInfo state) {
    switch (state.state) {
      case AnswerState.empty:
        return Theme.of(context).colorScheme.onPrimaryContainer;
      case AnswerState.dump:
        return Theme.of(context).colorScheme.tertiary;
      case AnswerState.checked:
        return Theme.of(context).colorScheme.secondary;
    }
  }
}
