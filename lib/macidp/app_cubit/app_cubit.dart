import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyperpay_plugin/flutter_hyperpay.dart';
import 'package:hyperpay_plugin/model/ready_ui.dart';
import 'package:image_picker/image_picker.dart';
import 'package:macidp/macidp/constance/config.dart';
import 'package:macidp/macidp/models/products_model.dart';
import 'package:macidp/macidp/modules/categories_screen/categories_screen.dart';
import 'package:macidp/macidp/modules/fav_screen/fav_screen.dart';
import 'package:macidp/macidp/modules/products/products_screen.dart';
import 'package:macidp/macidp/newscreens/models/IDP_list_data.dart';
import 'package:macidp/macidp/payment/conf.dart';

import 'app_states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false ;


  int currentIndex = 0 ;

  List<Widget> bottomScreens = [
    ProductsScreen(),
    FavScreen(),
    FavScreen(),
    // SettingsScreen(),
    CategoriesScreen(),
  ];

  void changeBottom(int index){
    currentIndex = index ;
    emit(AppChangeScreenState());
  }

  loading(){
    emit(AppLoadingState());
  }

  List<Products> products = [];
  Future<List<Products>> getProducts()async{
    emit(AppLoadingHomeDataState());
    try{
      String url = Config.url + Config.productsUrl +
          "?consumer_key=${Config.key}&consumer_secret=${Config.secret}";
      var response = await Dio().get(
          url,
          options: Options(
              headers: {
                HttpHeaders.contentTypeHeader : "application/json"
              }
          )

      );
      if(response.statusCode == 200){
        products = (response.data as List).map((e) => Products.fromJson(e)).toList();
        print(response.data);
        emit(AppSuccessHomeDataState());
      }
    } on DioError catch (e){
      print(e.response);
    }
    // print(data[4].images[0].src);
    return products ;
  }

  String? dropdNationality = "اختر الجنسية" ;

  var nationality = [
  "اختر الجنسية",
  "الجزائر",
  "مصر",
  "المغرب",
  "تونس",
  "ليبيا",
  "السودان",
  "العراق",
  "الأردن",
  "لبنان",
  "فلسطين",
  "سوريا",
  "اليمن",
  "السعودية",
  "الإمارات العربية المتحدة",
  "قطر",
  "البحرين",
  "عمان",
  "الكويت",
  "الجزر القمر",
  "جيبوتي",
  "موريتانيا",
  "الصومال",
  "الصحراء الغربية",
  "السلطنة",
  "العمق",
  "البلقان",
  "الأندلس",
  "الصين",
  "الهند",
  "روسيا",
  "البرازيل",
  "كندا",
  "أستراليا",
  "اليابان",
  "كوريا الجنوبية",
  "كوريا الشمالية",
  "إنجلترا",
  "فرنسا",
  "ألمانيا",
  "إيطاليا",
  "إسبانيا",
  "البرتغال",
  "هولندا",
  "بلجيكا",
  "النمسا",
  "سويسرا",
  "السويد",
  "النرويج",
  "دنمارك",
  "فنلندا",
  ];


  String? dropdDriving = "اختر دولة مصدر القيادة المحلية" ;

  var driving = [
    "اختر دولة مصدر القيادة المحلية",
    "الجزائر",
    "مصر",
    "المغرب",
    "تونس",
    "ليبيا",
    "السودان",
    "العراق",
    "الأردن",
    "لبنان",
    "فلسطين",
    "سوريا",
    "اليمن",
    "السعودية",
    "الإمارات العربية المتحدة",
    "قطر",
    "البحرين",
    "عمان",
    "الكويت",
    "الجزر القمر",
    "جيبوتي",
    "موريتانيا",
    "الصومال",
    "الصحراء الغربية",
    "السلطنة",
    "العمق",
    "البلقان",
    "الأندلس",
    "الصين",
    "الهند",
    "روسيا",
    "البرازيل",
    "كندا",
    "أستراليا",
    "اليابان",
    "كوريا الجنوبية",
    "كوريا الشمالية",
    "إنجلترا",
    "فرنسا",
    "ألمانيا",
    "إيطاليا",
    "إسبانيا",
    "البرتغال",
    "هولندا",
    "بلجيكا",
    "النمسا",
    "سويسرا",
    "السويد",
    "النرويج",
    "دنمارك",
    "فنلندا",
  ];

  String? dropdCountry = "اختر دولة الاقامة" ;

  var country = [
    "اختر دولة الاقامة",
    "الجزائر",
    "مصر",
    "المغرب",
    "تونس",
    "ليبيا",
    "السودان",
    "العراق",
    "الأردن",
    "لبنان",
    "فلسطين",
    "سوريا",
    "اليمن",
    "السعودية",
    "الإمارات العربية المتحدة",
    "قطر",
    "البحرين",
    "عمان",
    "الكويت",
    "الجزر القمر",
    "جيبوتي",
    "موريتانيا",
    "الصومال",
    "الصحراء الغربية",
    "السلطنة",
    "العمق",
    "البلقان",
    "الأندلس",
    "الصين",
    "الهند",
    "روسيا",
    "البرازيل",
    "كندا",
    "أستراليا",
    "اليابان",
    "كوريا الجنوبية",
    "كوريا الشمالية",
    "إنجلترا",
    "فرنسا",
    "ألمانيا",
    "إيطاليا",
    "إسبانيا",
    "البرتغال",
    "هولندا",
    "بلجيكا",
    "النمسا",
    "سويسرا",
    "السويد",
    "النرويج",
    "دنمارك",
    "فنلندا",
  ];

  String? dropBlood = "اختر فصيلة الدم" ;

  var bloods = [
    "اختر فصيلة الدم",
    "A+",
    "A-",
    "B+",
    "B-",
    "O+",
    "O-",
    "AB+",
    "AB-",
  ];

  changeDropdownNationality(String? newValue){
    dropdNationality = newValue;
    emit(AppChangeDropdown());
  }
  changeDropdownDriving(String? newValue){
    dropdDriving = newValue;
    emit(AppChangeDropdown());
  }
  changeDropdownCountry(String? newValue){
    dropdCountry = newValue;
    emit(AppChangeDropdown());
  }

  changeRadio(){
    emit(AppChangeRadioState());
  }

  changeCheckBox(){
    emit(AppChangeCheckBoxState());
  }

  dynamic profileImage ;
  var picker1 = ImagePicker() ;

  Future<void> getProfileImage()async{
    final pickedFile = await picker1.getImage(source: ImageSource.gallery);

    if(pickedFile != null){
      profileImage = File(pickedFile.path);
      emit(AppPassportPickedSuccessState());
    }else{
      print('No image selected');
      emit(AppPassportPickedErrorState());
    }
  }

  dynamic licenceImage ;
  var picker2 = ImagePicker() ;

  Future<void> getLicenceImage()async{
    final pickedFile = await picker3.getImage(source: ImageSource.gallery);

    if(pickedFile != null){
      licenceImage = File(pickedFile.path);
      emit(AppPassportPickedSuccessState());
    }else{
      print('No image selected');
      emit(AppPassportPickedErrorState());
    }
  }

  dynamic passportImage ;
  var picker3 = ImagePicker() ;

  Future<void> getPassportImage()async{
    final pickedFile = await picker2.getImage(source: ImageSource.gallery);

    if(pickedFile != null){
      passportImage = File(pickedFile.path);
      emit(AppPassportPickedSuccessState());
    }else{
      print('No image selected');
      emit(AppPassportPickedErrorState());
    }
  }


  late FlutterHyperPay flutterHyperPay ;
  setupPayment(){
    flutterHyperPay = FlutterHyperPay(
      shopperResultUrl: InAppPaymentSetting.shopperResultUrl, // return back to app
      paymentMode:  PaymentMode.test, // test or live
      lang: InAppPaymentSetting.getLang(),
    );
  }

  payRequestNowReadyUI(
      {required List<String> brandsName, required String checkoutId}) async {
    setupPayment();
    PaymentResultData paymentResultData;
    paymentResultData = await flutterHyperPay.readyUICards(
      readyUI: ReadyUI(
          brandsName: brandsName ,
          checkoutId: checkoutId,
          merchantIdApplePayIOS: InAppPaymentSetting.merchantId, // applepay
          countryCodeApplePayIOS: InAppPaymentSetting.countryCode, // applePay
          companyNameApplePayIOS: "Test Co", // applePay
          themColorHexIOS: "#000000" ,// FOR IOS ONLY
          setStorePaymentDetailsMode: true // store payment details for future use
      ),
    );
  }




}