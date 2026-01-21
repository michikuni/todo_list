import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/data/datasources/remote/firebase/firebase_config.dart';

void main() {
  firebaseSetup();
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: TextButton(onPressed: (){
          
        }, child: Icon(Icons.add_circle, size: 50,)),
      ),
    );
  }
}