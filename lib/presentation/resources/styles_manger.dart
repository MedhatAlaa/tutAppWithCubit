import 'package:flutter/material.dart';
import 'package:new_tut_app/presentation/resources/font_manger.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontFamily: FontConstants.fontFamily,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

/// Light Style
TextStyle getLightStyle(
    {double fontSize = FontSizeManger.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManger.light, color);
}

/// Regular Style
TextStyle getRegularStyle(
    {double fontSize = FontSizeManger.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManger.regular, color);
}

/// Medium Style
TextStyle getMediumStyle(
    {double fontSize = FontSizeManger.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManger.medium, color);
}

/// SemiBold Style
TextStyle getSemiBoldStyle(
    {double fontSize = FontSizeManger.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManger.semiBold, color);
}

/// Bold Style
TextStyle getBoldStyle(
    {double fontSize = FontSizeManger.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManger.bold, color);
}
