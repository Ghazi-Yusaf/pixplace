class Collection {
  final String tagID;
  final String ownerID;
  final String name;
  final String description;
  final List<String> postsIDs;

  Collection(
      {this.tagID, this.name, this.ownerID, this.description, this.postsIDs});

  Collection.fromJson(Map<String, dynamic> json)
      : tagID = json['tagID'],
        name = json['name'],
        ownerID = json['ownerID'],
        description = json['description'],
        postsIDs = List.from(json['postsIDs']);

  Map<String, dynamic> toJson() => {
        'tagID': tagID,
        'name': name,
        'ownerID': ownerID,
        'description': description,
        'postsIDs': postsIDs
      };
}
