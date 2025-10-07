class Lists {
  int? id;
  String title;
  String summary;
  String urgency;
  String due;
  bool isClear;

  Lists({
    this.id,
    required this.title,
    required this.summary,
    required this.urgency,
    required this.due,
    required this.isClear,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'summary': summary,
      'urgency': urgency,
      'due': due,
      'isClear': isClear ? 1 : 0,
    };
  }

  factory Lists.fromMap(Map<String, dynamic> map) {
    return Lists(
      id: map['id'],
      title: map['title'],
      summary: map['summary'],
      urgency: map['urgency'],
      due: map['due'],
      isClear: map['isClear'] == 1,
    );
  }
}
