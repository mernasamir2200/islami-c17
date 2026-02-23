import 'package:flutter/material.dart';
import 'package:islami_c17/core/resources/ColorsManager.dart';
import 'package:islami_c17/model/SuraModel.dart';
import 'package:islami_c17/ui/home/tabs/quran_tab/widgets/MostRecentlyItem.dart';
class MostRecentlyList extends StatelessWidget{
  List<SuraModel> mostRecently;
  MostRecentlyList(this.mostRecently);

  @override
  Widget build(BuildContext context) {
    return mostRecently.isEmpty
        ?Center(
          child: Text("No history found",style: TextStyle(
                color: ColorsManager.primaryColor,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ) ,),
        )
        :ListView.separated(
      scrollDirection: Axis.horizontal ,
        itemBuilder: (context,index) => MostRecentlyItem(mostRecently[index]),
        separatorBuilder:(context,index) => SizedBox(width: 10,),
        itemCount: mostRecently.length);
  }
}