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
import '../../shared/constant/constant.dart';

class FootballCubit extends Cubit<FootballStates>
{
  FootballCubit() : super(FootballInitialState());

  static FootballCubit geto(context) => BlocProvider.of(context);

  // Future<List<MatchesModel>> GetAllMatch()
  // async {
  //     Response res = await get(FootballApi.liveMatchesapiUrl,headers: FootballApi.headers);
  //     var body;
  //     if(res.statusCode == 200){
  //     body = jsonDecode(res.body);
  //     List<dynamic> matchesList = body['response'];
  //     print("Api service: ${body}"); // to debug
  //     List<MatchesModel> matches = matchesList
  //         .map((dynamic item) => MatchesModel.fromjson(item))
  //         .toList();
  //
  //     return matches;}
  // }


  MatchesModel? matchModel ;

   void getHomeData()
  {
    print('1111111111111111');
    //emit(ShopLoadingHomeDataState());
    DioHelper.getData(
      url: 'fixtures',
      query: {"live": "all"}
    ).then((value)
    {
      print('1111111111111111');
      matchModel = MatchesModel.fromJson(value?.data) ;
      print('22222222222222222');
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

  void changeScreen(int index)
  {
    currentIndex = index ;
    emit(FootBallChangeScreen());
  }

}