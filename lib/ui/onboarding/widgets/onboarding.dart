import 'package:flutter/material.dart';
import 'package:islami_c17/core/resources/AppStyles.dart';
import 'package:islami_c17/core/resources/AssetsManager.dart';
import 'package:islami_c17/core/resources/CacheHelper.dart';
import 'package:islami_c17/core/resources/ColorsManager.dart';
import 'package:islami_c17/model/onboarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/resources/AppContents.dart';
import '../../home/screen/home_screen.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});
  static const String routeName = 'onboarding';

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController pageController = PageController(initialPage: 0);
  final List<OnboardingModel> dataList = OnboardingModel.dataList;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(_listenOnPageChange);
  }

  @override
  void dispose() {
    pageController.removeListener(_listenOnPageChange);
    pageController.dispose();
    super.dispose();
  }

  void _listenOnPageChange() {
    if (!pageController.hasClients || pageController.page == null) return;

    final int newIndex = pageController.page!.round();
    if (newIndex != currentIndex && mounted) {
      setState(() {
        currentIndex = newIndex;
      });
    }
  }

  Future<void> _completeOnboarding() async {
    await CacheHelper.saveData(key: Constants.onboardingSeen, value: true);
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }

  void _goToNextPage() {
    if (currentIndex < dataList.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding();
    }
  }

  void _goToPreviousPage() {
    if (currentIndex > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _skipToHome() {
    _completeOnboarding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.secondaryColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),

            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Image.asset(
                  AssetsManager.islamiHeader,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Pages
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  final item = dataList[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        const SizedBox(height: 8),

                        Expanded(
                          child: Center(
                            child: Image.asset(
                              item.image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        Text(
                          item.title,
                          style: TextStyles.goldBold24,
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 12),

                        if (item.description != null &&
                            item.description!.trim().isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              item.description!,
                              style: TextStyles.goldBold16,
                              textAlign: TextAlign.center,
                            ),
                          )
                        else
                          const SizedBox(height: 22),

                        const SizedBox(height: 20),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Bottom controls
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  currentIndex == 0
                      ? const SizedBox(width: 56)
                      : TextButton(
                    onPressed: _goToPreviousPage,
                    child: Text(
                      'Back',
                      style: TextStyles.goldBold16,
                    ),
                  ),

                  SmoothPageIndicator(
                    controller: pageController,
                    count: dataList.length,
                    effect: WormEffect(
                      dotColor: ColorsManager.gray,
                      activeDotColor: ColorsManager.primaryColor,
                      dotHeight: 8,
                      dotWidth: 8,
                    ),
                    onDotClicked: (index) {
                      pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),

                  TextButton(
                    onPressed: _goToNextPage,
                    child: Text(
                      currentIndex == dataList.length - 1 ? 'Finish' : 'Next',
                      style: TextStyles.goldBold16,
                    ),
                  ),
                ],
              ),
            ),

            // Skip
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextButton(
                onPressed: _skipToHome,
                child: Text(
                  'Skip',
                  style: TextStyles.goldBold16.copyWith(
                    color: ColorsManager.gray,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}