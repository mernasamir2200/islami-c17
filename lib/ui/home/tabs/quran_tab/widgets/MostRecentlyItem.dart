import 'package:flutter/material.dart';
import 'package:islami_c17/core/resources/AssetsManager.dart';
import 'package:islami_c17/core/resources/ColorsManager.dart';
class MostRecentlyItem extends StatelessWidget{
  const MostRecentlyItem ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: ColorsManager.primaryColor,
        borderRadius: BorderRadius.circular(20)
      ),
        child: Row(
        children: [
         Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text("AL-Anbiya",style: TextStyle(
               fontWeight: FontWeight.w700,
               fontSize: 24,
               color: ColorsManager.secondaryColor
             ),),
             Text("الأنبياء",style: TextStyle(
                 fontWeight: FontWeight.w700,
                 fontSize: 24,
                 color: ColorsManager.secondaryColor
             ),),
             Text("112 Verses",style: TextStyle(
                 fontWeight: FontWeight.w700,
                 fontSize: 14,
                 color: ColorsManager.secondaryColor
             ),),

           ],
         ),
         Image.asset(AssetsManager.img_most_recent) 
        ],
            ),
      );
  }
}