class TaskModel {
  String? title;
  String? subtitle;
  bool? status;

  TaskModel({
    required this.title,
    required this.subtitle,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'status': status,
    };
  }

  TaskModel.fromJason(Map<String, dynamic> json)
      : title = json['title'],
        subtitle = json['subtitle'],
        status = json['status'];
}
