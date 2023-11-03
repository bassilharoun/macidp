import 'dart:async';
import 'package:flutter/material.dart';
import 'package:macidp/macidp/app_cubit/app_cubit.dart';
import 'package:macidp/macidp/newscreens/fitness_app_home_screen.dart';
import 'package:macidp/macidp/shared/components/components.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  _getData(){
    AppCubit.get(context).getProducts().then((value) {
      _goNext();
    });
  }

  _goNext(){
    navigateAndFinish(context, FitnessAppHomeScreen());
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(
          width: double.infinity,
          child: const Image(image: AssetImage("assets/images/logo.png"),fit: BoxFit.cover,),
      )),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
