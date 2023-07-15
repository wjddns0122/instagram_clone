import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/src/binding/init_binding.dart';

import 'src/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent),
      home: const App(),
      initialBinding: InitBinding(),
    );
  }
}
