class Tag {
  final String tagID;
  final String name;

  Tag({this.tagID, this.name});

  Tag.fromJson(Map<String, dynamic> json) : tagID = json['tagID'];

  Map<String, dynamic> toJson() => {'tagID': tagID, 'name': name};
}
