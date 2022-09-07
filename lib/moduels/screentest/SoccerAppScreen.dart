import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:football_app/models/live_matches_model/live_matches_model.dart';
import 'package:football_app/moduels/screentest/pagescreen.dart';

import '../../layout/cubit/cubit.dart';

class SoccerAppScreen extends StatelessWidget {
  const SoccerAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text('test',style: TextStyle(
            color: Colors.black
          ),
          ),
          centerTitle: true,
        ),
        body: ConditionalBuilder(
          condition: FootballCubit.geto(context).matchModel != null,
          builder: (context) {
            return  Text('s');//PageBody(FootballCubit.geto(context).matchModel!.DataOfMatches);
          },
          fallback:(context) => Center(child: CircularProgressIndicator()),
        ),

        // body: FutureBuilder(
        //   future: FootballCubit.geto(context).getHomeData(),
        //   builder: (context,snapshot)
        //   {
        //     if(snapshot.hasData)
        //       {
        //         return  PageBody(snapshot.data as List<MatchesModel>);
        //       }
        //     else{
        //       return Center(child: CircularProgressIndicator());
        //     }
        //   },
        // ),
    );
  }
}
