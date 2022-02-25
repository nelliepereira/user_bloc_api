import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_bloc_api/api_connection/users_repository.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Profile using bloc + API',
      debugShowCheckedModeBanner:  false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: RepositoryProvider(
          create: (context) => UsersRepository(),
          child: const HomePage()),
    );
  }
}

