import 'package:flutter/material.dart';
import 'package:islami_c17/ui/hadeth_details/hadeth_details_screen.dart';
import 'package:islami_c17/ui/home/screen/home_screen.dart';
import 'package:islami_c17/ui/home/sura_details/screen/sura_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: HomeScreen.routeName,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName:(_)=>HomeScreen(),
        SuraDetailsScreen.routeName:(_)=>SuraDetailsScreen(),
        HadethDetailsScreen.routeName:(_) => HadethDetailsScreen()
      },
    );
  }
}
