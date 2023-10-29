import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macidp/macidp/app_cubit/app_cubit.dart';
import 'package:macidp/macidp/app_cubit/app_states.dart';
import 'package:macidp/macidp/models/categories_model.dart';
import 'package:macidp/macidp/modules/products/products_screen.dart';
import 'package:macidp/macidp/shared/colors.dart';

class CategoryProducts extends StatelessWidget {
  CategoriesModel category ;
  CategoryProducts(this.category);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: ConditionalBuilder(
              condition: true,
              builder: (context) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: IconButton(onPressed: (){
                              Navigator.pop(context);
                            }, icon: Icon(Icons.arrow_back_ios,size: 30,)),
                          ),
                          Expanded(
                            flex: 5,
                              child: Text(
                                category.name,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
                          ),
                        ],
                      ),
                      GridView.count(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1 / 2.5,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        children: List.generate(
                            9,
                                (index) => buildGridProduct()),
                      ),
                    ],
                  ),
                ),
              ),
              fallback: (context) => Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: IconButton(onPressed: (){
                          Navigator.pop(context);
                        }, icon: Icon(Icons.arrow_back_ios,size: 30,)),
                      ),
                      Expanded(
                          flex: 5,
                          child: Text(
                            category.name,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                      child: Center(child: Icon(CupertinoIcons.zzz, color: defaultColor,size: 50,))),
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
