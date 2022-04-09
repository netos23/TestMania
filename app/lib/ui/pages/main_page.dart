import 'package:app/repository/test_repository.dart';
import 'package:app/service/combiners.dart';
import 'package:app/ui/theme/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                    onTap: context.read<ThemeCubit>().toggle,
                    child: Image.asset('assets/logo.png')),
              ),
              Text(
                'Flags mania',
                style: Theme.of(context).textTheme.headline1,
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: context.watch<TestService>().hasTest
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildRestartButton(context),
                _buildStartButton(context),
              ],
            )
          : _buildStartButton(context),
    );
  }

  Widget _buildStartButton(BuildContext context) {
    return OutlinedButton(
      onPressed: () => Navigator.of(context).pushNamed('/test'),
      child: Text(
        context.watch<TestService>().hasTest ? 'Continue' : 'Start',
        style: _buildButtonStyle(context),
      ),
    );
  }

  TextStyle _buildButtonStyle(BuildContext context) {
    return (Theme.of(context).textTheme.headline2 ?? const TextStyle())
        .copyWith(color: Theme.of(context).colorScheme.onBackground);
  }

  Widget _buildRestartButton(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Text(
        'Restart',
        style: _buildButtonStyle(context),
      ),
    );
  }
}
