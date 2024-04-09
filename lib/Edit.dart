

import 'package:first_assiment/moduls/student.dart';

import 'DataBaseHandler/FileHelper.dart';
import 'package:first_assiment/profile.dart';
import 'package:flutter/material.dart';


class Edit extends StatefulWidget {
  var name , id , email , Gender , Level , user , Pass;
  Edit({Key? myKey , this.name, this.id , this.email , this.Gender , this.Level , this.user , this.Pass}) : super(key: myKey);
  @override
  State<StatefulWidget> createState() {
    return EditScreenState();
  }
}


class EditScreenState extends State<Edit> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController levelController = TextEditingController();
  bool show = true;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo),
              ),
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.indigo,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              centerTitle: true,
            ),
            body: Center(

                child: Column(
                    children: [

                      const SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: usernameController,
                          enabled: true,
                          decoration: InputDecoration(
                            hintText: "${widget.name}",
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(30)),
                              borderSide: BorderSide(color: Colors.black12),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(30)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            prefixIcon: const Icon(Icons.person),
                            fillColor: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: "${widget.id}",
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: const Icon(Icons.mail),
                        fillColor: Colors.grey,
                      ),
                    ),
                ),
                      const SizedBox(height: 20),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: "${widget.Gender}",
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: const Icon(Icons.info),
                        fillColor: Colors.grey,
                      ),
                    ),
                ),


                      const SizedBox(height: 20),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: genderController,
                      enabled: true,
                      decoration: InputDecoration(
                        hintText: "${widget.email}",
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: const Icon(Icons.person_2_sharp),
                        fillColor: Colors.grey,
                      ),
                    ),),

                      const SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: levelController,
                          enabled: true,
                          decoration: InputDecoration(
                            hintText: "Level ${widget.Level}",
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(30)),
                              borderSide: BorderSide(color: Colors.black12),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(30)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            prefixIcon: const Icon(Icons.book),
                            fillColor: Colors.grey,
                          ),
                        ),),
                      const SizedBox(height: 20),
                      GestureDetector(

                        onTap: () async {
                          localStorge data = localStorge();
                          Student std = await data.getData(usernameController.text);
                          print(usernameController.text);
                          if(usernameController.text!= "" ){
                            std.name = usernameController.text;
                            std.gender = widget.Gender;
                            std.level = widget.Level;
                          } if(genderController.text!= ""){
                            std.name = widget.name;
                            widget.email=genderController.text;
                            std.level = widget.Level;
                          } if(levelController.text!= ""){
                            std.name = widget.name;
                            std.gender = widget.Gender;
                            std.level = levelController.text;
                          }if(levelController.text== "" &&genderController.text== "" && usernameController.text== ""){
                            std.name = widget.name;

                            std.gender = widget.Gender;
                            std.level = widget.Level;
                          }
                          data.UpdateStudent(widget.email , std);
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                                  Profile(name: "${std.name}",
                                    id: "${widget.id}",
                                    email: "${widget.email}",
                                    Gender: "${std.gender}",
                                    Level: "${std.level}",)));
                        },
                        child: Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              'Save', style: TextStyle(color: Colors.white),),
                          ),
                        ),

                      ),

                    ]
                )
            )
        )
    );
  }
}


