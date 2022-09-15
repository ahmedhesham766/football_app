
 import 'package:flutter/material.dart';
import 'package:football_app/layout/cubit/cubit.dart';
import 'package:intl/intl.dart';

const api_key = "12b71bf44a8b400ea6e1ea46cdcbc4fb" ;

void printFullText(String text)
{
 final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
 pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

 const List<int> idOfLeagues =[
  2, //primierleague //39
  135, //seriaA
  140, //laliga
  78, //bundesliga
  61, //ligue1
 ];

