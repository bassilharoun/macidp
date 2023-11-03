import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macidp/macidp/app_cubit/app_cubit.dart';
import 'package:macidp/macidp/app_cubit/app_states.dart';
import 'package:macidp/macidp/layout/shop_layout.dart';
import 'package:macidp/macidp/modules/splash_screen/splash_view.dart';
import 'package:macidp/macidp/newscreens/fitness_app_home_screen.dart';
import 'package:macidp/macidp/shared/bloc_observer.dart';
import 'package:macidp/macidp/shared/network/dio_helper.dart';
import 'package:macidp/macidp/shared/network/local/cache_helper.dart';
import 'package:macidp/macidp/styles/themes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();


  runApp(MyApp(
    startWidget: SplashView(),
  ));
}

class MyApp extends StatelessWidget{

  final Widget? startWidget ;
  MyApp({this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => AppCubit()..getProducts(),),
      ],
      child: BlocConsumer<AppCubit , AppStates>(
        listener: (context , state){},
        builder: (context , state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            theme: lightTheme,
            home: startWidget,
          );
        },
      ),
    );
  }

}
class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}