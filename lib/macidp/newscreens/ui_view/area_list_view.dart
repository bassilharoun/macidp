import 'package:flutter/material.dart';
import 'package:macidp/macidp/app_cubit/app_cubit.dart';
import 'package:macidp/macidp/shared/colors.dart';

import '../fitness_app_theme.dart';

class AreaListView extends StatefulWidget {
  const AreaListView(
      {Key? key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;
  @override
  _AreaListViewState createState() => _AreaListViewState();
}

class _AreaListViewState extends State<AreaListView>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  List<String> areaListData = <String>[
    'assets/images/europe.png',
    'assets/images/yemen.png',
    'assets/images/Egypt.png',
  ];
  int initTriptik = 1;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.mainScreenAnimation!.value), 0.0),
            child: AspectRatio(
              aspectRatio: 0.8,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: GridView(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 16, bottom: 16),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: List<Widget>.generate(
                    areaListData.length,
                    (int index) {
                      final int count = areaListData.length;
                      final Animation<double> animation =
                          Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                          parent: animationController!,
                          curve: Interval((1 / count) * index, 1.0,
                              curve: Curves.fastOutSlowIn),
                        ),
                      );
                      animationController?.forward();
                      if(index == 0 || index == 1){
                        return AreaView(
                          imagepath: areaListData[index],
                          animation: animation,
                          name: AppCubit.get(context).products[initTriptik + index].name,
                          price: "${AppCubit.get(context).products[initTriptik + index].price}",
                          animationController: animationController!,
                        );
                      }
                      else{
                        return AreaView(
                          imagepath: areaListData[index],
                          animation: animation,
                          name: "دفتر تريبتيك مصر",
                          price: "قريبا",
                          animationController: animationController!,
                        );
                      }

                    },
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 24.0,
                    crossAxisSpacing: 24.0,
                    childAspectRatio: 0.75,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AreaView extends StatelessWidget {
  const AreaView({
    Key? key,
    this.imagepath,
    this.name,
    this.price,
    this.animationController,
    this.animation,
  }) : super(key: key);

  final String? imagepath;
  final String? name;
  final String? price;
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
                0.0, 50 * (1.0 - animation!.value), 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: FitnessAppTheme.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topRight: Radius.circular(8.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: FitnessAppTheme.grey.withOpacity(0.4),
                      offset: const Offset(1.1, 1.1),
                      blurRadius: 10.0),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  splashColor: FitnessAppTheme.nearlyDarkBlue.withOpacity(0.2),
                  onTap: () {
                    //Todo
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Image.asset(imagepath!),
                        Text(name!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("${price}",style: TextStyle(color: buttonsColor,fontWeight: FontWeight.bold,fontSize: 18),),
                            if(price !="قريبا")
                              Text("SAR",style: TextStyle(fontSize: 12),)
                          ],
                        )


                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
