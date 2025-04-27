import 'package:flutter/material.dart';
import 'src/core/presentation/personalization/pages/personal_data_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personalization Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: PersonalDataPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}