import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:udemy_clone/bloc/bloc_page.dart';
import 'package:udemy_clone/travels/screens/bottom_nav_screen/bootom_nav_page.dart';
import 'package:udemy_clone/travels/widgets/app_text/app_text.dart';
import 'package:udemy_clone/travels/widgets/app_text/large_text.dart';

import '../../bloc/states.dart';
import '../widgets/button/responsive_button.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];
  PageController page_controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
        builder: (context, state) {
          return Scaffold(
              body: SafeArea(
            child: PageView.builder(
                controller: page_controller,
                scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    child: Container(
                      margin: EdgeInsets.only(top: 150, left: 20, right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LargeText(text: "Trips"),
                              AppText(
                                text: "Mountain",
                                font_size: 30,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .04,
                              ),
                              Container(
                                width: 250,
                                child: AppText(
                                    text:
                                        "Mountains hikes give you an incredible sense of freedom along with  endurance test"),
                              ),
                              SizedBox(
                                height: 20,
                              ),

                              GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavScreen()));},
                                    child: ResponsiveButton(
                                  width: 100,
                                )),

                            ],
                          ),
                          Spacer(),
                          SmoothPageIndicator(
                            axisDirection: Axis.vertical,
                            controller: page_controller,
                            count: 3,
                            effect: ExpandingDotsEffect(
                              dotHeight: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/${images[index]}"),
                          fit: BoxFit.cover),
                    ),
                    width: double.infinity,
                    height: double.infinity,
                  );
                }),
          ));
        },
        listener: (context, state) {});
  }
}
