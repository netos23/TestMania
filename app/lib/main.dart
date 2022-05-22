import 'package:app/ui/pages/auth_page.dart';
import 'package:app/ui/theme/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:app/ui/theme/themes.dart' as themes;
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => ThemeCubit.light(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: context.watch<ThemeCubit>().state,
      home: const AuthPage(),
    );
  }
}
