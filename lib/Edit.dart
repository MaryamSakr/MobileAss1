import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditScreen extends StatelessWidget {
  static String id = 'EditScreen';
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Profile ",
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

      body: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            padding:const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(color: Colors.black12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                prefixIcon: Icon(Icons.person),
                hintText: 'user name',
                fillColor: Colors.grey,
              ),
            ),
          ),


          const SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              enabled: false,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(color: Colors.black12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                prefixIcon: Icon(Icons.person),
                hintText: 'Id',
                fillColor: Colors.grey,
              ),
            ),
          ),

          const SizedBox(height: 20),
          Container(
            padding:const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(color: Colors.black12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                prefixIcon: Icon(Icons.person),
                hintText: 'email',
                fillColor: Colors.grey,
              ),
            ),
          ),


          const SizedBox(height: 20),
          Container(
            padding:const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(color: Colors.black12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                prefixIcon: Icon(Icons.person),
                hintText: 'Gender',
                fillColor: Colors.grey,
              ),
            ),
          ),

          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(color: Colors.black12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                prefixIcon: Icon(Icons.person),
                hintText: 'Level',
                fillColor: Colors.grey,
              ),
            ),
          ),

          SizedBox(height: 30,),

          Container(
            alignment: const Alignment(0.85 , 0),
            child: ElevatedButton(
            
              onPressed: (){
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => const EditScreen()),
                );
            
              },
            
            
              child: Container(
                alignment: const Alignment(0 , 0.1),
                height: 50,
                width: 57,
                child:const Text(
                  'Save',
                  style: TextStyle(
            
                      fontSize: 18,
                      color: Colors.indigo
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
