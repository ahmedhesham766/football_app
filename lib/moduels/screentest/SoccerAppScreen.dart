import 'package:flutter/material.dart';

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
        body: FutureBuilder(
          future: FootballCubit.geto(context).GetAllMatch(),
          builder: (context,snapshot)
          {
            if(snapshot.hasData)
              {
                return Text("lalal") ;
              }
            else{
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
    );
  }
}
