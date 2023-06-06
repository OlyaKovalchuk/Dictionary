import 'package:dictionary/res/dct_colors.dart';
import 'package:flutter/cupertino.dart';

class DctStyles {
  DctStyles._();

  static const h1WhiteBold44 = TextStyle(
    color: DctColors.tWhite,
    fontSize: 44,
    fontWeight: FontWeight.w700,
    fontFamily: _DctFontFamilies.futura,
  );

  static const h3WhiteSemiBold20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: DctColors.tWhite,
    fontFamily: _DctFontFamilies.futura,
  );
  static const h3BlackSemiBold20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: DctColors.tBlackLight,
    fontFamily: _DctFontFamilies.futura,
  );

  static const h4BlackBold18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: DctColors.tBlackLight,
    fontFamily: _DctFontFamilies.futura,
  );

  static const b1WhiteBold16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: _DctFontFamilies.futura,
    color: DctColors.wWhite,
  );
  static const b1WhiteSemiBold16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: _DctFontFamilies.futura,
    color: DctColors.wWhite,
  );
  static const b1BlackRegular16Roboto = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: _DctFontFamilies.roboto,
    color: DctColors.tBlackLight,
  );

  static const b2BlackRegular14Roboto = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: _DctFontFamilies.roboto,
    color: DctColors.tBlackLight,
    height: 1.4,
  );

  static const b2BlackSemiBold14Futura = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: _DctFontFamilies.futura,
    color: DctColors.tBlackLight,
  );
  static const b2WhiteSemiBold16Futura = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: _DctFontFamilies.futura,
    color: DctColors.tWhite,
  );
  static const b2GreyRegular14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: _DctFontFamilies.roboto,
    color: DctColors.tGrey,
  );

  static const b3BlackRegular12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: _DctFontFamilies.roboto,
    color: DctColors.tBlackLight,
  );
  static const b3GreySemiBold12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: _DctFontFamilies.futura,
    color: DctColors.tBaseGrey,
  );
  static const b3LightGreyRegular12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: _DctFontFamilies.roboto,
    color: DctColors.tGreyLight,
  );
  static const b1RedRegular12Roboto = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: _DctFontFamilies.roboto,
    color: DctColors.tRed,
  );
  static final b2GradientRegular14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: _DctFontFamilies.roboto,
    foreground: Paint()..shader = DctColors.tRedGradient,
  );

  static final b3GradientBold12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    fontFamily: _DctFontFamilies.futura,
    foreground: Paint()..shader = DctColors.tRedGradient,
  );

  static final b1GradientSemiBold16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: _DctFontFamilies.futura,
    foreground: Paint()..shader = DctColors.tRedGradient,
  );

  static final h2GradientBold36 = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    foreground: Paint()..shader = DctColors.tRedGradient,
    fontFamily: _DctFontFamilies.roboto,
  );
  static final h3GradiantSemiBold21 = TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.w500,
    foreground: Paint()..shader = DctColors.tRedGradient,
    fontFamily: _DctFontFamilies.futura,
  );
}

class _DctFontFamilies {
  _DctFontFamilies._();

  static const futura = 'Futura';
  static const roboto = 'roboto';
}
