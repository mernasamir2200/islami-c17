import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c17/core/resources/AssetsManager.dart';
import 'package:islami_c17/core/resources/ColorsManager.dart';
import 'package:islami_c17/model/SuraModel.dart';

class SuraDetailsScreen  extends StatefulWidget {
  static const String routeName = 'sura_details';

  const SuraDetailsScreen({super.key});
  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}
  class _SuraDetailsScreenState extends State<SuraDetailsScreen>{
  @override
  Widget build(BuildContext context){
  SuraModel suraModel = ModalRoute.of(context)!.settings.arguments as SuraModel;
  if(suraText.isEmpty){
    readFile(suraModel.suraNumber);
  }
  return Scaffold(
    backgroundColor: ColorsManager.secondaryColor,
    appBar: AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: ColorsManager.onPrimaryColor,
      ),
      title: Text(suraModel.suraNameEn),
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: ColorsManager.primaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w700
      ),

    ),
    body: Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 18,
              right: 18,
              top: 18,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AssetsManager.quran_left_corner),
                    Text(suraModel.suraNameAr,style: TextStyle(
                      color: ColorsManager.onPrimaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),),
                    Image.asset(AssetsManager.quran_right_corner),
                  ],
                ),
                Expanded(
                  child: suraText.isEmpty
                      ? Center(
                        child: CircularProgressIndicator(
                                            color: ColorsManager.primaryColor,

                                          ),
                      ) : SingleChildScrollView(
                        child: Text(suraText,
                                            textDirection: TextDirection.rtl,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                        color: ColorsManager.primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        height: 2.5,),
                                          ),
                      ),
                ),
              ],
            ),
          ),
        ),
        Image.asset(AssetsManager.masgd_bottom_decoration),
      ],
    ),
  );
  }
  String suraText = "";
  int add (int n1 , int n2){
  return n1 + n2;
  }

  Future<void> readFile(int suraNumber) async{
    String sura = await rootBundle.loadString("assets/Suras/Suras/$suraNumber.txt");
    List<String> suraLines = sura.split("\n");
    for(int i=0;i<suraLines.length;i++){
      suraText += suraLines[i];
      suraText +="(${i+1})";
  }
  setState(() {});
  }
}
