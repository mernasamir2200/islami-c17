import 'package:flutter/material.dart';
import 'package:islami_c17/core/resources/AppContents.dart';
import 'package:islami_c17/core/resources/ColorsManager.dart';
import 'package:islami_c17/ui/home/tabs/quran_tab/widgets/SuraItem.dart';

class SurasList extends StatelessWidget {
  const SurasList({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return  ListView.separated(
        itemBuilder: (context,index)=> SuraItem(AppContents.SurasList[index]),
        separatorBuilder: (context,index)=> Divider(
          color: ColorsManager.onPrimaryColor ,
          indent: width*0.1 ,
          endIndent: width*0.1,
        ),
        itemCount: AppContents.SurasList.length,);
  }
}