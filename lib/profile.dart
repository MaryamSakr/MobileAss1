import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:first_assiment/Edit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'DataBaseHandler/FileHelper.dart';

import 'moduls/student.dart';

class Profile extends StatefulWidget {
  var name , id , email , Gender , Level , user ,Pass;
  Profile({Key? myKey , this.name, this.id , this.email , this.Gender , this.Level , this.user , this.Pass}) : super(key: myKey);
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<Profile> {
  bool show = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  File? GalleryImage;
  Future PickImage(ImageSource source)async{
    final GalleryImage = await ImagePicker().pickImage(source: source);
    if (GalleryImage == null) return;

    final imageTemporary = File(GalleryImage.path);
    this.GalleryImage = imageTemporary;
    setState(() => this.GalleryImage = imageTemporary);
    //final imagePermenent = await saveImagePermenently(GalleryImage.path);
    //setState(()=> this.GalleryImage= imagePermenent);
  }

  /*Future<File> saveImagePermenently(String imagePath) async{
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }*/


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Profile",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold , color: Colors.indigo),
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
          body: SingleChildScrollView(
            child: Center(
            
              child: Column(
                children: [
                  GalleryImage != null?
                  Container(
                    width: 150,
                    height: 150,
                    child: CircleAvatar(
                      backgroundImage: FileImage(GalleryImage!)
                    ),
                  ) :const Icon(Icons.photo,size: 150,color: Colors.blueGrey,),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () => PickImage(ImageSource.camera),
                    child: Container(
                      height: 50,
                      width: 200,
                      child: const Row(
                        children: [
                           Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.camera , color: Colors.indigo ),
                          ),
                           Text(
                            'Take a picture',
                            style: TextStyle(
                                fontSize: 15,
                              color: Colors.indigo
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () => PickImage(ImageSource.camera),
                    child: Container(
                      height: 50,
                      width: 200,
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.image , color: Colors.indigo),
                          ),
                          Text(
                            'Upload From Gallery',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.indigo
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            
                  const SizedBox(height: 20),
            
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      enabled: false,
                      decoration:  InputDecoration(
                          hintText: "${widget.name}",
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon:const Icon(Icons.person),
                        fillColor: Colors.grey,
                      ),
                    ),
                  ),
            
            
                  const SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      enabled: false,
                      decoration:  InputDecoration(
                        hintText: "${widget.id}",
                        enabledBorder:const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                        focusedBorder:const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon:const Icon(Icons.mail),
                        fillColor: Colors.grey,
                      ),
                    ),
                  ),
            
                  const SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      enabled: false,
                      decoration:  InputDecoration(
                        hintText: "${widget.Gender}",
                        enabledBorder:const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                        focusedBorder:const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon:const Icon(Icons.info),
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
                        hintText: "${widget.email}",
                        enabledBorder:const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                        focusedBorder:const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
            
                        prefixIcon:const Icon(Icons.person_2_sharp),
                        fillColor: Colors.grey,
                      ),
                    ),
                  ),
            
                  const SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      enabled: false,
                      decoration:  InputDecoration(
                          hintText: "Level ${widget.Level}",
                        enabledBorder:const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                        focusedBorder:const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon:const Icon(Icons.book),
                        fillColor: Colors.grey,
                      ),
                    ),
            
                  ),
            
                  SizedBox(height: 50,),
            
                  GestureDetector(
                      onTap: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Edit(name: "${widget.name}",id: "${widget.id}" , email: "${widget.email}",Gender: "${widget.Gender}", Level: "${widget.Level}",Pass: "${widget.Pass}")));
                      },
                    child: Container(
                      width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:const Center(
                      child: Text('Edit',style: TextStyle(color: Colors.white),),
                    ),
                  ),
            
                  ),
            
            
            ])
            ),
          ),
        ));
  }
}




// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class AddIdea extends StatefulWidget {
//   @override
//   _AddIdeaState createState() => _AddIdeaState();
// }
//
// class _AddIdeaState extends State<AddIdea> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   late String name = '';
//   String email = '';
//   String phone = '';
//   double budgetFrom = 0.0;
//   double budgetTo = 0.0;
//   String address = '';
//   String location = '';
//   String description = '';
//   XFile? userPhoto; // Use XFile to store the user's selected photo
//   XFile? profilePhoto;
//
//   final List<String> locations = ['Location 1', 'Location 2', 'Location 3'];
//
//   Future<void> _getImage(bool isUserPhoto) async {
//     final ImagePicker _picker = ImagePicker();
//     final XFile? image = await _picker.pickImage(source: ImageSource.camera); // Capture a photo using the camera
//
//     setState(() {
//       if (isUserPhoto) {
//         userPhoto = image;
//       } else {
//         profilePhoto = image;
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Form'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: <Widget>[
//                 SizedBox(height: 25), // Add space at the top
//
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(30), // Adjust the circular border radius as needed
//                   child: TextFormField(
//                     decoration: const InputDecoration(
//                       hintText: 'Name',
//                       hintStyle: TextStyle(color: Color(0xFF0C61A4)),
//                     ),
//                     style: const TextStyle(color: Color(0xFF0C61A4)),
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Please enter your name';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       name = value!;
//                     },
//                   ),
//                 ),
//                 SizedBox(height: 25), // Add space after Name field
//
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(30), // Adjust the circular border radius as needed
//                   child: TextFormField(
//                     decoration: const InputDecoration(
//                       hintText: 'E-mail',
//                       hintStyle: TextStyle(color: Color(0xFF0C61A4)),
//                     ),
//                     style: const TextStyle(color: Color(0xFF0C61A4)),
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Please enter your email';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       email = value!;
//                     },
//                   ),
//                 ),
//                 SizedBox(height: 25), // Add space after Email field
//
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(30), // Adjust the circular border radius as needed
//                   child: TextFormField(
//                     decoration: const InputDecoration(
//                       hintText: 'Phone',
//                       hintStyle: TextStyle(color: Color(0xFF0C61A4)),
//                     ),
//                     style: const TextStyle(color: Color(0xFF0C61A4)),
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Please enter your phone number';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       phone = value!;
//                     },
//                   ),
//                 ),
//                 SizedBox(height: 25), // Add space after Phone field
//
//                 Row(
//                   children: <Widget>[
//                     Expanded(
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(30), // Adjust the circular border radius as needed
//                         child: TextFormField(
//                           decoration: const InputDecoration(
//                             hintText: 'Budget From',
//                             hintStyle: TextStyle(color: Color(0xFF0C61A4)),
//                           ),
//                           style: const TextStyle(color: Color(0xFF0C61A4)),
//                           keyboardType: TextInputType.number,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please enter your budget from';
//                             }
//                             return null;
//                           },
//                           onSaved: (value) {
//                             budgetFrom = double.parse(value!);
//                           },
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     Expanded(
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(30), // Adjust the circular border radius as needed
//                         child: TextFormField(
//                           decoration: const InputDecoration(
//                             hintText: 'Budget To',
//                             hintStyle: TextStyle(color: Color(0xFF0C61A4)),
//                           ),
//                           style: const TextStyle(color: Color(0xFF0C61A4)),
//                           keyboardType: TextInputType.number,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please enter your budget to';
//                             }
//                             return null;
//                           },
//                           onSaved: (value) {
//                             budgetTo = double.parse(value!);
//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 25), // Add space after Budget To field
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(30), // Adjust the circular border radius as needed
//                   child: TextFormField(
//                     decoration: const InputDecoration(
//                       hintText: 'Address',
//                       hintStyle: TextStyle(color: Color(0xFF0C61A4)),
//                     ),
//                     style: const TextStyle(color: Color(0xFF0C61A4)),
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Please enter your address';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       address = value!;
//                     },
//                   ),
//                 ),
//
//
//
//
//                 SizedBox(height: 25,),
//                 Container(
//                   padding: const EdgeInsets.all(16.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.0),
//                     border: Border.all(color: Color(0xFF0C61A4))// Border radius to make it circular
//
//                   ),
//                   child: TextFormField(
//                     decoration: const InputDecoration(
//                       hintText: 'Description',
//                       hintStyle: TextStyle(color: Color(0xFF0C61A4)),
//                     ),
//                     style: const TextStyle(color: Color(0xFF0C61A4)),
//                     maxLines: 5,
//                     maxLength: 200,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Please enter a description';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       description = value!;
//                     },
//                   ),
//                 ),
//
//
//                 SizedBox(height: 25), // Add space after Description field
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         _getImage(true); // Capture user photo using the camera
//                       },
//                       child: userPhoto == null
//                           ? Container(
//                         height: 100,
//                         width: 200,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10.0),
//                           color: Colors.blue, // Add a placeholder color
//                        //   borderRadius: BorderRadius.circular(50), // Make it a circle
//                         ),
//                         alignment: Alignment.center,
//                         child: const Text(
//                           'Capture User Photo',
//                           style: TextStyle(color: Colors.white , fontSize: 20),
//                         ),
//                       )
//                           : ClipRRect(
//                         borderRadius: BorderRadius.circular(50), // Make it a circle
//                         child: Image.file(
//                           File(userPhoto!.path),
//                           height: 100,
//                           width: 100,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 25), // Add space after User Photo field
//                     InkWell(
//                       onTap: () {
//                         _getImage(true); // Capture user photo using the camera
//                       },
//                       child: userPhoto == null
//                           ? Container(
//                         height: 100,
//                         width: 200,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10.0),
//
//                           color: Colors.blue, // Add a placeholder color
//                           //   color: Colors.grey, // Add a placeholder color
//                           //    borderRadius: BorderRadius.circular(50), // Make it a circle
//                         ),
//                         alignment: Alignment.center,
//                         child: const Text(
//                           'Capture User Photo',
//                           style: TextStyle(color: Colors.white , fontSize: 20),
//                         ),
//                       )
//                           : ClipRRect(
//                         borderRadius: BorderRadius.circular(50), // Make it a circle
//                         child: Image.file(
//                           File(userPhoto!.path),
//                           height: 100,
//                           width: 100,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//
//                   ],
//                 ),
//
//
//                 SizedBox(height: 30), // Add space after Profile Photo field
//
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       _formKey.currentState!.save();
//                       // Now you can use the form data as needed, including userPhoto and profilePhoto.
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.blue,
//                     elevation: 10,
//                     // padding:EdgeInsets.all(),
//                   ),
//                   child: const Text('Submit',style:TextStyle(fontSize: 40,color: Colors.white) ,),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
