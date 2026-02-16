import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c17/core/resources/AssetsManager.dart';
import 'package:islami_c17/core/resources/ColorsManager.dart';
import 'package:islami_c17/model/HadethModel.dart';
import 'package:islami_c17/ui/hadeth_details/hadeth_details_screen.dart';

class HadethItem extends StatefulWidget {
  final int index;
  final int selectedIndex;

  const HadethItem({
    required this.index,
    required this.selectedIndex,
  });

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {

  HadethModel? hadethModel;

  @override
  void initState() {
    super.initState();
    loadFile();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, HadethDetailsScreen.routeName,arguments: hadethModel);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: widget.selectedIndex == widget.index ? 0 : 20,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              color: ColorsManager.primaryColor,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(AssetsManager.HadithCardBackGround),
                alignment: Alignment.center,
              ),
            ),
            child: Column(
              children: [
      
                const SizedBox(height: 10),
      
                /// Header (Fixed Section)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Image.asset(
                        AssetsManager.Haleft_corner,
                        width: 80,
                      ),
      
                      Expanded(
                        child: Center(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              hadethModel?.title ?? "",
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: "Janna LT",
                                fontWeight: FontWeight.w700,
                                color: ColorsManager.secondaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
      
                      Image.asset(
                        AssetsManager.Haright_corner,
                        width: 80,
                      ),
                    ],
                  ),
                ),
      
                Expanded(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Text(
                          hadethModel?.content ?? "",
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: "Janna LT",
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            height: 1.6,
                            color: ColorsManager.secondaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
      
                Image.asset(
                  AssetsManager.Hadith_Mosque,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  loadFile() async {
    String hadeth = await rootBundle.loadString(
        "assets/Hadeeth/h${widget.index + 1}.txt");

    List<String> hadethLines = hadeth.split("\n");
    String hadethTitle = hadethLines[0].trim();
    hadethLines.removeAt(0);
    String hadethContent = hadethLines.join(" ").trim();

    hadethModel = HadethModel(
      title: hadethTitle,
      content: hadethContent,
      number: widget.index + 1,
    );

    setState(() {});
  }
}
