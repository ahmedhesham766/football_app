import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/layout/cubit/cubit.dart';
import 'package:football_app/layout/cubit/state.dart';
import 'package:football_app/shared/style/color.dart';

class PremierLeague extends StatelessWidget {
  const PremierLeague({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
        itemBuilder: (context, index) => buildtodayMatches(context, index),
        separatorBuilder: (context, index) => SizedBox(height: 20.0,),
        itemCount: 5);
  }
}

Widget buildtodayMatches(context,index) =>
    Expanded(
      child: Container(
        height: 50,
      color: color_of_app,
      child: Row(
        children: [
          Text(
            'Manchester City',
            style: TextStyle(
              color: Colors.white
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Image(
            image: NetworkImage('https://th.bing.com/th/id/R.a3170f423191a8afa542f3772cd5225f?rik=msn%2fILJMW1UDzQ&riu=http%3a%2f%2fwww.designfootball.com%2fimages%2fjoomgallery%2fdetails%2ffootball_crests_8%2fmanchester_city_crest_redesign_hybrid_1980__2017_20180423_1022337712.png&ehk=gOJehWLQjJU7LvILqR03%2frG9xI0z8LzolfXYkaGvKbg%3d&risl=&pid=ImgRaw&r=0'),
          ),
          SizedBox(
            width: 15.0,
          ),
          Text('5'),
          Text('-'),
          Text('3'),
          SizedBox(
              width: 15.0,
          ),
          Image(
              image: NetworkImage('https://th.bing.com/th/id/OIP.hngKcj6wuBs4H38ssoskWwHaHg?pid=ImgDet&rs=1')
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            'Manchester United',
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ],
),
),
    );