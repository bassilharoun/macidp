import 'dart:convert';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:macidp/macidp/app_cubit/app_cubit.dart';
import 'package:macidp/macidp/app_cubit/app_states.dart';
import 'package:macidp/macidp/newscreens/license%20details/license_data.dart';
import 'package:macidp/macidp/shared/colors.dart';
import 'package:macidp/macidp/shared/components/components.dart';
import 'package:macidp/main.dart';
import 'design_course_app_theme.dart';
import 'package:http/http.dart' as http;


class CourseInfoScreen extends StatefulWidget {
  int index;
  CourseInfoScreen(this.index);
  @override
  _CourseInfoScreenState createState() => _CourseInfoScreenState();
}

class _CourseInfoScreenState extends State<CourseInfoScreen>
    with TickerProviderStateMixin {
  final double infoHeight = 364.0;
  AnimationController? animationController;
  Animation<double>? animation;
  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passportController = TextEditingController();
  bool isChecked = false ;
  bool agreeTerms = false ;
  String gender = 'male';

  String? country ;

  List<String> categories = [
    "Motorcycle",
    "Car",
    "Over 7000 lbs",
    "Over 8 seats",
  ];

  int initCategory = 0;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController!,
        curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
    setData();
    super.initState();
  }

  Future<void> setData() async {
    animationController?.forward();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
  }


  @override
  Widget build(BuildContext context) {

    List<LicenseData> license = <LicenseData>[
      LicenseData(
        imagePath: 'assets/images/200.png',
        title: '${AppCubit.get(context).products[6].name}',
        price: "${AppCubit.get(context).products[6].price}",
        oldPrice: 0,
        features: <String>['53% Discount,','Limited Time Offer', 'Instant PDF Delivery','License Card & Book','EXP : 2024-10-19'],
        startColor: '#0072E7',
        endColor: '#0A296D',
      ),
      LicenseData(
        imagePath: 'assets/images/250.png',
        title: '${AppCubit.get(context).products[5].name}',
        price: "${AppCubit.get(context).products[5].price}",
        oldPrice: 600,
        features: <String>['57% Discount','Limited Time Offer', 'Instant PDF Delivery','License Card & Book','EXP : 2026-10-19'],
        startColor: '#FE95B6',
        endColor: '#8201E9',
      ),
      LicenseData(
        imagePath: 'assets/images/300.png',
        title: '${AppCubit.get(context).products[4].name}',
        price: "${AppCubit.get(context).products[4].price}",
        oldPrice: 400,
        features: <String>['55% Discount,', 'Limited Time Offer','Instant PDF Delivery','License Card & Book','EXP : 2025-10-19'],
        startColor: '#FFFF8A',
        endColor: '#D89501',
      ),

    ];


    final double tempHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width / 1.2) +
        24.0;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state){
        return Container(
          color: DesignCourseAppTheme.nearlyWhite,
          child: Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: opacity3,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, bottom: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    Expanded(
                      child: InkWell(
                        onTap: (){
                          getCheckOut() async {
                            final url = Uri.parse('https://dev.hyperpay.com/hyperpay-demo/getcheckoutid.php');
                            final response = await http.get(url);
                            if (response.statusCode == 200) {
                              AppCubit.get(context).payRequestNowReadyUI(
                                  checkoutId: json.decode(response.body)['id'],
                                  brandsName: [ "VISA" , "MASTER" , "MADA" ,"PAYPAL", "STC_PAY" , "APPLEPAY"]);
                            }else{
                              // dev.log(response.body.toString(), name: "STATUS CODE ERROR");
                            }
                          }
                        },
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: HexColor(license[widget.index].endColor),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(16.0),
                            ),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: DesignCourseAppTheme
                                      .nearlyBlue
                                      .withOpacity(0.5),
                                  offset: const Offset(1.1, 1.1),
                                  blurRadius: 10.0),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'ORDER LICENSE',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                letterSpacing: 0.0,
                                color: DesignCourseAppTheme
                                    .nearlyWhite,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [HexColor(license[widget.index].startColor),HexColor(license[widget.index].endColor),HexColor(license[widget.index].endColor)],begin: Alignment.topRight,end: Alignment.bottomLeft)
                    ),

                    child: Column(
                      children: <Widget>[
                        Lottie.asset('assets/lotties/cars.json'),
                        Container(
                          height: 1000,
                          decoration: BoxDecoration(
                            color: DesignCourseAppTheme.nearlyWhite,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(32.0),
                                topRight: Radius.circular(32.0)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: DesignCourseAppTheme.grey.withOpacity(0.2),
                                  offset: const Offset(1.1, 1.1),
                                  blurRadius: 10.0),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Container(
                              constraints: BoxConstraints(
                                  minHeight: infoHeight,
                                  maxHeight: tempHeight > infoHeight
                                      ? tempHeight
                                      : infoHeight),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 32,left: 18, right: 16),
                                    child: Text(
                                      license[widget.index].title,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22,
                                        letterSpacing: 0.27,
                                        color: DesignCourseAppTheme.darkerText,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16, top: 16),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "${license[widget.index].price} SAR",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w200,
                                            fontSize: 22,
                                            letterSpacing: 0.27,
                                            color: HexColor(license[widget.index].endColor),
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                '5.0',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w200,
                                                  fontSize: 22,
                                                  letterSpacing: 0.27,
                                                  color: DesignCourseAppTheme.grey,
                                                ),
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: HexColor(license[widget.index].endColor),
                                                size: 24,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  // Container(
                                  //   width: double.infinity,
                                  //   height: 300,
                                  //   child: AnimatedOpacity(
                                  //     duration: const Duration(milliseconds: 500),
                                  //     opacity: opacity1,
                                  //     child: Padding(
                                  //       padding: const EdgeInsets.symmetric(horizontal: 8),
                                  //       child: Expanded(
                                  //         child: GridView.builder(
                                  //           itemCount: license[widget.index].features!.length,
                                  //           gridDelegate:
                                  //           SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                                  //           itemBuilder: (context, index) => getTimeBoxUI('${license[widget.index].features![index]}',license[widget.index].endColor),
                                  //
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  // Expanded(
                                  //   child: AnimatedOpacity(
                                  //     duration: const Duration(milliseconds: 500),
                                  //     opacity: opacity2,
                                  //     child: Padding(
                                  //       padding: const EdgeInsets.only(
                                  //           left: 16, right: 16, top: 8, bottom: 8),
                                  //       child: Text(
                                  //         '',
                                  //         textAlign: TextAlign.justify,
                                  //         style: TextStyle(
                                  //           fontWeight: FontWeight.w200,
                                  //           fontSize: 14,
                                  //           letterSpacing: 0.27,
                                  //           color: DesignCourseAppTheme.grey,
                                  //         ),
                                  //         maxLines: 3,
                                  //         overflow: TextOverflow.ellipsis,
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  SizedBox(height: 15,),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Form(
                                      key: formKey,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          defaultTxtForm(
                                              controller: nameController,
                                              type: TextInputType.name,
                                              validate: (value){
                                                if(value!.isEmpty){
                                                  return "";
                                                }

                                              },
                                              label: "الاسم بالكامل",
                                              prefix: Icons.person_outline
                                          ),
                                          SizedBox(height: 15,),
                                          defaultTxtForm(
                                              controller: passportController,
                                              type: TextInputType.text,
                                              validate: (value){
                                                if(value!.isEmpty){
                                                  return "";
                                                }

                                              },
                                              label: "رقم جواز السفر",
                                              prefix: Icons.book_outlined
                                          ),
                                          SizedBox(height: 15,),
                                          Container(
                                            width: double.infinity,
                                            child: DecoratedBox(decoration: BoxDecoration(
                                                color:Colors.white, //background color of dropdown button
                                                border: Border.all(color: buttonsColor, width:1), //border of dropdown button
                                                borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
                                                boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
                                                  BoxShadow(
                                                      color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                                                      blurRadius: 5) //blur radius of shadow
                                                ]
                                            ),
                                              child: Center(
                                                child: DropdownButton(
                                                    value: AppCubit.get(context).dropdNationality,
                                                    items: AppCubit.get(context).nationality.map((e) {
                                                      return DropdownMenuItem(
                                                        value: e,
                                                        child: Text(e),
                                                      );
                                                    }).toList(),
                                                    onChanged: (String? newValue){
                                                      AppCubit.get(context).changeDropdownNationality(newValue);
                                                    }
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 15,),
                                          Container(
                                            width: double.infinity,
                                            child: DecoratedBox(decoration: BoxDecoration(
                                                color:Colors.white, //background color of dropdown button
                                                border: Border.all(color: buttonsColor, width:1), //border of dropdown button
                                                borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
                                                boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
                                                  BoxShadow(
                                                      color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                                                      blurRadius: 5) //blur radius of shadow
                                                ]
                                            ),
                                              child: Center(
                                                child: DropdownButton(
                                                    value: AppCubit.get(context).dropdDriving,
                                                    items: AppCubit.get(context).driving.map((e) {
                                                      return DropdownMenuItem(
                                                        value: e,
                                                        child: Text(e),
                                                      );
                                                    }).toList(),
                                                    onChanged: (String? newValue){
                                                      AppCubit.get(context).changeDropdownDriving(newValue);
                                                    }
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 15,),
                                          Container(
                                            width: double.infinity,
                                            child: DecoratedBox(decoration: BoxDecoration(
                                                color:Colors.white, //background color of dropdown button
                                                border: Border.all(color: buttonsColor, width:1), //border of dropdown button
                                                borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
                                                boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
                                                  BoxShadow(
                                                      color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                                                      blurRadius: 5) //blur radius of shadow
                                                ]
                                            ),
                                              child: Center(
                                                child: DropdownButton(
                                                    value: AppCubit.get(context).dropdCountry,
                                                    items: AppCubit.get(context).country.map((e) {
                                                      return DropdownMenuItem(
                                                        value: e,
                                                        child: Text(e),
                                                      );
                                                    }).toList(),
                                                    onChanged: (String? newValue){
                                                      AppCubit.get(context).changeDropdownCountry(newValue);
                                                    }
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 15,),
                                          Row(children: [
                                            Expanded(
                                              child: RadioListTile(
                                                  activeColor: buttonsColor,
                                                  title: Text("ذكر"),
                                                  value: "male",
                                                  groupValue: gender,
                                                  onChanged: (value){
                                                    gender = value.toString() ;
                                                    print(gender);
                                                    AppCubit.get(context).changeRadio();
                                                  }
                                              ),
                                            ),
                                            Expanded(
                                              child: RadioListTile(
                                                  activeColor: buttonsColor,
                                                  title: Text("انثى"),
                                                  value: "female",
                                                  groupValue: gender,
                                                  onChanged: (value){
                                                    gender = value.toString() ;
                                                    print(gender);
                                                    AppCubit.get(context).changeRadio();
                                                  }
                                              ),
                                            ),
                                          ],),

                                          Container(
                                            height: 130,
                                            child: Expanded(
                                              child: GridView.builder(
                                                gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                                                itemBuilder: (context, index) => GestureDetector(
                                                  onTap: (){
                                                    initCategory = index ;
                                                    setState(() {});
                                                  },
                                                  child: Card(
                                                      elevation: 5,
                                                      shadowColor: HexColor(license[widget.index].startColor),
                                                      child: Center(
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              "${categories[index]}",
                                                              style: TextStyle(fontSize: 12,color: initCategory == index ? Colors.white : Colors.black),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      color: initCategory == index ? HexColor(license[widget.index].endColor) : Colors.white),
                                                ),
                                                itemCount: 4,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 15,),
                                          Row(
                                            children: [
                                              Expanded(child: Card(
                                                child: Column(
                                                  children: [
                                                    Text("الصورة الشخصية"),
                                                    IconButton(icon: Icon(AppCubit.get(context).profileImage == null ? Icons.upload : Icons.check),onPressed: (){
                                                      AppCubit.get(context).getProfileImage();
                                                    },),
                                                  ],
                                                ),
                                              )),
                                              Expanded(child: Card(
                                                child: Column(
                                                  children: [
                                                    Text("رخصة القيادة المحلية"),
                                                    IconButton(icon: Icon(AppCubit.get(context).licenceImage == null ? Icons.upload : Icons.check),onPressed: (){
                                                      AppCubit.get(context).getLicenceImage();
                                                    },),
                                                  ],
                                                ),
                                              )),
                                              Expanded(child: Card(
                                                child: Column(
                                                  children: [
                                                    Text("صورة جواز السفر"),
                                                    IconButton(icon: Icon(AppCubit.get(context).passportImage == null ? Icons.upload : Icons.check),onPressed: (){
                                                      AppCubit.get(context).getPassportImage();
                                                    },),
                                                  ],
                                                ),
                                              )),
                                            ],
                                          ),
                                          SizedBox(height: 15,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 12.0),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Checkbox(
                                                    activeColor: buttonsColor,
                                                    value: agreeTerms,
                                                    onChanged: (value){
                                                      agreeTerms = !agreeTerms ;
                                                      AppCubit.get(context).changeCheckBox();
                                                      print(agreeTerms);
                                                    }
                                                ),
                                                Container(width: 300,child: Text("أنا متأكد من أن الصورة الشخصية بخلفية بيضاء و جواز السفر ساري المفعول و رخصة القيادة صالحة وأن البيانات المدخلة صحيحة وقد راجعتها بالكامل")),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )

                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                    child: SizedBox(
                      width: AppBar().preferredSize.height,
                      height: AppBar().preferredSize.height,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius:
                          BorderRadius.circular(AppBar().preferredSize.height),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: DesignCourseAppTheme.nearlyBlack,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget getTimeBoxUI(String text1,String color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: DesignCourseAppTheme.nearlyWhite,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: DesignCourseAppTheme.grey.withOpacity(0.2),
                offset: const Offset(1.1, 1.1),
                blurRadius: 8.0),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              text1,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                letterSpacing: 0.27,
                color: HexColor(color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
