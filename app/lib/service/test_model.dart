import 'package:app/domain/tests.dart';
import 'package:app/service/combiners.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestCubit extends Cubit<Test> {
  final TestService testService;
  final int index;

  TestCubit(this.index, this.testService) : super(testService.state[index]);

  answer(Object answer) {}

  setTest(Test state) => emit(state);
}
