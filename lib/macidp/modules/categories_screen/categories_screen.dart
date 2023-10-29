import 'package:flutter/material.dart';
import 'package:macidp/macidp/shared/colors.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => buildCategoriesItem(),
          separatorBuilder: (context, index) => SizedBox(height: 15,),
          itemCount: 5
      ),
    );
  }

  buildCategoriesItem(){
    return GestureDetector(
      onTap: (){},
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  backgroundImage: NetworkImage("https://acuranavi.navigation.com/static/WFS/Shop-Site/-/Shop/en_US/Product%20Not%20Found.png",),
                  radius: 50,
                ),
              ),
              SizedBox(width: 15,),
              Expanded(
                flex: 3,
                child: Container(
                  // width: MediaQuery.of(context).size.width / 1.8,
                    child: Text("category.name", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
