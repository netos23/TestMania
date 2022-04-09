import 'package:app/repository/aspects_repository.dart';
import 'package:app/repository/test_repository.dart';
import 'package:app/service/combiners.dart';
import 'package:app/ui/pages/main_page.dart';
import 'package:app/ui/pages/result_page.dart';
import 'package:app/ui/pages/test_page.dart';
import 'package:app/ui/theme/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:app/ui/theme/themes.dart' as themes;
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final aspectsRepository = AspectsRepository();
  await aspectsRepository.initialize();

  final testRepository = TestRepository();
  await testRepository.initialize();

  final testService =
      TestService.fromRepository(aspectsRepository, testRepository);

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AspectsRepository>(create: (_) => aspectsRepository),
        RepositoryProvider<TestRepository>(create: (_) => testRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => ThemeCubit.dark(),
          ),
          BlocProvider(
            create: (_) => testService,
          )
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: context.watch<ThemeCubit>().state,
      home: const MainPage(),
      routes: {
        '/test': (_) => const TestPage(),
        '/result': (_) => const ResultPage()
      },
    );
  }
}
