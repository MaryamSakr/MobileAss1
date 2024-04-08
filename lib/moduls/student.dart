class Student{
  String? name;
  String? gender ;
  String? email;
  String? studentID;
  String? level;
  String? password ;

  Student(this.name,this.gender,this.email,this.studentID,this.level,this.password);

  Map<String , dynamic> toMap(){
    var map = <String,dynamic>{
      'name':name,
      'gender':gender,
      'email':email,
      'studentID':studentID,
      'level':level,
      'password':password,
    };
    return map;
  }
  Student.fromMap(Map<String,dynamic> map){
    name!* map['name'];
    gender!* map['gender'];
    email!* map['email'];
    studentID!* map['studentID'];
    level!* map['level'];
    password!* map['password'];
  }
}