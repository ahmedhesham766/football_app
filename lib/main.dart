import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/layout/cubit/cubit.dart';
import 'package:football_app/layout/cubit/state.dart';
import 'package:football_app/layout/football_layout.dart';
import 'package:football_app/moduels/screentest/SoccerAppScreen.dart';
import 'package:football_app/shared/network/remote/dio_helper.dart';


void main() {
  DioHelper.init();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FootballCubit()..getHomeData(),
      child: BlocConsumer<FootballCubit,FootballStates>(
        listener:(context, state) {}  ,
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home:SoccerAppScreen(),
          ) ;
        } ,

      ),
    );
  }
}

