import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/layout/cubit/cubit.dart';
import 'package:football_app/layout/cubit/state.dart';
import 'package:football_app/models/live_matches_model/live_matches_model.dart';
import 'package:football_app/shared/constant/constant.dart';

class PremierLeague extends StatelessWidget{

   PremierLeague({Key? key}) : super(key: key){}

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FootballCubit,FootballStates>
      ( listener: (context,state){},
      builder: (context,state) {
        var cubit = FootballCubit.get(context);
        MatchesModel? res = cubit.getHomeData(idOfLeagues[0]);
     
        return Text('pr');
      });
  }
}