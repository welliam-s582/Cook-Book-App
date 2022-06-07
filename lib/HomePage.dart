import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/functions.dart';
import 'package:flutter_application_1/data.dart';
import 'package:flutter_application_1/details.dart';
import 'package:flutter_application_1/constant.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _homePageState();
  }
}

class _homePageState extends State<HomePage> {
  List<bool> selectedOption = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 2,
        leading: Icon(
          Icons.sort,
          color: Colors.black,
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
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextTitle_var1("MyCookBook"),
                  SubTitle_var1("All kind of Recipes from around the world"),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TimeBar("Morning", "assets/icons/sunrise.png", 0),
                      SizedBox(
                        width: 8,
                      ),
                      TimeBar("Afternoon", "assets/icons/noon.png", 1),
                      SizedBox(
                        width: 8,
                      ),
                      TimeBar("Evening", "assets/icons/moon.png", 2),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  TextTitle_var2("Recent", false),
                  TextTitle_var2(" Food", true),
                ],
              ),
            ),
            Container(
              height: 350,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: RecentRecipes(),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  TextTitle_var2("Popular", false),
                  TextTitle_var2(" Food", true),
                ],
              ),
            ),
            Container(
              height: 350,
              child: PageView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: PopularRecipes(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget TimeBar(String val, String icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption.setAll(0, [false, false, false]);
          selectedOption[index] = !selectedOption[index];
        });
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: selectedOption[index] ? Colors.lightGreen : Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          boxShadow: [kboxShadow],
        ),
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: Image.asset(
                icon,
                color: selectedOption[index] ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              val,
              style: TextStyle(
                color: selectedOption[index] ? Colors.white : Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> RecentRecipes() {
    List<Widget> data = [];
    for (var i = 0; i < getRecentRecipe().length; i++) {
      data.add(RecipeBar(getRecentRecipe()[i], i));
    }
    return data;
  }

  Widget RecipeBar(Recipe val, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detail(recipe: val),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [kboxShadow],
        ),
        margin: EdgeInsets.only(
            left: index == 0 ? 16 : 0, right: 16, bottom: 16, top: 8),
        padding: EdgeInsets.all(16),
        width: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Hero(
                tag: val.image,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(val.image),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            MiniTextTitle(val.title),
            SubTitle_var2(val.description),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Digits(val.stars.toString() + "/5"),
                    Icon(
                      Icons.star,
                      color: Colors.yellow[700],
                    )
                  ],
                ),
                Icon(Icons.favorite_border)
              ],
            )
          ],
        ),
      ),
    );
  }

  List<Widget> PopularRecipes() {
    List<Widget> data = [];
    for (var i = 0; i < getPopularRecipe().length; i++) {
      data.add(PopularBar(getPopularRecipe()[i]));
    }
    return data;
  }

  Widget PopularBar(Recipe val) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detail(recipe: val),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [kboxShadow],
        ),
        child: Column(
          children: [
            SizedBox(
              height: 35,
            ),
            Container(
              height: 170,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(val.image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MiniTextTitle(val.title),
                    MiniSubTitle(val.description),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Digits(val.stars.toString() + "/5"),
                            Icon(
                              Icons.star,
                              color: Colors.yellow[700],
                            )
                          ],
                        ),
                        Icon(Icons.favorite_border)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
