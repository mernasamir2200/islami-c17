import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_c17/core/resources/ColorsManager.dart';
import 'package:islami_c17/model/SuraModel.dart';
import 'package:islami_c17/ui/home/sura_details/screen/sura_details_screen.dart';
import '../../../../../core/resources/AssetsManager.dart';

class SuraItem extends StatelessWidget{
  SuraModel suraModel;
  SuraItem(this.suraModel, {super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,
        arguments: suraModel);
      },
    child: Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(AssetsManager.img_sur_number_frame),
            Text(suraModel.suraNumber.toString(),style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: ColorsManager.onPrimaryColor,
            ),)
          ],
        ),
        SizedBox(width: 24,),
        Expanded(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(suraModel.suraNameEn, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: ColorsManager.onPrimaryColor
            ),),
            Text(" ${suraModel.versesNumber}Verses", style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: ColorsManager.onPrimaryColor
            ),)

          ],
        ),
        ),
        Spacer(),
        Text(suraModel.suraNameAr, style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: ColorsManager.onPrimaryColor
        ),)

      ],
    ) ) ;
  }

}