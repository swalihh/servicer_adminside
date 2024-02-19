import 'package:adminservice/bloc/login/bloc/login_bloc.dart';
import 'package:adminservice/bloc/progress/bloc/progress_bloc.dart';
import 'package:adminservice/bloc/servicer/servicer_bloc.dart';
import 'package:adminservice/data/sharedpreferences/login.dart';
import 'package:adminservice/resources/constant/colors.dart';
import 'package:adminservice/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Sharedprfe.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ServicerBloc(),
        ),
        BlocProvider(
          create: (context) => ProgressBloc(),
        ), 
        BlocProvider(
          create: (context) => LoginBloc(),
        )
      ],
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          primaryColor: Webcolors.primaryColor,
          canvasColor: Webcolors.canvasColor,
        ),
        home: const Splash(),
      ),
    );
  }
}
