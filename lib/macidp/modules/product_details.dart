import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macidp/macidp/app_cubit/app_cubit.dart';
import 'package:macidp/macidp/app_cubit/app_states.dart';
import 'package:macidp/macidp/models/product_model.dart';
import 'package:macidp/macidp/shared/colors.dart';
import 'package:macidp/macidp/shared/components/components.dart';

class ProductDetails extends StatelessWidget {
  ProductModel? product ;
  ProductDetails(this.product){
    imgView = product!.images[0].src ;
  }
  String imgView = "";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
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
                              child: Row(children: [
                                Align(
                                  child: IconButton(onPressed: (){
                                  },
                                      icon: Icon(CupertinoIcons.minus)),
                                  alignment: Alignment.center,
                                ),
                                Text("5",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                                IconButton(onPressed: (){
                                }, icon: Icon(CupertinoIcons.plus)),
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
                      child: false ?
                      ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[100],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        child: Text(
                          "احذف من العربة",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: greenColor,
                          ),
                        ),
                      )
                      : ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: greenColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        child: Text(
                          "أضف الى العربة",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
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
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 60,
                      child: Row(
                        children: [
                          IconButton(onPressed: (){
                            Navigator.pop(context);
                          }, icon: Icon(CupertinoIcons.back,size: 30,)),
                          Spacer(),
                          Image.asset("assets/images/logo.png",width: 180,),
                          Spacer(),
                          IconButton(onPressed: (){
                          }, icon: Icon(Icons.shopping_cart_outlined,size: 30,)),

                        ],
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 2.5,
                        child: Container(
                          width: double.infinity,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                  image: NetworkImage(imgView,
                                ),
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                          ),
                        )
                    ),
                    // buildListImage(context, product!.images[0].src,),
                    SizedBox(height: 15,),
                    // buildListImage(context, product!.images[1].src),
                    Container(
                      height: 80,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: product!.images.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: 10);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return buildListImage(context, product!.images[index].src);
                        },
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 25,),
                              Container(
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: Text(
                                  product!.name,
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: 15,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  if(product!.average_rating == "1.00")...[
                                    Icon(Icons.star , color: Colors.yellow,size: 20,),
                                    Icon(Icons.star , color: Colors.grey,size: 20,),
                                    Icon(Icons.star , color: Colors.grey,size: 20,),
                                    Icon(Icons.star , color: Colors.grey,size: 20,),
                                    Icon(Icons.star , color: Colors.grey,size: 20,),
                                  ]
                                  else if(product!.average_rating == "2.00")...[
                                    Icon(Icons.star , color: Colors.yellow,size: 20,),
                                    Icon(Icons.star , color: Colors.yellow,size: 20,),
                                    Icon(Icons.star , color: Colors.grey,size: 20,),
                                    Icon(Icons.star , color: Colors.grey,size: 20,),
                                    Icon(Icons.star , color: Colors.grey,size: 20,),
                                  ]

                                  else if(product!.average_rating == "3.00")...[
                                      Icon(Icons.star , color: Colors.yellow,size: 20,),
                                      Icon(Icons.star , color: Colors.yellow,size: 20,),
                                      Icon(Icons.star , color: Colors.yellow,size: 20,),
                                      Icon(Icons.star , color: Colors.grey,size: 20,),
                                      Icon(Icons.star , color: Colors.grey,size: 20,),
                                    ]

                                    else if(product!.average_rating == "4.00")...[
                                        Icon(Icons.star , color: Colors.yellow,size: 20,),
                                        Icon(Icons.star , color: Colors.yellow,size: 20,),
                                        Icon(Icons.star , color: Colors.yellow,size: 20,),
                                        Icon(Icons.star , color: Colors.yellow,size: 20,),
                                        Icon(Icons.star , color: Colors.grey,size: 20,),

                                      ]

                                      else if(product!.average_rating == "5.00")...[
                                          Icon(Icons.star , color: Colors.yellow,size: 20,),
                                          Icon(Icons.star , color: Colors.yellow,size: 20,),
                                          Icon(Icons.star , color: Colors.yellow,size: 20,),
                                          Icon(Icons.star , color: Colors.yellow,size: 20,),
                                          Icon(Icons.star , color: Colors.yellow,size: 20,),
                                        ],
                                  SizedBox(width: 10,),
                                  Text("${product!.rating_count} تقييم",style: TextStyle(fontSize: 18),),
                                  SizedBox(width: 10,),
                                  Row(children: [
                                    Icon(CupertinoIcons.cube_box,color: greenColor,size: 20,),
                                    SizedBox(width: 5,),
                                    Text("In Stock",style: TextStyle(color: greenColor,fontWeight: FontWeight.bold),)
                                  ],),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(children: [
                                if(product!.price != product!.regularPrice)
                                  Text(
                                    product!.regularPrice,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough

                                    ),
                                  ),
                                Text(
                                  "${product!.price} ر.س",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: product!.price == product!.regularPrice ? Colors.grey[600] : buttonsColor),
                                ),
                              ],),
                            ],
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 25,),
                    myDivider(),
                    SizedBox(height: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("الوصف",style: TextStyle(fontSize: 22),),
                        SizedBox(height: 10,),
                        myDivider(),
                        SizedBox(height: 25,),
                        Text(product!.description, style: TextStyle(fontSize: 18,color: Colors.grey[700]),),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

  }
  Widget buildListImage(context,String image){
    return GestureDetector(
      onTap: (){
        imgView = image ;
        print(imgView);
        print(image);
      },
      child: Container(
          width: 80,
          height: 80,
          child: Container(
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: NetworkImage(image,
                    ),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
          )
      ),
    );

  }
}
