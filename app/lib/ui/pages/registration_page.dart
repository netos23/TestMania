import 'dart:ui';

import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
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
                  'Registration',
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: textTheme.headline3,
                ),
              ),
              Flexible(
                flex: 4,
                child: _buildAuthForm(),
              ),
              Flexible(
                flex: 1,
                child: Image.asset(
                  'assets/dog.png',
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 5 ,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: FloatingActionButton.large(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.add_a_photo),
                ),
              ),
            ),
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
              child: _buildFormField(
                icon: Icons.password,
                label: 'Password',
                tooltip: 'Enter your password',
                obscureText: true,
              ),
            ),
            Flexible(
              flex: 3,
              child: _buildFormField(
                icon: Icons.password,
                label: 'Confirm password',
                tooltip: 'Confirm your password',
                obscureText: true,
              ),
            ),
            Flexible(
              flex: 3,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  _buildFormField(
                    icon: Icons.message,
                    label: 'Bio',
                    tooltip: 'Enter some info about yourself',
                  ),
                  Positioned(
                    //todo: normal value
                    bottom: hasError ? -5 : -30,
                    right: -25,
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
            Flexible(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                child: GestureDetector(
                  child: Text(
                    'Log in',
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ),
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
