import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/layout/cubit/cubit.dart';
import 'package:football_app/layout/cubit/state.dart';

class FootballLayout extends StatelessWidget
{
  const FootballLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FootballCubit,FootballStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var cubit = FootballCubit.geto(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('football Layout'),
          ),
          body:
          Column(
            children: [
              Container(
                color: Colors.blue,
                height: 80.0,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index) => buildLeagueItem(index,context) ,
                  separatorBuilder: (context,index ) => SizedBox(width: 5.0,),
                  itemCount: 5,
                ),
              ),
              cubit.leagueScreens[cubit.currentIndex],
            ],
          ),


        );
      } ,
    );
  }
  Widget  buildLeagueItem(index,context) => InkWell(
    onTap:() {
      FootballCubit.geto(context).changeScreen(index);
      },

    child: Container(
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      clipBehavior:Clip.antiAliasWithSaveLayer ,
      child: Image(
        image: NetworkImage("https://2.bp.blogspot.com/-EREH6W98EXU/XNVkWSIhfgI/AAAAAAAB7R4/Kt4WHlhPBYIJ9MZkxJ9v-fL9hLbWHXQwgCLcBGAs/s1600/all-new-serie-a-logo%2B%25281%2529.jpg"),
        width: 80.0,
        height: 80.0,
        fit:BoxFit.cover ,
      ),
    ),
  ) ;

}