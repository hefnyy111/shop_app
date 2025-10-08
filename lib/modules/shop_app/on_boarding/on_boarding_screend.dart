// modules/shop_app/on_boarding/on_boarding_screend.dart
import 'package:flutter/material.dart';
import 'package:shop_appp/shared/componentes/components.dart';
import 'package:shop_appp/modules/shop_app/login_register/login/login_screen.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({required this.image, required this.title, required this.body});
}

class OnBoardingScreend extends StatefulWidget {
  @override
  State<OnBoardingScreend> createState() => _OnBoardingScreendState();
}

class _OnBoardingScreendState extends State<OnBoardingScreend> {
  @override
  Widget build(BuildContext context) {
    var boardController = PageController();

//************************************** */ Boarding
    List<BoardingModel> boardingg = [
      BoardingModel(
        image: 'assets/assets1/images/shop1.jpg',
        title: '𝐘𝐨𝐮𝐫 𝐛𝐞𝐚𝐮𝐭𝐲 𝐬𝐭𝐚𝐫𝐭𝐬 𝐟𝐫𝐨𝐦 𝐡𝐞𝐫𝐞',
        body:
            'Discover a selection of cosmetics \n to highlight your natural beauty',
      ),
      BoardingModel(
        image: 'assets/assets1/images/shop22.jpg',
        title: '𝐆𝐫𝐞𝐚𝐭 𝐭𝐨𝐮𝐜𝐡',
        body: 'Luxury care products for healthy,\n radiant skin every day',
      ),
      BoardingModel(
        image: 'assets/assets1/images/shop3.jpg',
        title:
            '𝐄𝐯𝐞𝐫𝐲𝐭𝐡𝐢𝐧𝐠 𝐭𝐡𝐚𝐭 𝐢𝐬 𝐛𝐞𝐚𝐮𝐭𝐢𝐟𝐮𝐥\n 𝐢𝐧 𝐭𝐡𝐞 𝐰𝐨𝐫𝐥𝐝 𝐨𝐟 𝐛𝐞𝐚𝐮𝐭𝐲',
        body:
            'Discover carefully selected products to give\n you a touch of femininity and elegance every day',
      ),
    ];
//************************************** */

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
//************************************** */ PageView
          Expanded(
            child: PageView.builder(
              controller: boardController,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => Center(
                    child: buildBoardingItem( boardingg[index], boardingg, boardController,
                    ),
                  ),
              itemCount: boardingg.length,
            ),
          ),
//************************************** */ SizeBox
          SizedBox(height: 20),
//************************************** */ Browse & Sign in
    Row(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            child: MaterialButton(
              onPressed: () {},
              child: Text(
                'Brwose',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),

        Expanded(
          child: Container(
            width: double.infinity,
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(0),
            ),
            child: MaterialButton(
              onPressed: () {
                navigatorTo(context, login_screen());
              },
              child: Text(
                'Sign in',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),

              ),

            ),
          ),
        ),
      ],
    ),
//************************************** */
        ],
      ),
    );
  }
}

//************************************** */ BuildBoarding
Widget buildBoardingItem(
  BoardingModel model,
  dynamic boardingg,
  dynamic boardController,
) => Column(
  children: [
    SizedBox(height: 100.0),
    Image(image: AssetImage(
      model.image,
      )),

    SizedBox(height: 200.0),

    SmoothPageIndicator(
      controller: boardController,
      effect: ExpandingDotsEffect(
        dotColor: Colors.grey,
        dotHeight: 10.0,
        expansionFactor: 2,
        dotWidth: 10.0,
        spacing: 10.0,
        activeDotColor: Colors.white,
      ),
      count: boardingg.length,
    ),

    SizedBox(height: 40.0),
    Text(
      '${model.title}',
      textAlign: TextAlign.center,
      style: TextStyle(
        textBaseline: TextBaseline.ideographic,
        color: Colors.white,
        fontSize: 20.0,
      ),
    ),
    SizedBox(height: 15.0),
    Text(
      '${model.body}',
      textAlign: TextAlign.center,
      style: TextStyle(
        textBaseline: TextBaseline.ideographic,
        color: Colors.white,
        fontSize: 15.0,
      ),
    ),
    
  ],
);
//************************************** */