import 'package:flutter/material.dart';
import 'package:flutter_rojects/files.dart';
import 'package:flutter_rojects/first_screen.dart';
import 'package:flutter_rojects/models/Files.dart';
import 'package:provider/provider.dart';
// import 'home.dart';
import 'FilesDetaliedScreen.dart';
import 'second_screen.dart';
// import 'first_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx)=>Files(),),
      ],
        child: MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: const screen(),
          routes: {
            firstScreen.id:(context) => const firstScreen(),
            secondScreen.id:(context) => const secondScreen(),
            "FilesDetaliedScreen":(context) => const FilesDetaliedScreen(),
          },
        ),
    );
  }
}

