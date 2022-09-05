import 'package:http/http.dart';

import '../../constant/constant.dart';

class FootballApi {

  static final Uri liveMatchesapiUrl = "https://v3.football.api-sports.io/fixtures?live=all" as Uri;


  static const  headers = {
    //'x-rapidapi-host': "v3.football.api-sports.io",
    'x-apisports-key': "9dc71ce9d11083e33484493a81fc2cf6",
  };

}