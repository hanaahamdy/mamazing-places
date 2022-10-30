import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_clone/bloc/bloc_page.dart';
import 'package:udemy_clone/bloc/states.dart';
import 'package:udemy_clone/model/data_model.dart';
import 'package:udemy_clone/travels/widgets/app_text/app_text.dart';
import 'package:udemy_clone/travels/widgets/app_text/large_text.dart';
import 'package:udemy_clone/travels/widgets/button/responsive_button.dart';

class DetailScreen extends StatelessWidget {

  int number_stars = 4;
  int is_selcted = -1;
  int star_selected = -1;
final DataModel model;

   DetailScreen({ required this.model});




  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.height;
    return BlocConsumer<AppBloc, AppStates>(
      builder: (context, state) {
        var cubit=AppBloc.get(context);
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Container(
                  height: screen_width * .5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage("http://mark.bslmeiyu.com/uploads/${model.image}"),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                  left: 10,
                  top: 50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),

                    ],
                  ),
                ),
                Positioned(
                    top: screen_width * .35,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LargeText(text: "${model.name}"),
                              LargeText(
                                text: "\$${model.price}",
                                color: Color(0xFF5d69b3),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Row(children: [
                              Icon(
                                Icons.location_on,
                                color: Color(0xFF5d69b3),
                              ),
                              AppText(
                                text: "${model.location}",
                                color: Color(0xFF5d69b3),
                              )
                            ]),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Row(
                              children: [
                                Wrap(
                                  children: List.generate(5, (index) {
                                    return InkWell(
                                      onTap: () {
                                        cubit.starRate(index);
                                      },
                                      child: Icon(
                                        Icons.star,
                                        color: index < model.stars
                                            ? Colors.yellow
                                            : Colors.grey,
                                        // color: star_selected==index? Colors.yellow:Colors.grey,
                                      ),
                                    );
                                  }),
                                ),
                                AppText(text: "(${model.stars})")
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: LargeText(
                              text: "people",
                              font_size: 20,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: AppText(
                              text: "number of people in your group",
                              color: Color(0xFF5d69b3),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Wrap(
                              children: List.generate(
                                  5,
                                  (index) => InkWell(
                                        onTap: () {
                                       cubit.peopleNumber(index);

                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: cubit.number_People== index
                                                  ? Colors.black54
                                                  : Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          margin: EdgeInsets.only(right: 10),
                                          padding: EdgeInsets.all(20),
                                          child: Text("${index + 1}"),
                                        ),
                                      )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 5),
                            child: LargeText(
                              text: "Description",
                              font_size: 20,
                            ),
                          ),
                          AppText(
                              text:
                                   "${model.description}"),
                          SizedBox(
                            height: 15,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  child: IconButton(
                                    onPressed: () {
                                      cubit.getDataFromApi();
                                    },
                                    icon: Icon(Icons.favorite_outline),
                                    splashColor: Colors.deepPurple,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Colors.grey)),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                ResponsiveButton(
                                  width: 260,
                                  text: "Book Trip Now",
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              topLeft: Radius.circular(25))),
                      width: double.infinity,
                      height: double.infinity,
                    ))
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
