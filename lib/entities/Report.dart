// class

class Report {
  final String reportID;
  final String postID;
  

  Report({
    this.postID,
    this.reportID,
  });

  Report.fromJson(Map<String, dynamic> json)
      : postID = json['postID'],
        reportID = json['reportID'];

  Map<String, dynamic> toJson() => {
        'postID': postID,
        'reportID': reportID
      };
}