import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macidp/macidp/app_cubit/app_cubit.dart';
import 'package:macidp/macidp/app_cubit/app_states.dart';
import 'package:macidp/macidp/newscreens/fitness_app_theme.dart';
import 'package:macidp/macidp/shared/colors.dart';
import 'package:macidp/main.dart';

class UserScreen extends StatelessWidget {

  dynamic userId ;
  UserScreen(this.userId);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppStates>(
      listener: (context , state) {
      } ,
      builder: (context , state) {
        return ConditionalBuilder(
          condition: true,
          builder: (context) => Scaffold(
            appBar: AppBar(title: Text("Bassil Haroun"),),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 170,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          child: Container(
                            height: 140,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image:  NetworkImage(
                                        "https://content.wepik.com/statics/14542381/preview-page0.jpg") ,
                                    fit: BoxFit.cover

                                )
                            ),
                          ),
                          alignment: AlignmentDirectional.topCenter,
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 46,
                                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                backgroundImage: NetworkImage(
                                    "https://scontent.fcai19-6.fna.fbcdn.net/v/t39.30808-6/348434706_773073574567484_5778381249555288118_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHSGFSWJSrTyLhSkF8MOzD2Vl25_PJ856dWXbn88nznp0vEUvd3xAuFni-aKfI9YXy-O5XMuCgN07EJTgmVePTa&_nc_ohc=BbTRMyDmaQQAX-K2jdJ&_nc_oc=AQnxXQp9nXJHnGQg2NOMSZ8C1NiHgyWEgoUItuFeqUaWf0BeW20P-v7Ypq7rWsZCsbc&_nc_ht=scontent.fcai19-6.fna&oh=00_AfA6TZz3Ir1WCFn2ok184gvjeivoLdpYd4v6yfdraybtwg&oe=654AAB34") ,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text("Bassil Haroun",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 24
                    ),
                  ),
                  Text("Your order in progress...",
                    maxLines: 3,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                        fontSize: 16
                    ),
                  ),
                  SizedBox(height: 15,),
                  ListView.separated(
                    shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context , index) => buildSomeonePostItem(context),
                      separatorBuilder: (context , index) => SizedBox(height: 10,),
                      itemCount: 1
                  ),
                  SizedBox(height: 15,)
                ],
              ),
            ),
          ),
          fallback: (context) => Scaffold(body: Center(child: CircularProgressIndicator(color: buttonsColor,),)),
        );
      } ,
    );
  }
}
Widget buildSomeonePostItem(context) => Padding(
  padding: const EdgeInsets.all(8.0),
  child: Card(
    // Set the shape of the card using a rounded rectangle border with a 8 pixel radius
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    // Set the clip behavior of the card
    clipBehavior: Clip.antiAliasWithSaveLayer,
    // Define the child widgets of the card
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Display an image at the top of the card that fills the width of the card and has a height of 160 pixels
        Image.network(
          "https://macidp.com/wp-content/uploads/2023/09/%D8%A7%D9%84%D8%AA%D8%B1%D9%8A%D8%A8%D8%AA%D9%83.webp",
          height: 160,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        // Add a container with padding that contains the card's title, text, and buttons
        Container(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Display the card's title using a font size of 24 and a dark grey color
              Text(
                "! وثيقة عبور جمركي جاهزة",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey[800],
                ),
              ),
              // Add a space between the title and the text
              Container(height: 10),
              // Display the card's text using a font size of 15 and a light grey color
              Text(
                "From: 15-10-2023\nTo:14-10-2024",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              // Add a row with two buttons spaced apart and aligned to the right side of the card
              Row(
                children: <Widget>[
                  // Add a spacer to push the buttons to the right side of the card
                  const Spacer(),
                  // Add a text button labeled "SHARE" with transparent foreground color and an accent color for the text
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.transparent,
                    ),
                    child: const Text(
                      "SHARE",
                      style: TextStyle(color: lightColor),
                    ),
                    onPressed: () {},
                  ),
                  // Add a text button labeled "EXPLORE" with transparent foreground color and an accent color for the text
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.transparent,
                    ),
                    child: const Text(
                      "EXPLORE",
                      style: TextStyle(color: lightColor),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
        // Add a small space between the card and the next widget
        Container(height: 5),
      ],
    ),
  ),
);

