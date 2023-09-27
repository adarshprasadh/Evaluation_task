import 'package:evaltask_dob/constants/appconstants.dart';
import 'package:evaltask_dob/screens/dob_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title:AppConstants.customDob ,
      home: CustomDob(),
    );
  }
}
