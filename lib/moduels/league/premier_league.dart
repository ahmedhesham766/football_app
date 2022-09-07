import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/layout/cubit/cubit.dart';
import 'package:football_app/layout/cubit/state.dart';

class PremierLeague extends StatelessWidget{
  const PremierLeague({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FootballCubit,FootballStates>
      ( listener: (context,state){},
      builder: (context,state) {
        var cubit = FootballCubit.get(context);
        return Text('pr');
      });
  }
}