import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macidp/macidp/app_cubit/app_cubit.dart';
import 'package:macidp/macidp/app_cubit/app_states.dart';
import 'package:macidp/macidp/modules/products/products_screen.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ConditionalBuilder(
                condition: true,
                builder: (context) => GridView.count(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1 / 2.5,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  children: List.generate(
                      5,
                          (index) => buildGridProduct()),
                ),
                fallback: (context) => Container(
                    height: MediaQuery.of(context).size.height - MediaQuery.of(context).size.height / 4,
                    child: Center(
                      child: Container(
                          height: 40,
                          child: Text("المفضلة فارغة !",style: TextStyle(fontSize: 18),)
                    )),
              ),
            ))

          ],
        );
      },

    );
  }
}
