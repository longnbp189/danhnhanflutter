import 'package:danhnhan/homeview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBOvviY6atxPsg7ye6hzGtwDwJj6UP8O6A",
      appId: "1:22533451396:android:7e81e5715e49c332135cd1",
      messagingSenderId: "22533451396",
      projectId: "danhnhan-ad28c",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: const Home(),
      );
}
