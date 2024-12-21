class TasksModel{
  final int? id;
  final String title;
  final String dateWrite;
  final String dateEnd;
  final String details;
  final String status = "Tasks";
  TasksModel({
    this.id,
    required this.title,
    required this.dateWrite,
    required this.dateEnd,
    required this.details,
});
  Map<String , dynamic> toMap(){
    final map =  Map<String , dynamic>();
    // map['id'] = id;
    map['title'] = title;
    map['dateWrite'] = dateWrite;
    map['dateEnd'] = dateEnd;
    map['details'] = details;
    map['status'] = status;
    return map;
  }
  factory TasksModel.fromMap (Map<String , dynamic> map){
    return TasksModel(
      id: map['id'],
      title: map['title'],
      dateWrite: map['dateWrite'],
      dateEnd: map['dateEnd'],
      details: map['details'],
    );
  }
}