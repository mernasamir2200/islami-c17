import 'package:flutter/material.dart';
import 'package:islami_c17/core/resources/AssetsManager.dart';
import 'package:islami_c17/core/resources/ColorsManager.dart';
import 'package:islami_c17/ui/home/tabs/hadeth_tab/widgets/HadethItem.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}
class _HadethTabState extends State<HadethTab>{
  PageController controller = PageController(
      viewportFraction: 0.8
  );
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: ColorsManager.secondaryColor,
        image: DecorationImage(
          fit:BoxFit.fitWidth ,
            image: AssetImage(AssetsManager.hadeth_back),
            alignment: Alignment.topCenter
        )
      ),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(AssetsManager.islamiHeader,
            width: screenWidth * 0.8,
            fit: BoxFit.fitWidth,),
            ElevatedButton(onPressed: () {
              controller.nextPage(
                  duration: Duration(seconds: 1),
                  curve: Curves.bounceIn);
            }, child: Text("Next")),
            Expanded(
              child: PageView.builder(
                onPageChanged: (index){
                  setState(() {
                    selectedIndex = index;
                    });
                },
                controller: controller,
                itemBuilder: (context,index)=> HadethItem(
                  index: index ,
                  selectedIndex: selectedIndex,
                ),
                itemCount:50 ,

              ),
            )
        
        
          ],
        ),
      ),
    );
  }
}
