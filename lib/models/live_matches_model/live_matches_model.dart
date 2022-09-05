
class MatchesModel
{
  fixture? Fixture;
  Team? home;
  Team? away;
  Goal? goal;
  MatchesModel({
    this.Fixture,
    this.home,
    this.away,
    this.goal
  });
  MatchesModel.fromJson(Map<String,dynamic>? json)
  {
    Fixture = fixture.fromjson(json!['fixture']);
    home = Team.fromjson(json['teams']['home']) as Team?;
    away = Team.fromjson(json['teams']['away']) as Team?;
    goal = Goal.fromjson(json['goals']);

  }
}

class fixture{
  int? id;
  int? date;
  status? stat;
  fixture({
    this.id,
    this.date,
    this.stat
  });
  fixture.fromjson(Map<String,dynamic>? json)
  {
    id = json!['id'];
    date = json['date'];
    stat = status.fromjson(json['status']);
  }
}

class status{
  int? time;
  String? long;
  status({this.time , this.long});
  status.fromjson(Map<String,dynamic>? json)
  {
    time = json!['elapsed'];
    long = json['long'];
  }
}

class Team{
  int? id;
  String? name;
  String? logo;
  bool? winner;

  Team({
    this.id,
    this.name,
    this.logo,
    this.winner,
});

  Team.fromjson(Map<String,dynamic>? json)
  {
    id = json!['id'];
    name = json['name'];
    logo = json['logo'];
    winner = json['winner'];
  }
}

class Goal{
  int? home;
  int? away;
  Goal({
    this.home,
    this.away
});
  Goal.fromjson(Map<String,dynamic>? json)
  {
    home = json!['home'];
    away = json['away'];
  }
}
