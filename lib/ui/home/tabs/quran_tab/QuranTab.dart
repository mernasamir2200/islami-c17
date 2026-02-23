import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_c17/core/remote/local/PrefsManager.dart';
import 'package:islami_c17/core/resources/AppContents.dart';
import 'package:islami_c17/core/resources/AssetsManager.dart';
import 'package:islami_c17/core/resources/ColorsManager.dart';
import 'package:islami_c17/core/resources/StringsManager.dart';
import 'package:islami_c17/model/SuraModel.dart';
import 'package:islami_c17/ui/home/tabs/quran_tab/widgets/MostRecentlyList.dart';
import 'package:islami_c17/ui/home/tabs/quran_tab/widgets/SurasList.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  String searchText = "";
  List<SuraModel> mostRecently = [];
  List<SuraModel> filteredSuras = [];

  @override
  void initState() {
    super.initState();
    filteredSuras = AppContents.SurasList;
    mostRecently = PrefsManager.getMostRecently();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetsManager.QuranBackground),
                fit: BoxFit.fill)),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AssetsManager.islamiHeader,
                  height: 0.16 * height,
                  fit: BoxFit.fitHeight,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                    suraNameSearch();
                  });
                },
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: ColorsManager.onPrimaryColor),
                decoration: InputDecoration(
                    hintText: StringsManager.suraName,
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: ColorsManager.onPrimaryColor),
                    prefixIconConstraints: const BoxConstraints(
                      maxHeight: 55,
                      maxWidth: 55,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(13),
                      child: SvgPicture.asset(
                        AssetsManager.quranTab,
                        width: 28,
                        height: 28,
                        colorFilter: const ColorFilter.mode(
                            ColorsManager.primaryColor, BlendMode.srcIn),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: ColorsManager.onPrimaryColor,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: ColorsManager.primaryColor,
                        ))),
              ),
              const SizedBox(
                height: 20,
              ),
              if (searchText.isEmpty) ...[
                const Text(
                  StringsManager.mostRecently,
                  style: TextStyle(
                    color: ColorsManager.onPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: height * 0.16,
                  child: MostRecentlyList(mostRecently),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  StringsManager.surasList,
                  style: TextStyle(
                    color: ColorsManager.onPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
              Expanded(
                  child: SurasList(
                      filteredList: filteredSuras,
                      onSuraClick: (SuraModel sura) {
                        setState(() {
                          if (mostRecently.contains(sura)) {
                            mostRecently.remove(sura);
                            mostRecently.insert(0, sura);
                          } else {
                            mostRecently.insert(0, sura);
                          }
                          PrefsManager.saveMostRecently(mostRecently);
                        });
                      })),
            ],
          ),
        ));
  }

  suraNameSearch() {
    if (searchText.isEmpty) {
      filteredSuras = AppContents.SurasList;
    } else {
      filteredSuras = [];
      for (int i = 0; i < AppContents.SurasList.length; i++) {
        if (AppContents.SurasList[i]
                .suraNameEn
                .toLowerCase()
                .contains(searchText.toLowerCase()) ||
            AppContents.SurasList[i].suraNameAr.contains(searchText)) {
          filteredSuras.add(AppContents.SurasList[i]);
        }
      }
    }
  }
}
