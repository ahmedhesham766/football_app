class MatchesModel {
  late int result ;
  List<DataOfMatch>? dataOfMatches = [];

  MatchesModel(this.result, this.dataOfMatches);

  MatchesModel.fromJson(Map<String ,dynamic> json)
  {
    result = json['results'] ;
    json['response'].forEach((element)
    {
      dataOfMatches?.add(DataOfMatch.fromJson(element));
    });
  }
}

class DataOfMatch {
  Fixture? fixture ;
  late League league ;
  Teams? teams ;
  late Goals goals ;

  DataOfMatch(
      this.fixture,
      this.league,
      this.teams,
      this.goals,);

  DataOfMatch.fromJson(Map<String ,dynamic> json)
  {
    fixture = Fixture.fromJson(json['fixture']) ;
    league = League.fromJson(json['league']) ;
    teams = Teams.fromJson(json['teams']) ;
    goals = Goals.fromJson(json['goals']) ;
  }

}

class Fixture {
  late int id;
  late String date ;
  Status? status;

  Fixture(
      this.id,
      this.date,
      this.status);

  Fixture.fromJson(Map<String ,dynamic> json)
  {
    id = json['id'];
    date = json['date'];
    status = Status.fromJson(json['status']);
  }
}

class Status{
  String? longHalf ;
  String? shortHalf;
  int? elapsedTime;

  Status(
      this.longHalf,
      this.shortHalf,
      this.elapsedTime);

  Status.fromJson(Map<String ,dynamic> json)
  {
    longHalf = json['long'] ;
    shortHalf = json['short'] ;
    elapsedTime = json['elapsed'] ;
  }
}

class League {
  late int id ;
  late String name;
  String? logo;
  String? flagOfCountry;
 String? round;

  League(this.id,
      this.name,
      this.logo,
      this.flagOfCountry,
      this.round);

  League.fromJson(Map<String ,dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    flagOfCountry = json['flag'];
    round = json['round'];
  }

}

class Teams {
  DataOfTeam? home ;
  DataOfTeam? away;

  Teams(this.home, this.away);
  Teams.fromJson(Map<String ,dynamic> json)
  {
    home = DataOfTeam.fromJson(json['home']) ;
    away =  DataOfTeam.fromJson(json['away']);
  }
}

class DataOfTeam {
  late int id;
  late String name;
  late String logo;
  bool? winner;

  DataOfTeam(this.id,
      this.name,
      this.logo,
      this.winner);
  DataOfTeam.fromJson(Map<String ,dynamic> json)
  {
    id=json['id'];
    name=json['name'];
    logo=json['logo'];
    winner=json['winner'];
  }
}

class Goals {
  int? home;
  int? away;

  Goals(this.home,
      this.away,);

  Goals.fromJson(Map<String ,dynamic> json)
  {
    home=json['home'];
    away=json['away'];
  }

}