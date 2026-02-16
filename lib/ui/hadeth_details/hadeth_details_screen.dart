import 'package:flutter/material.dart';
import 'package:islami_c17/model/HadethModel.dart';

class HadethDetailsScreen extends StatelessWidget{
  static const String routeName = "hadeth";
  const HadethDetailsScreen({super.key});
  @ override
  Widget build(BuildContext context) {
    HadethModel hadethModel = ModalRoute.of (context)!.settings.arguments as HadethModel;
    return Scaffold();


  }
}