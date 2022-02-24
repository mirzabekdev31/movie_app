import 'package:flutter/material.dart';
import 'package:movie_app/view/home_page.dart';
import 'package:movie_app/view_model/movies_list_vm.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: MoviesListViewModel())
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}


