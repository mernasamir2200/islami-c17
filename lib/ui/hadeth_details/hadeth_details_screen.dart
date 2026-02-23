import 'package:flutter/material.dart';
import 'package:islami_c17/model/HadethModel.dart';
import 'package:islami_c17/core/resources/AssetsManager.dart';
import 'package:islami_c17/core/resources/ColorsManager.dart';
class HadethDetailsScreen extends StatelessWidget{
  static const String routeName = "hadeth";
  const HadethDetailsScreen({super.key});
  @ override
  Widget build(BuildContext context) {
    HadethModel hadethModel = ModalRoute.of (context)!.settings.arguments as HadethModel;
    return Scaffold(
      backgroundColor: ColorsManager.secondaryColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: ColorsManager.onPrimaryColor,
        ),
        title: Text('Hadeth ${hadethModel.number}'),
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: ColorsManager.primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w700
        ),

      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 18,
                right: 18,
                top: 18,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AssetsManager.quran_left_corner),
                      Text(hadethModel.title,style: TextStyle(
                        color: ColorsManager.onPrimaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),),
                      Image.asset(AssetsManager.quran_right_corner),
                    ],
                  ),
                  Expanded(
                   child:SingleChildScrollView(
                      child: Text(hadethModel.content,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorsManager.primaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          height: 2.5,),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(AssetsManager.masgd_bottom_decoration),
        ],
      ),
    );



  }
}