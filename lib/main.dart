import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_clone/api/api_helper.dart';
import 'package:udemy_clone/bloc/bloc_page.dart';
import 'package:udemy_clone/travels/screens/detail_screen.dart';
import 'travels/screens/bottom_nav_screen/bootom_nav_page.dart';
import 'travels/screens/welcome_screen.dart';


void main() {
  runApp(const MyApp());
  ApiHelper.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc()..getDataFromApi(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primarySwatch: Colors.blue,
          ),
          home: WelcomeScreen()),
    );
  }
}
