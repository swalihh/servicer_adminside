import 'package:adminservice/bloc/bloc/servicer_bloc.dart';
import 'package:adminservice/bloc/progress/bloc/progress_bloc.dart';
import 'package:adminservice/resources/constant/colors.dart';
import 'package:adminservice/view/home.dart';
import 'package:adminservice/view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ServicerBloc(),),
        BlocProvider(create: (context) => ProgressBloc(),)
   
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Webcolors.primaryColor,
          canvasColor: Webcolors.canvasColor,
        ),
        home: Login(),
      ),
    );
  }
}
