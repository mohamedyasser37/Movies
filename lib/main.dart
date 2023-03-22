import 'package:flutter/material.dart';
import 'package:movies/screens/home_scrren.dart';
import 'package:movies/screens/movie_details2.dart';
import 'package:movies/screens/movie_detilse.dart';

import 'package:movies/screens/show_movie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName:(context) => HomeScreen(),
        MovieDetail.routeName:(context) => MovieDetail(),
        MovieDetail2.routeName:(context) => MovieDetail2(),
              ShowMovie.routeName:(context) => ShowMovie(),

      },
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //
      // ),
    );
  }
}


