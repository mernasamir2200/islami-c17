import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_c17/core/resources/AssetsManager.dart';
import 'package:islami_c17/core/resources/ColorsManager.dart';
import 'package:islami_c17/core/resources/StringsManager.dart';
import 'package:islami_c17/ui/home/tabs/quran_tab/widgets/MostRecentlyList.dart';
import 'package:islami_c17/ui/home/tabs/quran_tab/widgets/SurasList.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image:AssetImage(AssetsManager.QuranBackground),
            fit: BoxFit.fill

        )
      ),
      child: SafeArea(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
            Align(
              alignment: Alignment.center,
          child: Image.asset(
            AssetsManager.islamiHeader,
            height: 0.16*height,
            fit:BoxFit.fitHeight
            ,),
        ),
          SizedBox(height: 20,),
          TextField(
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: ColorsManager.onPrimaryColor
            ),
            decoration: InputDecoration(
              hintText: StringsManager.suraName,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: ColorsManager.onPrimaryColor
              ),
              prefixIconConstraints: BoxConstraints(
                maxHeight: 55,
                maxWidth: 55,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsetsGeometry.all(13),
                child:SvgPicture.asset(AssetsManager.quranTab,
                  width: 28,
                  height: 28,
                  colorFilter: ColorFilter.mode(
                  ColorsManager.primaryColor,BlendMode.srcIn
                ),),
              ),
                focusedBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorsManager.onPrimaryColor,
                  )
              ) ,
              enabledBorder  : OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorsManager.primaryColor,
                )
              )
            ),
          ),
          SizedBox(height: 20,),
          Text(StringsManager.mostRecently,style: TextStyle(
            color: ColorsManager.onPrimaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,

          ),),
          SizedBox(height: 10,),
          SizedBox(
            height:height*0.16,
            child:MostRecentlyList(),),
          SizedBox(height: 10,),
          Text(StringsManager.surasList,style: TextStyle(
              color: ColorsManager.onPrimaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,),),
          SizedBox(height: 10,),
          Expanded(child: SurasList())

        ],),
      )
    );
  }
}
