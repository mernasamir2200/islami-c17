import 'package:flutter/material.dart';
import 'package:islami_c17/core/resources/CacheHelper.dart';
import 'package:islami_c17/ui/hadeth_details/hadeth_details_screen.dart';
import 'package:islami_c17/ui/home/screen/home_screen.dart';
import 'package:islami_c17/ui/home/sura_details/screen/sura_details_screen.dart';
import 'package:islami_c17/ui/onboarding/widgets/onboarding.dart';
import 'core/remote/local/PrefsManager.dart';
import 'core/resources/AppContents.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await PrefsManager.init();

  final bool isOnboardingSeen =
  CacheHelper.getBool(key: Constants.onboardingSeen);

  runApp(MyApp(isOnboardingSeen: isOnboardingSeen));
}

class MyApp extends StatelessWidget {
  final bool isOnboardingSeen;

  const MyApp({super.key, required this.isOnboardingSeen});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islami',
      debugShowCheckedModeBanner: false,
      initialRoute:
      isOnboardingSeen ? HomeScreen.routeName : Onboarding.routeName,
      routes: {
        Onboarding.routeName: (_) => const Onboarding(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        SuraDetailsScreen.routeName: (_) => const SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (_) => const HadethDetailsScreen(),
      },
    );
  }
}