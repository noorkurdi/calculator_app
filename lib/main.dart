import 'package:calculator1/bloc/cubit/appcubit.dart';
import 'package:calculator1/bloc/states/app_states.dart';
import 'package:calculator1/core/enums/theme_enum.dart';
import 'package:calculator1/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sp = await SharedPreferences.getInstance();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
          create: (context) => AppCubit(sp)..initialStateEvent(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit appCubit = AppCubit.get(context);
        return MaterialApp(
          // builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: appCubit.themeEnum == ThemeEnum.lightTheme
              ? ThemeData.light()
              : ThemeData.dark(),
          home: const HomePage(),
        );
      },
    );
  }
}
