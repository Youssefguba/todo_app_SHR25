import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/todo_cubit/todo_cubit.dart';
import 'package:todo_app/screens/login_screen.dart';

import 'blocs/bloc_observer.dart';

// State management
// Data

void main() {
  Bloc.observer = SimpleBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // RULE (1) ::
  // When you want to use Cubit across many features, MyApp
  // else Add it on Page
  // Whatever it placed, don't forget to close it.

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
          primaryColor: Colors.green,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
        ),
        home: LoginScreen(),
      ),
    );
  }
}
