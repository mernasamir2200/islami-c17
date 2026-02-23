import 'package:flutter/material.dart';
import 'package:islami_c17/core/resources/ColorsManager.dart';
import 'package:islami_c17/model/SuraModel.dart';
import 'package:islami_c17/ui/home/tabs/quran_tab/widgets/SuraItem.dart';

class SurasList extends StatelessWidget {
  final List<SuraModel> filteredList;
  final void Function(SuraModel) onSuraClick;

  const SurasList({super.key, required this.filteredList, required this.onSuraClick});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ListView.separated(
      itemBuilder: (context, index) => SuraItem(
        suraModel: filteredList[index],
        onSuraClick: onSuraClick,
      ),
      separatorBuilder: (context, index) => Divider(
        color: ColorsManager.onPrimaryColor,
        indent: width * 0.1,
        endIndent: width * 0.1,
      ),
      itemCount: filteredList.length,
    );
  }
}
