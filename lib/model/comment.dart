class Comment {
  Comment({String name,
    String link,
    String start,
    String end,
    String location,
  }) {
    name = name;
    link = link;
    start = start;
    end = end;
    location = location;
  }

  Comment.fromJson(dynamic json) {
    name = json['name'];
    link = json['link'];
    start = json['start'];
    end = json['end'];
    location = json['location'];
  }
  String name;
  String link;
  String start;
  String end;
  String location;

  }

