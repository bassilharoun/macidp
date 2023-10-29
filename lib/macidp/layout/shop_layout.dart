import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macidp/macidp/app_cubit/app_cubit.dart';
import 'package:macidp/macidp/app_cubit/app_states.dart';

class ShopLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit , AppStates>(
      listener: (context , state){},
      builder: (context , state){
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 15,),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.menu,size: 30,)),
                        Spacer(),
                        Image.asset("assets/images/logo.png",width: 180,),
                        Spacer(),
                        Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: IconButton(
                                  onPressed: (){}, icon: Icon(Icons.shopping_cart_outlined,size: 30,)),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                  width: 20,
                                  height: 30,
                                  color: Colors.red,
                                  child: Center(
                                      child: Align(
                                        alignment: Alignment.topCenter,
                                          child: Text("5",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)
                                      )
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),

                      ],
                    ),
                  ),
                  cubit.bottomScreens[cubit.currentIndex],
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            elevation: 0,
            onTap: (index){
              cubit.changeBottom(index);
            },
            currentIndex: cubit.currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.storefront,size: 30,),
                label: 'المتجر'
              ),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.search,size: 30,),
                label: 'البحث'
              ),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.heart,size: 30,),
                label: 'المفضلة',
              ),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.list_bullet,size: 30,),
                  label: 'الفئات'
              ),
            ],
          ),
        );
      },
    );
  }
}
