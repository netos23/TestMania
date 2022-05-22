import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Text(
                  'Test\nMania',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: textTheme.headline2,
                ),
              ),
              Flexible(
                flex: 1,
                child: _buildAuthForm(),
              ),
              Flexible(
                flex: 1,
                child: Image.asset(
                  'assets/auth.png',
                  alignment: Alignment.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAuthForm() {
    return Form(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 300),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 3,
              child: _buildFormField(
                icon: Icons.person,
                label: 'Username',
                tooltip: 'Enter your username',
              ),
            ),
            Flexible(
              flex: 3,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  _buildFormField(
                    icon: Icons.password,
                    label: 'Password',
                    tooltip: 'Enter your password',
                    obscureText: true,
                  ),
                  Positioned(
                    //todo: normal value
                    bottom: hasError ? -5 : -20,
                    right: -20,
                    child: FloatingActionButton(
                      child: const Icon(
                        Icons.navigate_next,
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
            const Flexible(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Create account',
                  textAlign: TextAlign.start,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required String tooltip,
    required IconData icon,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        obscureText: obscureText,
        decoration: _buildInputDecoration(
          label: label,
          tooltip: tooltip,
          icon: icon,
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration({
    required String label,
    required String tooltip,
    required IconData icon,
  }) {
    return InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        // todo: error text
        // errorText: 'test\n\n\ntext',
        errorMaxLines: 1,
        prefixIcon: Tooltip(
          message: tooltip,
          child: Icon(icon),
        ),
        label: Text(label));
  }
}
