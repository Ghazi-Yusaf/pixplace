class Tag {
  final String tagID;

  Tag({
    this.tagID,
  });

  Tag.fromJson(Map<String, dynamic> json) : tagID = json['tagID'];

  Map<String, dynamic> toJson() => {
        'tagID': tagID,
      };
}
