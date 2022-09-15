
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
import 'package:football_app/shared/style/color.dart';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import '../../shared/constant/constant.dart';

class FootballCubit extends Cubit<FootballStates>
{

  FootballCubit() : super(FootballInitialState());

  static FootballCubit get(context) => BlocProvider.of(context);

   MatchesModel? matchModel ;
   int? leagueId0 ;

  void getHomeData({leagueId})  // id , date, season
  {
    emit(FootballGetAllMatchesLoadingState());

        DioHelper.getData(
            url: 'fixtures',
            query: {
              "season": '2022',
              "date": DateFormat("yyyy-MM-dd").format(DateTime.now()),
              "league" : '$leagueId'
            }
        ).then((value)
        {
          printFullText(value!.data.toString());
          emit(FootballGetAllMatchesSuccessfulState());
          matchModel = MatchesModel.fromJson(value.data);
          print(matchModel!.dataOfMatches[0].teams!.home!.name.toString());

           leagueId0 = leagueId;

        }).catchError((error)
        {
          print(error.toString());
          emit(FootballGetAllMatchesErrorState());
        });

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



  Color get itemColor {
    switch (leagueId0) {
      case 2:  //39
        return Colors.purple;
      case 135:
        return Colors.blue;
      case 140:
        return Colors.yellow.shade800;
      case 78:
        return Colors.red;
      case 61:
        return Colors.grey;
      default:
        return color_of_app;
    }
  }

  void changeScreen(int index)
  {
    currentIndex = index ;
    emit(FootBallChangeScreen());
  }

}