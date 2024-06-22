import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/auth.dart';
import 'package:flutter_application_1/helper/databaseService.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthServices authServices = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(''),
          ElevatedButton(
              onPressed: () {
                AuthServices().register();
              },
              child: Text('register')),
          ElevatedButton(onPressed: () {}, child: Text('login')),
          ElevatedButton(
              onPressed: () {
                DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                    .createGroup(id: FirebaseAuth.instance.currentUser!.uid);
              },
              child: Text('create group')),
        ],
      ),
    );
  }
}
