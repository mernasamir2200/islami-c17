import 'package:flutter/material.dart';
import 'ColorsManager.dart';

abstract final class TextStyles {
  static const TextStyle goldBold24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: ColorsManager.primaryColor,
  );

  static const TextStyle goldBold16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: ColorsManager.primaryColor,
  );
  static const TextStyle white36 = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: ColorsManager.primaryColor,
  );
  static const TextStyle white36Bold = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: ColorsManager.primaryColor,
  );
  static const TextStyle whiteBold = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: ColorsManager.onPrimaryColor,
  );

}