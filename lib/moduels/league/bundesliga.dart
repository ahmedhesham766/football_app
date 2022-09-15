import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/moduels/league/premier_league.dart';
import 'package:intl/intl.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/state.dart';
import '../../shared/components/components.dart';
import '../../shared/constant/constant.dart';

class BundesLiga extends StatelessWidget{
  const BundesLiga({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => FootballCubit()..getHomeData(leagueId: idOfLeagues[3]),
      child: BlocConsumer<FootballCubit,FootballStates>
        ( listener: (context,state){},
          builder: (context,state) {
            var cubit = FootballCubit.get(context);

            var len = cubit.matchModel?.dataOfMatches.length?? 0 ;

            return  ConditionalBuilder(
              condition: cubit.matchModel?.result != 0,
              builder : (context) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'BundesLiga',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: cubit.itemColor
                        )
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (context, index) => buildMatchesItem(cubit.matchModel!.dataOfMatches[index],context,
                          formattedTime: DateFormat("h:mm a").format(DateTime.parse(cubit.matchModel!.dataOfMatches[index].fixture!.date).toLocal())),
                      itemCount: len),
                ],
              ),
              fallback: (context) => buildNoMatchesToday(context),
            );
          }),
    );
  }
}