import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_c17/core/resources/ColorsManager.dart';
import 'package:islami_c17/model/SuraModel.dart';
import 'package:islami_c17/ui/home/sura_details/screen/sura_details_screen.dart';
import '../../../../../core/resources/AssetsManager.dart';

class SuraItem extends StatelessWidget {
  final SuraModel suraModel;
  final void Function(SuraModel) onSuraClick;

  const SuraItem({super.key, required this.suraModel, required this.onSuraClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSuraClick(suraModel);
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,
            arguments: suraModel);
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(AssetsManager.img_sur_number_frame),
              Text(
                suraModel.suraNumber.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: ColorsManager.onPrimaryColor,
                ),
              )
            ],
          ),
          const SizedBox(
            width: 24,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  suraModel.suraNameEn,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: ColorsManager.onPrimaryColor),
                ),
                Text(
                  " ${suraModel.versesNumber} Verses",
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: ColorsManager.onPrimaryColor),
                )
              ],
            ),
          ),
          const Spacer(),
          Text(
            suraModel.suraNameAr,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: ColorsManager.onPrimaryColor),
          )
        ],
      ),
    );
  }
}
