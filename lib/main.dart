import 'package:flutter/material.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';

import 'core/server/Server.dart';
import 'movies/presentation/screens/movies_screen.dart';

void main() {

  ServicesLocator().init();



  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies app',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,

      ),
      home: const MainMoviesScreen(),
    );
  }
}

