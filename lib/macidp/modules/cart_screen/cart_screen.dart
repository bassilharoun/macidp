import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macidp/macidp/app_cubit/app_cubit.dart';
import 'package:macidp/macidp/app_cubit/app_states.dart';
import 'package:macidp/macidp/modules/product_details.dart';
import 'package:macidp/macidp/shared/colors.dart';
import 'package:macidp/macidp/shared/components/components.dart';

class CartScreen extends StatefulWidget {

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){

        // if(state is ShopSuccessGetCart){
        //   Navigator.pop(context);
        // }
      },
      builder: (context, state){
        return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        color: Colors.grey[300],
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              height: 50,
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                Text("10",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                              ],),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 50,
                      child: ElevatedButton(

                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonsColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        child: Text(
                          "أشتر الان",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    height: 60,
                    child: Row(
                      children: [
                        IconButton(onPressed: (){
                          Navigator.pop(context);
                        }, icon: Icon(Icons.arrow_back_ios,size: 30,)),
                        Spacer(),
                        Image.asset("assets/images/logo.png",width: 180,),
                        Spacer(),
                        Container(width: 50,),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                              child: SizedBox()),
                        Expanded(
                          flex: 3,
                            child: Text("المنتج",style: TextStyle(color: Colors.grey[400],fontWeight: FontWeight.bold,fontSize: 18),)),
                        Expanded(child: Text("الكمية",style: TextStyle(color: Colors.grey[400],fontWeight: FontWeight.bold,fontSize: 18),)),
                      ],
                      ),
                      SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.only(right: 74),
                        child: myDivider(),
                      ),
                      SizedBox(height: 15,),
                      ConditionalBuilder(condition: true,
                          builder: (context) => ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => buildCartItem(),
                            separatorBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: myDivider(),
                            ),
                            itemCount: 5,

                          ),
                          fallback: (context) => Center(child: Text("No Cart Items"),)
                      )
                    ],),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
  buildCartItem(){

    return GestureDetector(
      onTap: (){
        // navigateTo(context, ProductDetails());
      },
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: (){
              },
                child: Icon(Icons.delete_forever,color: Colors.red,size: 35,)
            ),
            flex: 1,
          ),
          Expanded(
            flex: 3,
            child: Container(
                height: 100,
                width: 100,
                child: Container()
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(

              child: Text("product.name",style: TextStyle(fontSize: 18),),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Text(
                  "ر.س",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: buttonsColor),
                ),
                SizedBox(height: 15,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    color: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          height: 40,
                          color: Colors.white,
                          child: Row(children: [
                            IconButton(onPressed: (){},
                                icon: Icon(CupertinoIcons.minus)),
                            Text("{product.quantity}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                            IconButton(onPressed: (){
                            }, icon: Icon(CupertinoIcons.plus)),
                          ],),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
