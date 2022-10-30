import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_clone/bloc/bloc_page.dart';
import 'package:udemy_clone/bloc/states.dart';
import 'package:udemy_clone/travels/screens/detail_screen.dart';
import 'class_paint_custom_circle.dart';
import 'package:udemy_clone/travels/widgets/app_text/app_text.dart';

import '../../widgets/app_text/large_text.dart';

class HomePage extends StatelessWidget {
  List<String> listViewImages = [
    "balloning.png",
    "kayaking.png",
    "snorkling.png",
    "hiking.png"
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
        builder: (context, state) {
          var cubit = AppBloc.get(context);
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                leading: Icon(
                  Icons.menu,
                  color: Colors.black54,
                ),
                actions: [Image(image: AssetImage("images/home.png"))],
              ),
              body: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LargeText(text: "Discover"),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                          child: TabBar(
                              indicator: CustomCircle(
                                  color: Colors.deepPurple, raduis: 4),
                              indicatorSize: TabBarIndicatorSize.label,
                              labelPadding: EdgeInsets.only(right: 20),
                              labelColor: Colors.black,
                              unselectedLabelColor: Colors.grey,
                              isScrollable: true,
                              tabs: [
                                Tab(
                                  text: "places",
                                ),
                                Tab(
                                  text: "Inspirations",
                                ),
                                Tab(
                                  text: "Emotions",
                                ),
                              ])),
                    ),
                    Container(
                      height: 250,
                      child: TabBarView(
                        children: [
                          Container(
                            child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        right: 15, top: 10),
                                    child: GestureDetector(onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                              DetailScreen(model:cubit.placesData[index],)));
                                    },
                                      child: Container(
                                        height: 200,
                                        width: 180,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  "http://mark.bslmeiyu.com/uploads/${cubit
                                                      .placesData[index]
                                                      .image}",
                                                ),
                                                fit: BoxFit.cover),
                                            borderRadius:
                                            BorderRadius.circular(15)),
                                      ),
                                    ),
                                  );
                                },
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) {
                                  return SizedBox(child: Divider());
                                },
                                itemCount: cubit.placesData.length),
                          ),
                          Text("hi", style: TextStyle(fontSize: 30)),
                          Text("hi", style: TextStyle(fontSize: 30))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 18),
                      child: Row(
                        children: [
                          LargeText(
                            text: "Explore More",
                            font_size: 22,
                          ),
                          Spacer(),
                          AppText(
                            text: "See All",
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        height: 100,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: listViewImages.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Card(
                                      child: Image(
                                        image: AssetImage(
                                          "images/${listViewImages[index]}",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                    ),
                                    AppText(
                                        text:
                                        "${listViewImages[index].replaceAll(
                                            ".png", "")}")
                                  ],
                                ),
                              );
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
