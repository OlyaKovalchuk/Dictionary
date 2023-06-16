import 'package:dictionary/res/dct_colors.dart';
import 'package:dictionary/res/dct_styles.dart';
import 'package:flutter/cupertino.dart' as theme;
import 'package:flutter/material.dart';

ThemeData get dctTheme => ThemeData(
      cupertinoOverrideTheme: const theme.CupertinoThemeData(
        brightness: theme.Brightness.light,
        primaryColor: DctColors.wRed,
        textTheme:
            // For CupertinoButton.
            theme.CupertinoTextThemeData(
          textStyle: DctStyles.b2BlackSemiBold14Futura,
        ),
      ),
      colorScheme: const ColorScheme.light(
        primary: DctColors.primaryColor,
        secondary: DctColors.wRedLight,
      ),
      dialogBackgroundColor: DctColors.dialogBackgroundColor,
      hintColor: DctColors.hintColor,
      primaryColor: DctColors.primaryColor,
      scaffoldBackgroundColor: DctColors.backgroundColor,
      textTheme: const TextTheme(
        displayMedium: DctStyles.h3WhiteSemiBold20,
        displaySmall: DctStyles.h4BlackBold18,
        headlineMedium: DctStyles.h4BlackBold18,
        titleMedium: DctStyles.h4BlackBold18,
        bodyLarge: DctStyles.b1BlackRegular16Roboto,
        bodyMedium: DctStyles.b2BlackRegular14Roboto,
        bodySmall: DctStyles.b3BlackRegular12,
        labelLarge: DctStyles.h3BlackSemiBold20,
      ),
      // ignore: avoid-missing-enum-constant-in-map
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      }),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(DctColors.primaryColor),
        checkColor: MaterialStateProperty.all(DctColors.wWhite),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(3)),
        ),
      ),
      dialogTheme: const DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        backgroundColor: DctColors.dialogBackgroundColor,
        titleTextStyle: DctStyles.h3BlackSemiBold20,
        contentTextStyle: DctStyles.b1BlackRegular16Roboto,
      ),
      dividerTheme: const DividerThemeData(
        color: DctColors.wGrey,
        space: 1,
        thickness: 1,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: DctStyles.b1WhiteSemiBold16,
          minimumSize: _minButtonSize,
          disabledBackgroundColor: DctColors.wTransparent,
          shadowColor: DctColors.wTransparent,
          surfaceTintColor: DctColors.wTransparent,
          backgroundColor: DctColors.wTransparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: DctColors.tBlackLight,
          textStyle: DctStyles.b2BlackSemiBold14Futura,
          side: const BorderSide(color: DctColors.wGrey),
          minimumSize: _minButtonSize,
          // Shape of splash when pressed.
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: _minButtonSize,
          textStyle: DctStyles.b1GradientSemiBold16,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: DctColors.cursorColor),
    );

const _minButtonSize = Size(64, 44);

ThemeData get darkTheme => ThemeData.dark();

const textFieldBorder = OutlineInputBorder(
  borderSide: BorderSide(color: DctColors.wGrey),
  borderRadius: BorderRadius.all(Radius.circular(30)),
);

const selectedTextFieldBorder = OutlineInputBorder(
  borderSide: BorderSide(color: DctColors.wRedLight),
  borderRadius: BorderRadius.all(Radius.circular(30)),
);

const errorTextFieldBorder = OutlineInputBorder(
  borderSide: BorderSide(color: DctColors.wRed),
  borderRadius: BorderRadius.all(Radius.circular(30)),
);
