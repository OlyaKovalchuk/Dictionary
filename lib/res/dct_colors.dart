import 'package:flutter/material.dart';

class DctColors {
  DctColors._();

  /// Text colors
  static const tBlackLight = _DctColors.blackLight;
  static const tBaseGrey = _DctColors.baseGrey;
  static const tGrey = _DctColors.grey;
  static const tRed = _DctColors.red;
  static const tGrey2 = _DctColors.grey2;
  static const tGreyLight = _DctColors.greyLight;
  static const tWhite = _DctColors.white;

  /// Widget colors
  static const wTransparent = _DctColors.transparent;
  static const wWhite = _DctColors.white;
  static const wRed = _DctColors.red;
  static const wRedLight = _DctColors.redLight;
  static const wGreyLight2 = _DctColors.greyLight2;
  static const wGrey = _DctColors.grey;
  static const wGreyLight = _DctColors.greyLight;
  static const wBaseGrey = _DctColors.baseGrey;

  static const wRedGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [wRed, wRedLight],
  );

  /// Theme colors
  //#region
  static const primaryColor = _DctColors.red;
  static const backgroundColor = _DctColors.white;
  static const dialogBackgroundColor = _DctColors.white;

  /// Hint text or placeholder text,.
  static const hintColor = _DctColors.greyLight;

  /// Scroll color(android), FAB, ProgressBar.
  static const accentColor = _DctColors.red;
  static const cursorColor = _DctColors.red;

  static const btnEnabled = wRedGradient;
  static const btnDisabled = _DctColors.greyLight;

  static final tRedGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [wRed, wRedLight],
  ).createShader(
    const Rect.fromLTWH(
      0,
      200,
      0,
      70,
    ),
  );
}

class _DctColors {
  _DctColors._();

  static const transparent = Colors.transparent;
  static const blackLight = Color(0xFF5B5B5B);
  static const baseGrey = Color(0xFF979797);
  static const grey = Color(0xFFCDCCCC);
  static const grey2 = Color(0xFFCBC8C8);
  static const greyLight = Color(0xFFDFDFDF);
  static const greyLight2 = Color(0xF7F7F7F7);
  static const white = Color(0xFFFFFFFF);
  static const red = Color(0xFFDE4D4F);
  static const redLight = Color(0xFFEA765C);
}

/**
    <!--100% — FF
    99% — FC
    98% — FA
    97% — F7
    96% — F5
    95% — F2
    94% — F0
    93% — ED
    92% — EB
    91% — E8
    90% — E6
    89% — E3
    88% — E0
    87% — DE
    86% — DB
    85% — D9
    84% — D6
    83% — D4
    82% — D1
    81% — CF
    80% — CC
    79% — C9
    78% — C7
    77% — C4
    76% — C2
    75% — BF
    74% — BD
    73% — BA
    72% — B8
    71% — B5
    70% — B3
    69% — B0
    68% — AD
    67% — AB
    66% — A8
    65% — A6
    64% — A3
    63% — A1
    62% — 9E
    61% — 9C
    60% — 99
    59% — 96
    58% — 94
    57% — 91
    56% — 8F
    55% — 8C
    54% — 8A
    53% — 87
    52% — 85
    51% — 82
    50% — 80
    49% — 7D
    48% — 7A
    47% — 78
    46% — 75
    45% — 73
    44% — 70
    43% — 6E
    42% — 6B
    41% — 69
    40% — 66
    39% — 63
    38% — 61
    37% — 5E
    36% — 5C
    35% — 59
    34% — 57
    33% — 54
    32% — 52
    31% — 4F
    30% — 4D
    29% — 4A
    28% — 47
    27% — 45
    26% — 42
    25% — 40
    24% — 3D
    23% — 3B
    22% — 38
    21% — 36
    20% — 33
    19% — 30
    18% — 2E
    17% — 2B
    16% — 29
    15% — 26
    14% — 24
    13% — 21
    12% — 1F
    11% — 1C
    10% — 1A
    9% — 17
    8% — 14
    7% — 12
    6% — 0F
    5% — 0D
    4% — 0A
    3% — 08
    2% — 05
    1% — 03
    0% — 00-->
 */
