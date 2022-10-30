import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_clone/bloc/bloc_page.dart';
import 'package:udemy_clone/bloc/states.dart';

class BottomNavScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
        builder: (context, state) {
          AppBloc cubit = AppBloc.get(context);
            return Scaffold(
              backgroundColor: Colors.white,
              body: cubit.screens[cubit.current_index],
              bottomNavigationBar: BottomNavigationBar(
                elevation: 0,
                unselectedItemColor: Colors.grey[400],
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: Colors.black,
                onTap: (index) {
                  cubit.changeNav(index);
                },
                currentIndex: cubit.current_index,
                items: cubit.nav_items,
              ),
            );
          }
        ,
        listener: (context, state) {});
  }
}
