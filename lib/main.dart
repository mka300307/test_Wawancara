import 'package:boilerplate_mobile_new/pages/list_movie/binding/movie_binding.dart';
import 'package:boilerplate_mobile_new/pages/list_movie/view/list_movie.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(GetMaterialApp(
    initialBinding: MovieBinding(),
    home: MyApp(),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MovieListPage(),
    );
  }
}

