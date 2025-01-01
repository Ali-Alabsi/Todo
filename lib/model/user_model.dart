class usersModel{
  int? id;
  String name;
  String email;
  String phone;
  String image;

  usersModel({
     this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image
  });


  factory usersModel.fromJson(Map<String, dynamic> json){
    return usersModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image']
    );
  }
  Map<String , dynamic> toMap(){
    final map =  Map<String , dynamic>();
    // map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['image'] = image;
    return map;
  }

}