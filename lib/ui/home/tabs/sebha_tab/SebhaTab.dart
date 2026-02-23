import 'dart:math';
import 'package:flutter/material.dart';
import 'package:islami_c17/core/resources/AssetsManager.dart';
import 'package:islami_c17/core/resources/AppStyles.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  final List<String> zekr = const [
    'سبحان اللله',
    'الحمد لله',
    'الله أكبر',
  ];

  int index = 0;
  int counter = 0;
  double angle = 0;

  void onSebhaTap() {
    setState(() {
      angle += pi / 30;

      if (counter < 33) {
        counter++;
      } else {
        counter = 1;
        index = (index + 1) % zekr.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.SbehaBack),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        // طبقة غامقة فوق الخلفية عشان الشكل يبقى قريب من التصميم
        color: Colors.black.withOpacity(0.15),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 8),

              // Header logo
              Center(
                child: Image.asset(
                  AssetsManager.islamiHeader,
                  height: 90,
                ),
              ),

              const SizedBox(height: 4),

              // Verse
              Text(
                'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
                style: TextStyles.whiteBold, // لو كبير جدًا صغره في AppStyles
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 8),

              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // رأس السبحة (ثابت فوق)
                    Positioned(
                      top: 30,
                      child: Image.asset(
                        AssetsManager.SebhaHeader,
                        height: 70,
                      ),
                    ),

                    // جسم السبحة (بيلف)
                    Positioned(
                      top: 90,
                      child: GestureDetector(
                        onTap: onSebhaTap,
                        child: Transform.rotate(
                          angle: angle,
                          child: Image.asset(
                            AssetsManager.SbehaBody,
                            height: size.height * 0.40,
                          ),
                        ),
                      ),
                    ),

                    Center(
                      child: GestureDetector(
                        onTap: onSebhaTap,
                        child: Container(
                          width: size.width * 0.62,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 20,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                zekr[index],
                                textAlign: TextAlign.center,
                                style: TextStyles.whiteBold,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '$counter',
                                style: TextStyles.whiteBold,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}