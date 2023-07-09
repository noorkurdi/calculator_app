import 'package:calculator1/bloc/states/app_states.dart';
import 'package:calculator1/core/enums/theme_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit(this.sharedPreferences) : super(InitialAppState());
  static AppCubit get(context) => BlocProvider.of(context);
  SharedPreferences sharedPreferences;
  ThemeEnum? themeEnum;
  ////Numbers////
  String num = "0";
  String theResult = "0";
  String expression = "";
  double pi = 3.14159265359;
  double e = 2.718281828;
  double theResultFontSize = 40;
  ////events////

  void initialStateEvent() async {
    sharedPreferences = await SharedPreferences.getInstance();
    bool theme = sharedPreferences.getBool('th') ?? false;
    if (theme == true) {
      themeEnum = ThemeEnum.darkTheme;
    } else if (theme == false) {
      themeEnum = ThemeEnum.lightTheme;
    }

    emit(RefreshUIAppState());
  }

  void changeThemeEvent() async {
    bool th = false;
    if (themeEnum == ThemeEnum.lightTheme) {
      themeEnum = ThemeEnum.darkTheme;
      th = true;
      sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setBool("th", th);
    } else if (themeEnum == ThemeEnum.darkTheme) {
      themeEnum = ThemeEnum.lightTheme;
      th = false;
      sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setBool("th", th);
    }

    emit(RefreshUIAppState());
  }

  void writeNumberEvent(String number) {
    if (num == '0' || num == '0.0') {
      if (number == '.' ||
          number == '+' ||
          number == '-' ||
          number == '*' ||
          number == '/') {
        num = num + number;
      } else {
        num = number;
      }
    } else {
      num = num + number;
    }
    emit(RefreshUIAppState());
  }

  void clearEvent() {
    num = "0";
    theResult = "0";
    emit(RefreshUIAppState());
  }

  void backWordEvent() {
    num = num.substring(0, num.length - 1);
    if (num == "") {
      num = "0";
    }
    emit(RefreshUIAppState());
  }

  void degreeEvent() {
    Parser p = Parser();
    Expression exp = p.parse("$num/100");
    ContextModel cm = ContextModel();
    double deg = exp.evaluate(EvaluationType.REAL, cm);
    theResult = deg.toString().trim();
    emit(RefreshUIAppState());
  }

  void equalEvent() {
    Parser p = Parser();
    Expression exp = p.parse(num);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    String test = eval.toString();
    List<String> tt = test.split('');
    if (tt.reversed.toList()[0] == '0') {
      theResult = eval.ceil().toString();
    } else {
      theResult = eval.toString();
    }

    num = '0';
    if (theResult.length > 7) {
      theResultFontSize = 30;
    } else {
      theResultFontSize = 40;
    }

    emit(RefreshUIAppState());
  }

  void expEvent() {
    Parser p = Parser();
    Expression exp = p.parse(num);
    ContextModel cm = ContextModel();
    double ee = exp.evaluate(EvaluationType.REAL, cm) * e;
    if (num == '0' || num == '0.0') {
      theResult = e.toString();
    } else {
      theResult = ee.toString().trim();
    }

    if (theResult.length > 7) {
      theResultFontSize = 30;
    } else {
      theResultFontSize = 40;
    }
    emit(RefreshUIAppState());
  }

  void sinEvent() {
    Parser p = Parser();
    Expression exp = p.parse('sin($num)');
    ContextModel cm = ContextModel();
    double sin = exp.evaluate(EvaluationType.REAL, cm);
    theResult = sin.toString().trim();
    if (theResult.length > 7) {
      theResultFontSize = 30;
    } else {
      theResultFontSize = 40;
    }
    emit(RefreshUIAppState());
  }

  void afterEqualEvent(String sign) {
    num = theResult + sign;
    theResult = '0';
    emit(RefreshUIAppState());
  }

  void piEvent() {
    Parser p = Parser();
    Expression exp = p.parse(num);
    ContextModel cm = ContextModel();
    double pii = exp.evaluate(EvaluationType.REAL, cm) * pi;
    if (num == '0' || num == '0.0') {
      theResult = pi.toString();
    } else {
      theResult = pii.toString().trim();
    }
    if (theResult.length > 7) {
      theResultFontSize = 30;
    } else {
      theResultFontSize = 40;
    }
    emit(RefreshUIAppState());
  }
}
