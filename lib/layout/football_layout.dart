import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/layout/cubit/cubit.dart';
import 'package:football_app/layout/cubit/state.dart';
import 'package:football_app/shared/style/color.dart';
import 'package:intl/intl.dart';

class FootballLayout extends StatelessWidget {
  const FootballLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FootballCubit, FootballStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = FootballCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title:
              Text(DateFormat("yyyy-MM-dd").format(DateTime.now()))
            //cubit.title_in_appbar[cubit.currentIndex],
          ),
          body:
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 130.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(10,10)
                        )
                      ]
                    ),
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => buildLeagueItem(context,index),
                            itemCount: 5,
                          ),
                        ),
                      ),
                cubit.leagueScreens[cubit.currentIndex],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildLeagueItem(context, index) =>
      Card(
        child: InkWell(
            onTap: () {
              FootballCubit.get(context).changeScreen(index);
            },
            child:  Container (
              width: MediaQuery.of(context).size.width/2,
              child: Container (
                height: double.infinity,
                width: 180,
                decoration: BoxDecoration(
                  color:  FootballCubit.get(context).currentIndex == index ?  color_of_app : Colors.white
                ),
                child: Image.asset(FootballCubit.get(context).images[index],
                    fit: BoxFit.fitHeight),
              ),
            )
        ),
      );
}
