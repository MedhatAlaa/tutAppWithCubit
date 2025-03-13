import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_tut_app/presentation/resources/color_manger.dart';
import 'package:new_tut_app/presentation/resources/font_manger.dart';
import 'package:new_tut_app/presentation/resources/styles_manger.dart';
import 'package:new_tut_app/presentation/resources/values_manger.dart';

ThemeData getAppTheme() {
  return ThemeData(
    /// main Colors
    primaryColor: ColorManger.primary,
    primaryColorLight: ColorManger.lightPrimary,
    primaryColorDark: ColorManger.darkPrimary,
    disabledColor: ColorManger.grey,
    scaffoldBackgroundColor: ColorManger.black,

    ///  CardView Theme
    cardTheme: CardTheme(
      color: ColorManger.white,
      shadowColor: ColorManger.grey,
      elevation: AppSizeManger.s4,
      // margin: const EdgeInsets.all(AppMarginManger.margin12),
    ),

    ///  AppBar Theme
    appBarTheme: AppBarTheme(
      color: ColorManger.primary,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: ColorManger.primary,
      ),
      titleTextStyle: getRegularStyle(
          color: ColorManger.white, fontSize: FontSizeManger.s16),
    ),

    /// Button Theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      buttonColor: ColorManger.primary,
      splashColor: ColorManger.lightPrimary,
      disabledColor: ColorManger.grey1,
    ),

    /// Elevated Button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: ColorManger.white,
        backgroundColor: ColorManger.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(AppSizeManger.s12),
        ),
        textStyle: getRegularStyle(
            color: ColorManger.white, fontSize: FontSizeManger.s16),
      ),
    ),

    /// Text Theme
    textTheme: TextTheme(
      headlineLarge: getSemiBoldStyle(
          color: ColorManger.darkGrey, fontSize: FontSizeManger.s16),
      headlineMedium: getRegularStyle(
        color: ColorManger.white,
        fontSize: FontSizeManger.s12,
      ),
      headlineSmall: getRegularStyle(
          color: ColorManger.grey, fontSize: FontSizeManger.s14),
      titleLarge: getSemiBoldStyle(
          color: ColorManger.primary, fontSize: FontSizeManger.s16),
      bodyLarge: getSemiBoldStyle(
        color: ColorManger.white, fontSize: FontSizeManger.s14),
      displayLarge: getMediumStyle(
          color: ColorManger.primary, fontSize: FontSizeManger.s16),
      titleMedium:
          getBoldStyle(color: ColorManger.primary, fontSize: AppSizeManger.s14),
      titleSmall: getMediumStyle(
          color: ColorManger.lightGrey, fontSize: FontSizeManger.s14),
      bodySmall: getRegularStyle(
          color: ColorManger.primary, fontSize: FontSizeManger.s12),
    ),

    /// Input Decoration Theme (Text Form Field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppSizeManger.s6),

      labelStyle: getRegularStyle(
          color: ColorManger.grey, fontSize: FontSizeManger.s14),
      errorStyle: getRegularStyle(color: ColorManger.error),
      hintStyle: getRegularStyle(
          color: ColorManger.grey, fontSize: FontSizeManger.s14),

      /// Enabled Border
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManger.lightGrey,
          width: AppSizeManger.s1_5,
        ),
        borderRadius: BorderRadius.circular(AppSizeManger.s8),
      ),

      /// Focused Border
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManger.primary,
          width: AppSizeManger.s1_5,
        ),
        borderRadius: BorderRadius.circular(AppSizeManger.s8),
      ),

      ///  Error Border
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManger.error,
          width: AppSizeManger.s1_5,
        ),
        borderRadius: BorderRadius.circular(AppSizeManger.s8),
      ),

      /// Focused Error Border
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManger.primary,
          width: AppSizeManger.s1_5,
        ),
        borderRadius: BorderRadius.circular(AppSizeManger.s8),
      ),
    ),
  );
}
