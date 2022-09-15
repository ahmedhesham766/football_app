import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_app/shared/style/color.dart';
import 'package:intl/intl.dart';

import '../../layout/cubit/cubit.dart';
import '../../models/live_matches_model/live_matches_model.dart';


Widget buildMatchesItem(DataOfMatch model,context,{
  String? formattedTime,

}) => InkWell(
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
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(10,10)
          )
        ],

      ),
      child: Column(
        children: [
          Row(
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
              (model.fixture!.status!.shortHalf == "NS")?
              Expanded(
                child: Text(
                  formattedTime.toString(),
                  //"${model.goals.home?? 0} - ${model.goals.away?? 0}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ): Expanded(
                  child: (model.goals.home != null && model.goals.away != null)
                      ? Column(

                        children: [
                          Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                  "${model.goals.home}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              const Text(
                                '-',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                  "${model.goals.away}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                  ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                                 Text(
                                    "${model.fixture!.status!.elapsedTime}mins",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                    'Live',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: color_of_app,
                                    fontSize: 15.0
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ): Container()

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
        ],
      ),
    )
);

Widget buildNoMatchesToday(context) => Padding(
  padding: const EdgeInsets.all(30.0),
  child:   Container(

    height: 250,

    width: double.infinity,


    decoration: BoxDecoration(

      color: color_of_app,

      boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(10,10)
        )
      ],

      borderRadius: BorderRadius.all(

        Radius.circular(24.0),

      ),

    ),

    child: Column(

      mainAxisAlignment: MainAxisAlignment.center,

      children: [

        Image.asset("assets/images/schedule.png"),
          SizedBox(
            height: 15.0,
          ),
        Text(
            "No Matches right now ",
          style: TextStyle(
              fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),

      ],

    ),

  ),
);



