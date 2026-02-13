import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_c17/core/resources/AssetsManager.dart';
import 'package:islami_c17/core/resources/ColorsManager.dart';
import 'package:islami_c17/core/resources/StringsManager.dart';
import 'package:islami_c17/ui/home/tabs/hadeth_tab/HadethTab.dart';
import 'package:islami_c17/ui/home/tabs/quran_tab/QuranTab.dart';
import 'package:islami_c17/ui/home/tabs/radio_tab/RadioTab.dart';
import 'package:islami_c17/ui/home/tabs/sebha_tab/SebhaTab.dart';
import 'package:islami_c17/ui/home/tabs/time_tab/TimeTab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
          selectedIndex:selectedIndex ,
          backgroundColor: ColorsManager.primaryColor,
          indicatorColor: ColorsManager.secondaryColor.withValues(
            alpha: 0.6
          ),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          labelTextStyle: WidgetStateTextStyle.resolveWith((state) {
            return TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: ColorsManager.onPrimaryColor
            );
          },),
          destinations: [
            NavigationDestination(
                icon: SvgPicture.asset(AssetsManager.quranTab),
                label: StringsManager.quranTab,
                selectedIcon:SvgPicture.asset(AssetsManager.quranSelectedTab),
            ),
            NavigationDestination(
              icon: SvgPicture.asset(AssetsManager.hadethTab),
              label: StringsManager.hadethTab,
              selectedIcon:SvgPicture.asset(AssetsManager.hadethSelectedTab),
            ),
            NavigationDestination(
              icon: SvgPicture.asset(AssetsManager.sebhaTab),
              label: StringsManager.sebhaTab,
              selectedIcon:SvgPicture.asset(AssetsManager.sebhaSelectedTab),
            ),
            NavigationDestination(
              icon: SvgPicture.asset(AssetsManager.radioTab),
              label: StringsManager.radioTab,
              selectedIcon:SvgPicture.asset(AssetsManager.radioSelectedTab),
            ),
            NavigationDestination(
              icon: SvgPicture.asset(AssetsManager.timeTab),
              label: StringsManager.timeTab,
              selectedIcon:SvgPicture.asset(AssetsManager.timeSelectedTab),
            ),
          ]
      ),
      body: tabs[selectedIndex],
    );

  }
}
