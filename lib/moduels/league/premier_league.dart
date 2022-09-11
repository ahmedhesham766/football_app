import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/layout/cubit/cubit.dart';
import 'package:football_app/layout/cubit/state.dart';

import '../../layout/cubit/state.dart';
import '../../models/live_matches_model/live_matches_model.dart';
import '../../shared/constant/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../shared/style/color.dart';

class PremierLeague extends StatelessWidget{
  const PremierLeague({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FootballCubit,FootballStates>
      ( listener: (context,state){},
      builder: (context,state) {
        var cubit = FootballCubit.get(context);
        //MatchesModel? res = cubit.getHomeData(idOfLeagues[0]);


           var len = cubit.matchModel?.dataOfMatches.length?? 0 ;
           print('data from model:');
           print(cubit.matchModel?.dataOfMatches[0].teams!.home!.name);
        return Container(
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) => buildMatchesItem(cubit.matchModel!.dataOfMatches[index],context),
                  itemCount: len),
        );
      });
  }
}

Widget buildMatchesItem(DataOfMatch model,context) => InkWell(
  onTap: ()
  {

  },
  child: Container(
      height: 70.0,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: FootballCubit.get(context).itemColor,
        borderRadius: BorderRadius.all(
            Radius.circular(10.0),
        ),
    ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Expanded(
          child: Text(
            model.teams!.home!.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),

        ),
        CachedNetworkImage(
            width: 36,
              fit: BoxFit.cover,
              imageUrl: model.teams!.home!.logo,
              placeholder: (context , url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        Expanded(
          child: Text(
            "${model.goals.home?? 0} - ${model.goals.away?? 0}",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
          CachedNetworkImage(
            width: 36,
            fit: BoxFit.cover,
            imageUrl: model.teams!.away!.logo,
            placeholder: (context , url) => Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        Expanded(
            child: Text(
              model.teams!.away!.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
      ],
    ),
  )
);