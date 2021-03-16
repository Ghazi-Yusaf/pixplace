class Challenge {
  final String challengeID;
  final String name;
  final int points;
  final int deadline;
  final String description;

  Challenge(
      {this.challengeID,
        this.name,
      this.points,
      this.deadline,
      this.description,
     });

  Challenge.fromJson(Map<String, dynamic> json)
      : challengeID = json['challengeID'],
        name = json['name'],
        points = json['points'],
        deadline = json['deadline'],
        description = json['description'];

  Map<String, dynamic> toJson() => {
        'challengeID': challengeID,
        'name': name,
        'points': points,
        'deadline': deadline,
        'description': description
      };
}
