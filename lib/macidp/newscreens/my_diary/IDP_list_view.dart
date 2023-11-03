import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:macidp/macidp/app_cubit/app_cubit.dart';
import 'package:macidp/macidp/app_cubit/app_states.dart';
import 'package:macidp/macidp/newscreens/fitness_app_theme.dart';
import 'package:macidp/macidp/newscreens/license%20details/course_info_screen.dart';
import 'package:macidp/macidp/newscreens/models/IDP_list_data.dart';
import 'package:macidp/macidp/shared/components/components.dart';
import 'package:macidp/main.dart';


class IDPListView extends StatefulWidget {
  const IDPListView(
      {Key? key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;

  @override
  _IDPListViewState createState() => _IDPListViewState();
}

class _IDPListViewState extends State<IDPListView>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();

  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state){
        List<IdpListData> idpListData = <IdpListData>[
          IdpListData(
            imagePath: 'assets/images/200.png',
            titleTxt: '${AppCubit.get(context).products[6].name}',
            kacl: "${AppCubit.get(context).products[6].price}",
            Idp: <String>['53% Discount,','EXP : 2024-10-19'],
            startColor: '#0072E7',
            endColor: '#0A296D',
          ),
          IdpListData(
            imagePath: 'assets/images/250.png',
            titleTxt: '${AppCubit.get(context).products[5].name}',
            kacl: '${AppCubit.get(context).products[5].price}',
            Idp: <String>['57% Discount', 'EXP : 2026-10-19'],
            startColor: '#FE95B6',
            endColor: '#8201E9',
          ),
          IdpListData(
            imagePath: 'assets/images/300.png',
            titleTxt: '${AppCubit.get(context).products[4].name}',
            kacl: '${AppCubit.get(context).products[4].price}',
            Idp: <String>['55% Discount,', 'EXP : 2025-10-19'],
            startColor: '#FFFF8A',
            endColor: '#D89501',
          ),

        ];

        return AnimatedBuilder(
          animation: widget.mainScreenAnimationController!,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: widget.mainScreenAnimation!,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - widget.mainScreenAnimation!.value), 0.0),
                child: Container(
                  height: 260,
                  width: double.infinity,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(
                        top: 0, bottom: 0, right: 16, left: 16),
                    itemCount: idpListData.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      final int count =
                      idpListData.length > 10 ? 10 : idpListData.length;
                      final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController!,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));
                      animationController?.forward();

                      return GestureDetector(
                        onTap: (){
                          showDialog(context: context, builder: (_) => Container(
                            child: Center(child: Lottie.asset('assets/lotties/loading.json',),
                            ),
                          ));
                          Future.delayed(Duration(seconds: 1),(){
                            Navigator.pop(context);
                            // AppCubit.get(context).loading();


                          }).then((value) {
                            navigateTo(context, CourseInfoScreen(index));
                          });
                        },
                        child: CarsView(
                          IDPListData: idpListData[index],
                          animation: animation,
                          animationController: animationController!,
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class CarsView extends StatelessWidget {
  const CarsView(
      {Key? key, this.IDPListData, this.animationController, this.animation})
      : super(key: key);

  final IdpListData? IDPListData;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                100 * (1.0 - animation!.value), 0.0, 0.0),
            child: SizedBox(
              width: 150,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 32, left: 8, right: 8, bottom: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: HexColor(IDPListData!.endColor)
                                  .withOpacity(0.6),
                              offset: const Offset(1.1, 4.0),
                              blurRadius: 8.0),
                        ],
                        gradient: LinearGradient(
                          colors: <HexColor>[
                            HexColor(IDPListData!.startColor),
                            HexColor(IDPListData!.endColor),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(54.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 54, left: 10, right: 10, bottom: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              IDPListData!.titleTxt,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: FitnessAppTheme.fontName,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: 0.2,
                                color: FitnessAppTheme.white,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      IDPListData!.Idp!.join('\n'),
                                      style: TextStyle(
                                        fontFamily: FitnessAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                        letterSpacing: 0.2,
                                        color: FitnessAppTheme.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        IDPListData!.kacl.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: FitnessAppTheme.fontName,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 24,
                                          letterSpacing: 0.2,
                                          color: FitnessAppTheme.white,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 4, bottom: 3),
                                        child: Text(
                                          'SAR',
                                          style: TextStyle(
                                            fontFamily:
                                                FitnessAppTheme.fontName,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10,
                                            letterSpacing: 0.2,
                                            color: FitnessAppTheme.white,
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
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 84,
                      height: 84,
                      decoration: BoxDecoration(
                        color: FitnessAppTheme.nearlyWhite.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -8,
                    left: 8,
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(IDPListData!.imagePath),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
