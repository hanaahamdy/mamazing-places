import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_clone/api/api_helper.dart';
import 'package:udemy_clone/bloc/states.dart';
import '../model/data_model.dart';
import '../travels/screens/bottom_nav_screen/bar.dart';
import '../travels/screens/bottom_nav_screen/home.dart';
import '../travels/screens/bottom_nav_screen/my_data.dart';
import '../travels/screens/bottom_nav_screen/search.dart';

class AppBloc extends Cubit<AppStates> {
  AppBloc() : super(IntialState());

  static AppBloc get(BuildContext context) {
    return BlocProvider.of(context);
  }

  List<Widget> screens = [HomePage(), BarPage(), SearchPage(), PersonPage()];
  List<BottomNavigationBarItem> nav_items = [
    BottomNavigationBarItem(
      label: "Home",
      icon: Icon(Icons.apps),
    ),
    BottomNavigationBarItem(
      label: "Bar",
      icon: Icon(Icons.bar_chart),
    ),
    BottomNavigationBarItem(
      label: "Home",
      icon: Icon(Icons.search),
    ),
    BottomNavigationBarItem(
      label: "Me",
      icon: Icon(Icons.person),
    ),
  ];
  int current_index = 0;

  void changeNav(int index) {
    current_index = index;
    emit(BottomNavState());
  }

  List AllData = [];
  List<DataModel> placesData = [];

 Future getDataFromApi() async {
    emit(GetDataLoadingState());
    await ApiHelper.getData(url: "getplaces")!.then((value) {
      emit(GetDataSuccessState());
      AllData = value.data;
      for (int i = 0; i < AllData.length; i++) {
        placesData.add(DataModel.fromJson(AllData[i]));
      }
      return placesData ;
    });
    print(placesData);
  }
  int star_rate=-1;
 void  starRate(index){
   star_rate=index;
   emit(starState());
 }
 int number_People=-1;
  void  peopleNumber(index){
    number_People=index;
    emit(starState());
  }
}
