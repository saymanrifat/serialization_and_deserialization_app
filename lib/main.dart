import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:serialization_and_deserialization_app/user_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel userObject = new UserModel(
      id: "0001", fullName: "Sayman", email: "saymanrifat@gmail.com");

  String userJson =
      '{"id":"0001","fullName":"Sayman Rifat","email":"saymanrifat@gmail.com"}';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Map<String, dynamic> userMap = userObject.toMap();
                var json = jsonEncode(userMap);
                print(json);
              },
              child: Text('Serialization'),
            ),
            SizedBox(
              width: 20,
            ),
            ElevatedButton(
              onPressed: () {
                var json = jsonDecode(userJson);
                var deserializedDate = UserModel.fromMap(json);
                print(
                    "Id: ${deserializedDate.id}, FullName: ${deserializedDate.fullName}, Email: ${deserializedDate.email}");
              },
              child: Text('Deserialization'),
            )
          ],
        ),
      )),
    );
  }
}
