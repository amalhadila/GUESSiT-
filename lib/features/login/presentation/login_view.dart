import 'package:flutter/material.dart';
import 'package:guessit_task/features/login/presentation/views/widgets/register_screen.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: RegisterScreen(),
    );
  }
}