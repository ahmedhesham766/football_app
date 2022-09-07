import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/layout/cubit/state.dart';
import 'package:football_app/models/live_matches_model/live_matches_model.dart';
import 'package:football_app/moduels/league/bundesliga.dart';
import 'package:football_app/moduels/league/french_league.dart';
import 'package:football_app/moduels/league/laliga.dart';
import 'package:football_app/moduels/league/premier_league.dart';
import 'package:football_app/moduels/league/seriaA.dart';
import 'package:football_app/shared/network/remote/api_manager.dart';
import 'package:football_app/shared/network/remote/dio_helper.dart';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import '../../shared/constant/constant.dart';

class FootballCubit extends Cubit<FootballStates>
{

  FootballCubit() : super(FootballInitialState());

  static FootballCubit get(context) => BlocProvider.of(context);


 // MatchesModel? matchModel ;
//List<MatchesModel> matchesLive = [] ;

   MatchesModel? getHomeData(int league)  // id , date, season
  {
    emit(FootballGetAllMatchesLoadingState());
    DioHelper.getData(
      url: 'fixtures',
      query: {
        "season": "2022",
        "date": DateFormat("yyyy-MM-dd").format(DateTime.now()),
        "league" : "$league"

      }
    ).then((value)
    {
     // printFullText(value!.data.toString());
     // matchModel = MatchesModel.fromJson(value.data);
     // print(matchModel!.result.toString());
      emit(FootballGetAllMatchesSuccessfulState());
      return  MatchesModel.fromJson(value!.data);
    });
    return null;/*.catchError((error)
    {
      print(error.toString());
      emit(FootballGetAllMatchesErrorState());
    });*/
  }


  int currentIndex = 0 ;

  List <Widget> leagueScreens =
  [
     PremierLeague(),
    SeriaA(),
    LaLiga(),
    BundesLiga(),
    FrenchLeague(),
  ];
  List<Text> title_in_appbar =
  [
    Text('PrimierLeague',style: TextStyle(color: Colors.purple)),
    Text('SeriaA',style: TextStyle(color: Colors.blue),),
    Text('LaLiga',style: TextStyle(color: Colors.yellow.shade800),),
    Text('BundesLiga',style: TextStyle(color: Colors.red),),
    Text('Ligue1',style: TextStyle(color: Colors.grey),)
  ];


  List<String> images = [
    'assets/images/primierliga.png',
    'assets/images/seriaA.png',
    'assets/images/laliga.png',
    'assets/images/bundesliga.png',
    'assets/images/ligue1.png',
  ];


  void changeScreen(int index)
  {
    currentIndex = index ;
    emit(FootBallChangeScreen());
  }

}