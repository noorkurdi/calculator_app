import 'package:calculator1/bloc/cubit/appcubit.dart';
import 'package:calculator1/bloc/states/app_states.dart';
import 'package:calculator1/core/enums/theme_enum.dart';
import 'package:calculator1/core/utils/app_colors.dart';
import 'package:calculator1/widgets/circle_btn.dart';
import 'package:calculator1/widgets/txt_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit appCubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                appCubit.changeThemeEvent();
              },
              icon: Icon(
                appCubit.themeEnum == ThemeEnum.lightTheme
                    ? Icons.nights_stay_outlined
                    : Icons.sunny,
                color: appCubit.themeEnum == ThemeEnum.lightTheme
                    ? AppColors.equalColor
                    : AppColors.btnColor,
              ),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        appCubit.num.toString(),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35, right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      appCubit.theResult.toString(),
                      style: TextStyle(
                        color: AppColors.numColors,
                        fontSize: appCubit.theResultFontSize,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  color: appCubit.themeEnum == ThemeEnum.lightTheme
                      ? AppColors.backLightColor
                      : AppColors.darkColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 45,
                      vertical: 80,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TxtBtn(
                                onP: () {
                                  appCubit.expEvent();
                                },
                                txt: Text(
                                  'e',
                                  style: TextStyle(
                                    color: appCubit.themeEnum ==
                                            ThemeEnum.lightTheme
                                        ? appCubit.themeEnum ==
                                                ThemeEnum.lightTheme
                                            ? AppColors.darkColor
                                            : Colors.white
                                        : Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              TxtBtn(
                                onP: () {
                                  appCubit.piEvent();
                                },
                                txt: Text(
                                  '⫪',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: appCubit.themeEnum ==
                                            ThemeEnum.lightTheme
                                        ? appCubit.themeEnum ==
                                                ThemeEnum.lightTheme
                                            ? AppColors.darkColor
                                            : Colors.white
                                        : Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              TxtBtn(
                                onP: () {
                                  appCubit.sinEvent();
                                },
                                txt: Text(
                                  'sin',
                                  style: TextStyle(
                                    color: appCubit.themeEnum ==
                                            ThemeEnum.lightTheme
                                        ? appCubit.themeEnum ==
                                                ThemeEnum.lightTheme
                                            ? AppColors.darkColor
                                            : Colors.white
                                        : Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              TxtBtn(
                                onP: () {
                                  appCubit.degreeEvent();
                                },
                                txt: Text(
                                  '⁒',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: appCubit.themeEnum ==
                                            ThemeEnum.lightTheme
                                        ? appCubit.themeEnum ==
                                                ThemeEnum.lightTheme
                                            ? AppColors.darkColor
                                            : Colors.white
                                        : Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleBtn(
                                numBtn: const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    'c',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                onP: () {
                                  appCubit.clearEvent();
                                },
                                btnColor: AppColors.btnColor,
                                txtColor: AppColors.numColors,
                                borderRadius: BorderRadius.circular(50000000),
                              ),
                              CircleBtn(
                                numBtn: const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    '(',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                onP: () {
                                  appCubit.writeNumberEvent('(');
                                },
                                btnColor: AppColors.btnColor,
                                txtColor: AppColors.numColors,
                                borderRadius: BorderRadius.circular(50000000),
                              ),
                              CircleBtn(
                                numBtn: const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    ')',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                onP: () {
                                  appCubit.writeNumberEvent(')');
                                },
                                btnColor: AppColors.btnColor,
                                txtColor: AppColors.numColors,
                                borderRadius: BorderRadius.circular(50000000),
                              ),
                              CircleBtn(
                                numBtn: const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    '÷',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                onP: () {
                                  appCubit.theResult == '0' ||
                                          appCubit.theResult == '0.0'
                                      ? appCubit.writeNumberEvent("/")
                                      : appCubit.afterEqualEvent('/');
                                },
                                btnColor: AppColors.btnColor,
                                txtColor: AppColors.numColors,
                                borderRadius: BorderRadius.circular(50000000),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TxtBtn(
                                onP: () {
                                  appCubit.writeNumberEvent("7");
                                },
                                txt: Text(
                                  '7',
                                  style: TextStyle(
                                    color: appCubit.themeEnum ==
                                            ThemeEnum.lightTheme
                                        ? appCubit.themeEnum ==
                                                ThemeEnum.lightTheme
                                            ? AppColors.darkColor
                                            : Colors.white
                                        : Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              TxtBtn(
                                onP: () {
                                  appCubit.writeNumberEvent("8");
                                },
                                txt: Text(
                                  '8',
                                  style: TextStyle(
                                    color: appCubit.themeEnum ==
                                            ThemeEnum.lightTheme
                                        ? appCubit.themeEnum ==
                                                ThemeEnum.lightTheme
                                            ? AppColors.darkColor
                                            : Colors.white
                                        : Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              TxtBtn(
                                onP: () {
                                  appCubit.writeNumberEvent("9");
                                },
                                txt: Text(
                                  '9',
                                  style: TextStyle(
                                    color: appCubit.themeEnum ==
                                            ThemeEnum.lightTheme
                                        ? appCubit.themeEnum ==
                                                ThemeEnum.lightTheme
                                            ? AppColors.darkColor
                                            : Colors.white
                                        : Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              CircleBtn(
                                numBtn: const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    'x',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                onP: () {
                                  appCubit.theResult == '0' ||
                                          appCubit.theResult == '0.0'
                                      ? appCubit.writeNumberEvent("*")
                                      : appCubit.afterEqualEvent('*');
                                },
                                btnColor: AppColors.btnColor,
                                txtColor: AppColors.numColors,
                                borderRadius: BorderRadius.circular(50000000),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TxtBtn(
                                onP: () {
                                  appCubit.writeNumberEvent("4");
                                },
                                txt: Text(
                                  '4',
                                  style: TextStyle(
                                    color: appCubit.themeEnum ==
                                            ThemeEnum.lightTheme
                                        ? AppColors.darkColor
                                        : Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              TxtBtn(
                                onP: () {
                                  appCubit.writeNumberEvent("5");
                                },
                                txt: Text(
                                  '5',
                                  style: TextStyle(
                                    color: appCubit.themeEnum ==
                                            ThemeEnum.lightTheme
                                        ? AppColors.darkColor
                                        : Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              TxtBtn(
                                onP: () {
                                  appCubit.writeNumberEvent("6");
                                },
                                txt: Text(
                                  '6',
                                  style: TextStyle(
                                    color: appCubit.themeEnum ==
                                            ThemeEnum.lightTheme
                                        ? AppColors.darkColor
                                        : Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              CircleBtn(
                                numBtn: const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    '-',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                onP: () {
                                  appCubit.theResult == '0' ||
                                          appCubit.theResult == '0.0'
                                      ? appCubit.writeNumberEvent("-")
                                      : appCubit.afterEqualEvent('-');
                                },
                                btnColor: AppColors.btnColor,
                                txtColor: AppColors.numColors,
                                borderRadius: BorderRadius.circular(50000000),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TxtBtn(
                                onP: () {
                                  appCubit.writeNumberEvent("1");
                                },
                                txt: Text(
                                  '1',
                                  style: TextStyle(
                                    color: appCubit.themeEnum ==
                                            ThemeEnum.lightTheme
                                        ? AppColors.darkColor
                                        : Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              TxtBtn(
                                onP: () {
                                  appCubit.writeNumberEvent("2");
                                },
                                txt: Text(
                                  '2',
                                  style: TextStyle(
                                    color: appCubit.themeEnum ==
                                            ThemeEnum.lightTheme
                                        ? AppColors.darkColor
                                        : Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              TxtBtn(
                                onP: () {
                                  appCubit.writeNumberEvent("3");
                                },
                                txt: Text(
                                  '3',
                                  style: TextStyle(
                                    color: appCubit.themeEnum ==
                                            ThemeEnum.lightTheme
                                        ? AppColors.darkColor
                                        : Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              CircleBtn(
                                numBtn: const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    '+',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                onP: () {
                                  appCubit.theResult == '0' ||
                                          appCubit.theResult == '0.0'
                                      ? appCubit.writeNumberEvent("+")
                                      : appCubit.afterEqualEvent('+');
                                },
                                btnColor: AppColors.btnColor,
                                txtColor: AppColors.numColors,
                                borderRadius: BorderRadius.circular(50000000),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TxtBtn(
                                onP: () {
                                  appCubit.writeNumberEvent("0");
                                },
                                txt: Text(
                                  '0',
                                  style: TextStyle(
                                    color: appCubit.themeEnum ==
                                            ThemeEnum.lightTheme
                                        ? AppColors.darkColor
                                        : Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              TxtBtn(
                                onP: () {
                                  appCubit.writeNumberEvent(".");
                                },
                                txt: Text(
                                  '.',
                                  style: TextStyle(
                                    color: appCubit.themeEnum ==
                                            ThemeEnum.lightTheme
                                        ? AppColors.darkColor
                                        : Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  appCubit.equalEvent();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      appCubit.themeEnum == ThemeEnum.lightTheme
                                          ? AppColors.equalColor
                                          : AppColors.numColors,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(bottom: 4.0),
                                  child: Text(
                                    '=',
                                    style: TextStyle(
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Visibility(
                              visible: appCubit.num == "0" ? false : true,
                              child: TextButton(
                                onPressed: () {
                                  appCubit.backWordEvent();
                                },
                                child: Text(
                                  "⤾",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: appCubit.themeEnum ==
                                            ThemeEnum.darkTheme
                                        ? AppColors.btnColor
                                        : AppColors.equalColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
