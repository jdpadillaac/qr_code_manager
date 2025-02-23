import 'package:flutter/widgets.dart';

final class QcmSpacing {
  const QcmSpacing._();

  static const double small = 8;
  static const double sl = 12;
  static const double medium = 16;
  static const double large = 24;
  static const double xLarge = 32;
  static const double xxLarge = 48;
  static const double xxxLarge = 64;
  static const double xxxxLarge = 96;
}

final class QcmVerticalSpacing {
  const QcmVerticalSpacing._();

  static const sl = SizedBox(height: QcmSpacing.sl);
  static const xlarge = SizedBox(height: QcmSpacing.xLarge);
  static const large = SizedBox(height: QcmSpacing.large);
  static const medium = SizedBox(height: QcmSpacing.medium);
  static const small = SizedBox(height: QcmSpacing.small);
  static const xxlarge = SizedBox(height: QcmSpacing.xxLarge);
  static const xxxlarge = SizedBox(height: QcmSpacing.xxxLarge);
  static const xxxxlarge = SizedBox(height: QcmSpacing.xxxxLarge);
}

final class QcmHorizontalSpacing {
  const QcmHorizontalSpacing._();

  static const sl = SizedBox(width: QcmSpacing.sl);
  static const xlarge = SizedBox(width: QcmSpacing.xLarge);
  static const large = SizedBox(width: QcmSpacing.large);
  static const medium = SizedBox(width: QcmSpacing.medium);
  static const small = SizedBox(width: QcmSpacing.small);
  static const xxlarge = SizedBox(width: QcmSpacing.xxLarge);
  static const xxxlarge = SizedBox(width: QcmSpacing.xxxLarge);
  static const xxxxlarge = SizedBox(width: QcmSpacing.xxxxLarge);
}
