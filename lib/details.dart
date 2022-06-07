import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/constant.dart';
import 'package:flutter_application_1/data.dart';
import 'package:flutter_application_1/functions.dart';

class Detail extends StatelessWidget {
  final Recipe recipe;
  Detail({required this.recipe});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 2,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Container(
          margin: EdgeInsets.only(left: 110),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/icons/cookbook.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextTitle_var1(recipe.title),
                  SubTitle_var1(recipe.description)
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 310,
              padding: EdgeInsets.only(left: 16),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextTitle_var1("Food Stats"),
                      SizedBox(
                        height: 16,
                      ),
                      Stats(recipe.stars, "Rating", "/5"),
                      SizedBox(
                        height: 16,
                      ),
                      Stats(recipe.protein, "Protein", "g"),
                      SizedBox(
                        height: 16,
                      ),
                      Stats(recipe.calories, "Calories", "KCal"),
                    ],
                  ),
                  Positioned(
                    top: 85,
                    right: 5,
                    child: Hero(
                      tag: recipe.image,
                      child: Container(
                        height: 210,
                        width: 210,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(recipe.image),
                          fit: BoxFit.fitHeight,
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 16,
                left: 16,
                bottom: 80,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //The Ingredients Column is Still Statis, you can make list of string of ingredients
                  //in Recipe Class, and add dynamicly to this column.
                  TextTitle_var1("Ingredients"),
                  SubTitle_var1("2 Table Spoon of oil"),
                  SubTitle_var1("2 Clove of Garlic"),
                  SubTitle_var1("2 Chili"),
                  SubTitle_var1("1 Pork Belly"),
                  SubTitle_var1("1/2 Table Spoon of salt"),
                  SubTitle_var1("1/4 Table Spoon of Pepper"),

                  SizedBox(
                    height: 16,
                  ),

                  //Same as the Ingredients Column, The Step by Steps is Still Statis,
                  //you can make list of string of step by steps in the Recipe Class,
                  // and then add dynamicly to this column.
                  TextTitle_var1("Step by Steps"),

                  SubTitle_var1("Step 1 :"),
                  SubTitle_var1("Cut the ingredients into litle piece"),

                  SubTitle_var1("Step 2 :"),
                  SubTitle_var1(
                      "Hot the oil on the Wok, Wait 5 minutes, and throw all the ingredients"),

                  SubTitle_var1("Step 3 :"),
                  SubTitle_var1(
                      "Stir until the aroma comes out, and then toss the rice"),

                  SubTitle_var1("Step 4 :"),
                  SubTitle_var1(
                      "Add some sauce and stir until it became golden brown"),

                  SubTitle_var1("Step 5 :"),
                  SubTitle_var1("Served onto the plate"),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.greenAccent,
        icon: Icon(
          Icons.play_circle_fill,
          color: Colors.white,
          size: 32,
        ),
        label: Text(
          "Wacth Video",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget Stats(double val, String title, String sub_title) {
    return Container(
      height: 60,
      width: 150,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [kboxShadow],
      ),
      child: Row(
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [kboxShadow],
            ),
            child: Center(
              child: Text(
                val.toString(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
            width: 7,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                sub_title,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[400]),
              ),
            ],
          )
        ],
      ),
    );
  }
}
