import 'package:flutter/material.dart';
import 'package:flutter_application_1/profile_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/go_asbeza_bloc.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AsbezaBloc(),
      child: MaterialApp(
        routes: {
          '/': (context) => homePage(),
          '/profile': (context) => profile()
        },
        debugShowCheckedModeBanner: false,
        title: 'grocery',
        // home: homePage(),
      ),
    );
  }
}
