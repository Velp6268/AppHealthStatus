import 'package:health_status/Theme/app_colors.dart';

import 'main_screen_widget.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.mainGrey

        ),


      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainGrey,
          selectedItemColor: AppColors.iconColor,


        ),
      ),
      routes:{
        '/':(context) => const Main(),
        '/main_screen_widget':(context) => const MainScreenWidget(),
      },
    ),
  );
}

class Main extends StatelessWidget{
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Main Page'),
              TextButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: (){
                  Navigator.pushNamed(context, '/main_screen_widget');
                },
                icon: const Icon(Icons.settings),
                label: const Text('Перейти в Статус Здоровья'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
