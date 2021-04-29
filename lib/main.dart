import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_with_cubit/news_cubit/news_cubit.dart';
import 'package:news_api_with_cubit/screen/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NewsCubit()..getNewsList(),
          child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.white
        ),
        home: HomeScreen(),
      ),
    );
  }
}


