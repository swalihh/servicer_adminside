// ignore_for_file: use_build_context_synchronously

import 'package:adminservice/bloc/progress/bloc/progress_bloc.dart';
import 'package:adminservice/bloc/servicer/servicer_bloc.dart';
import 'package:adminservice/data/sharedpreferences/login.dart';
import 'package:adminservice/resources/constant/colors.dart';
import 'package:adminservice/resources/constant/fonts.dart';
import 'package:adminservice/resources/strings/splashstring.dart';
import 'package:adminservice/view/home.dart';
import 'package:adminservice/view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    _validation(context);

    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Webcolors.accentCanvasColor,
        child: Center(
          child: Text(
            HomeString.appName,
            style: AppText.appname,
          ),
        ),
      ),
    );
  }

  _validation(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    final token = Sharedprfe.instance.getToken();
    if (token != null) {
      context.read<ServicerBloc>().add(UserDataFetchEvent());
      context.read<ProgressBloc>().add(AcceptedUserFetchEvent());
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const Home(),
      ));
    } else {
      
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
          (route) => false);
    }
  }
}
