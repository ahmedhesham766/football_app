import 'dart:convert';

import 'package:football_app/models/live_matches_model/live_matches_model.dart';
import 'package:http/http.dart';

import '../../constant/constant.dart';

class FootballApi {

  static const baseUrl = "https://v3.football.api-sports.io/";


  static const  headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': "b2f89fdb1e9008313dc36e2d08805388",
  };

  static Future<List<DataOfMatch>> getLeagueMatches(String season, String leagueId) async
  {
    final url = Uri.parse(baseUrl + "fixtures?season=${season.toString()}&league=${leagueId.toString()}");
    Response res = await get(url,headers: headers);
    List<DataOfMatch> matches = [];
   if(res.statusCode == 200)
     {
       var body = jsonDecode(res.body);
       List<dynamic> matchesList = body['response'];
       print("getLeagueMatches: $body");
       matches = matchesList.map((dynamic e) => DataOfMatch.fromJson(e)).toList();
     }
   return matches;
  }

}
