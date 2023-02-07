/*
 * File: one_theme_data.dart
 * File Created: Friday, 8th January 2021 12:44:22 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Friday, 8th January 2021 12:50:23 pm
 * Modified By: Hieu Tran
 */

import 'package:animal_ar/const/ar_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OneThemeData with Diagnosticable {
  OneThemeData();

  late TextStyle header;
  late TextStyle title1;
  late TextStyle title2;
  late TextStyle body1;
  late TextStyle body2;
  late TextStyle caption1;
  late TextStyle caption2;

  late TextStyle textLink;
  late TextStyle textFieldLabelHoriz;
  late TextStyle textFieldLabelHorizDisabled;
  late TextStyle textFieldLabelHorizFocused;
  late TextStyle textFieldLabel;
  late TextStyle textFieldLabelDisabled;
  late TextStyle textFieldLabelFocused;
  late TextStyle textFieldText;
  late TextStyle textFieldTextDisabled;
  late TextStyle textFieldHint;
  late TextStyle textFieldHintDisabled;
  late TextStyle textFieldError;
  late TextStyle textFieldErrorDisabled;

  // Builds the Custom Themes, based on the currently defined based Themes
  // ignore: avoid_unused_constructor_parameters
  factory OneThemeData.fromContext(BuildContext context) {
    // final ThemeData themeData = Theme.of(context);
    final OneThemeData theme = OneThemeData();

    theme.header = const TextStyle(
      fontFamily: 'NunitoSans',
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 20.0,
      color: OneColors.textGreyDark,
    );

    theme.title1 = theme.header.copyWith(fontSize: 16.0);
    theme.title2 = theme.title1.copyWith(fontWeight: FontWeight.w400);
    theme.body1 = theme.header.copyWith(fontSize: 14.0);
    theme.body2 = theme.body1.copyWith(fontWeight: FontWeight.w400);
    theme.caption1 = theme.header.copyWith(fontSize: 12.0);
    theme.caption2 = theme.caption1.copyWith(fontWeight: FontWeight.w400);

    theme.textLink = theme.header.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 14.0,
      color: OneColors.brandVNPT,
      decoration: TextDecoration.underline,
    );
    theme.textFieldLabelHoriz = theme.title2.copyWith(color: OneColors.textGrey3);
    theme.textFieldLabelHorizDisabled = theme.textFieldLabelHoriz.copyWith(color: OneColors.textGrey1);
    theme.textFieldLabelHorizFocused = theme.textFieldLabelHoriz.copyWith(color: OneColors.brandVNPT);
    theme.textFieldLabel = theme.header.copyWith(fontWeight: FontWeight.w600, fontSize: 12.0, color: OneColors.textGrey3);
    theme.textFieldLabelDisabled = theme.textFieldLabel.copyWith(color: OneColors.textGrey1);
    theme.textFieldLabelFocused = theme.textFieldLabel.copyWith(color: OneColors.brandVNPT);
    theme.textFieldText = theme.textFieldLabel.copyWith(fontSize: 16.0, color: OneColors.textGreyDark);
    theme.textFieldTextDisabled = theme.textFieldText.copyWith(color: OneColors.textGrey1);
    theme.textFieldHint = theme.textFieldText.copyWith(fontWeight: FontWeight.w400, color: OneColors.textGrey2);
    theme.textFieldHintDisabled = theme.textFieldHint.copyWith(color: OneColors.textGrey1);
    theme.textFieldError = theme.textFieldLabel.copyWith(fontWeight: FontWeight.w400, color: OneColors.error);

    return theme;
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }

    return other is OneThemeData &&
        other.header == header &&
        other.title1 == title1 &&
        other.title2 == title2 &&
        other.body1 == body1 &&
        other.body2 == body2 &&
        other.caption1 == caption1 &&
        other.caption2 == caption2 &&
        other.textLink == textLink &&
        other.textFieldLabelHoriz == textFieldLabelHoriz &&
        other.textFieldLabelHorizDisabled == textFieldLabelHorizDisabled &&
        other.textFieldLabelHorizFocused == textFieldLabelHorizFocused &&
        other.textFieldLabel == textFieldLabel &&
        other.textFieldLabelDisabled == textFieldLabelDisabled &&
        other.textFieldLabelFocused == textFieldLabelFocused &&
        other.textFieldText == textFieldText &&
        other.textFieldTextDisabled == textFieldTextDisabled &&
        other.textFieldHint == textFieldHint &&
        other.textFieldHintDisabled == textFieldHintDisabled &&
        other.textFieldError == textFieldError &&
        other.textFieldErrorDisabled == textFieldErrorDisabled;
  }

  @override
  int get hashCode => Object.hashAll([
        header,
        title1,
        title2,
        body1,
        body2,
        caption1,
        caption2,
        textLink,
        textFieldLabelHoriz,
        textFieldLabelHorizDisabled,
        textFieldLabelHorizFocused,
        textFieldLabel,
        textFieldLabelDisabled,
        textFieldLabelFocused,
        textFieldText,
        textFieldTextDisabled,
        textFieldHint,
        textFieldHintDisabled,
        textFieldError,
        textFieldErrorDisabled,
      ]);
}
