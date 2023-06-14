import 'package:flutter/material.dart';

import '../features/splash/presentation/view/splash_view.dart';
import '../view/add_student_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVVM pattern',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashView(),
        "/login": (context) => const AddStudentView(),
      },
    );
  }
}
