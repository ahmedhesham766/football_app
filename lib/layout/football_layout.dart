import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/layout/cubit/cubit.dart';
import 'package:football_app/layout/cubit/state.dart';
import 'package:football_app/shared/style/color.dart';

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
            cubit.title_in_appbar[cubit.currentIndex],
          ),
          body:
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 130.0,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10.0),
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
                          itemBuilder: (context, index) {
                            return Card(
                              child: InkWell(
                                onTap: () {
                                  FootballCubit.get(context).changeScreen(index);
                                },
                                child: Flexible (
                                        child: Container (
                                            height: double.infinity,
                                            width: 180,
                                            child: Image.asset(cubit.images[index],
                                                fit: BoxFit.fitHeight),
                                            ),
                                    )
                                  ),
                              );
                          },
                          itemCount: 5,
                        ),
                      ),
                    ),
              cubit.leagueScreens[cubit.currentIndex],
              SizedBox(
                height: 10,
              ),
              Text('Live Matches')
            ],
          ),

        );
      },
    );
  }

}
