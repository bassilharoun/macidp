import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macidp/macidp/app_cubit/app_cubit.dart';
import 'package:macidp/macidp/app_cubit/app_states.dart';
import 'package:macidp/macidp/shared/colors.dart';
import 'package:macidp/macidp/shared/components/components.dart';

class ProductsScreen extends StatelessWidget {

  bool loading = false ;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: BlocConsumer<AppCubit , AppStates>(
          listener: (context , state) {},
          builder: (context , state){
            return  ConditionalBuilder(
                condition: true,
                builder: (context) => productsBuilder(context),
                fallback: (context) => Container(
                  height: MediaQuery.of(context).size.height - MediaQuery.of(context).size.height / 4,
                    child: Center(
                      child: Container(
                        height: 40,
                          child: CircularProgressIndicator(color: defaultColor,)),
                    )),
              );

          },
        )
      ),
    );
  }

  Widget productsBuilder(context) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CarouselSlider(
              items: [
                Image.asset("assets/images/slider1.jpg", width: double.infinity,
                  fit: BoxFit.cover,),
                Image.asset("assets/images/slider2.png",  width: double.infinity,
                  fit: BoxFit.cover,),
                Image.asset("assets/images/slider3.png",  width: double.infinity,
                  fit: BoxFit.cover,),
              ],
              options: CarouselOptions(
                  height: 200,
                  initialPage: 0,
                  viewportFraction: 1,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal

              )),
        ),
        SizedBox(height: 15,),
        loading == true ? LinearProgressIndicator(color: buttonsColor,backgroundColor: Colors.grey,):

        SizedBox(height: 5,),

        GridView.count(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1 / 2.5,
          shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
          children: List.generate(
              5,
                  (index) => buildGridProduct()),
        )

      ],
    ),
  );

}

  Widget buildGridProduct() {
    return  ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: GestureDetector(
      onTap: (){
      },
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(image: NetworkImage("https://www.bulliondiamond.com/wp-content/themes/EmeraldByGemfind/media/product-placeholder.jpg"),
                        fit: BoxFit.cover,
                        width: double.infinity,
                      )
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Column(
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 16,
                            child: GestureDetector(
                              onTap: (){},
                              child: CircleAvatar(
                                radius: 15,backgroundColor: Colors.white,
                                child: Icon(Icons.favorite,color: buttonsColor,),
                              ),
                            )
                        ),
                        const SizedBox(height: 5,),
                        CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 16,
                            child: const CircleAvatar(
                              radius: 15,backgroundColor: Colors.white,
                              child: Icon(Icons.compare_arrows,color: defaultColor,),
                            )
                        ),
                        const SizedBox(height: 5,),
                        CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 16,
                            child: const CircleAvatar(
                              radius: 15,backgroundColor: Colors.white,
                              child: Icon(Icons.remove_red_eye_outlined,color: defaultColor,),
                            )
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "product.name",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                    SizedBox(height: 15,),
                  const SizedBox(height: 15,),
                  Row(children: [
                    Text(
                      " ر.س ",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.grey[600]),
                    ),
                  ],),
                  const SizedBox(height: 15,),
                  Row(children: const [
                    Icon(CupertinoIcons.cube_box,color: greenColor,size: 20,),
                    SizedBox(width: 5,),
                    Text("In Stock",style: TextStyle(color: greenColor,fontWeight: FontWeight.bold),)
                  ],),
                  const SizedBox(height: 15,),
                  false ?
                  defaultButton(background: lightColor,txtColor: buttonsColor,
                      function: (){}, text: "احذف من العربة")

                      : defaultButton(function: (){}, text: "أضف الى العربة")
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

