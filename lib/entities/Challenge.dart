class Challenge {
  final String challengeID;
  final int points;
  final int deadline;
  final String description;
  final List<String> rules;
  final List<String> userIDs;

  Challenge(
      {this.challengeID,
      this.points,
      this.deadline,
      this.description,
      this.rules,
      this.userIDs});

  Challenge.fromJson(Map<String, dynamic> json)
      : challengeID = json['challengeID'],
        points = json['points'],
        deadline = json['deadline'],
        description = json['description'],
        rules = List.from(json['rules']),
        userIDs = List.from(json['userIDs']);

  Map<String, dynamic> toJson() => {
        'challengeID': challengeID,
        'points': points,
        'deadline': deadline,
        'description': description,
        'rules': rules,
        'userIDs': userIDs
      };
}
