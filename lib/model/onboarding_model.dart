import 'package:islami_c17/core/resources/AssetsManager.dart';

class OnboardingModel {
  String image;
  String title;
  String? description;

  OnboardingModel({
    required this.image,
    required this.title,
    this.description,
  });

  static List<OnboardingModel> dataList = [
    OnboardingModel(
      image: AssetsManager.onboarding1,
      title: 'Welcome To Islami App',
    ),
    OnboardingModel(
      image: AssetsManager.onboarding2,
      title: 'Welcome To Islami',
      description: 'We are very excited to have you in our community',
    ),
    OnboardingModel(
      image: AssetsManager.onboarding3,
      title: 'Reading the Quran',
      description: 'Read, and your Lord is the Most Generous',
    ),
    OnboardingModel(
      image: AssetsManager.onboarding4,
      title: 'Tasbeeh',
      description: 'Praise the name of your Lord, the Most High',
    ),
    OnboardingModel(
      image: AssetsManager.onboarding5,
      title: 'Read Hadeth',
      description:
      'You can listen to the Holy Quran Radio through the application easily',
    ),
  ];
}