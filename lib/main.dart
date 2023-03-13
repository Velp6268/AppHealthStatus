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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

              Padding(

                padding: const EdgeInsets.only(top: 116, bottom: 20 , left: 0, right: 0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child:SizedBox(
                    height: 75,
                    width: 75,
                    child: Image.asset("assets/images/Img_Love_Authorization.png",)
                ),),
              ),

            const Text('Вход в Life' , style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,), ),
            Container(
              width: MediaQuery.of(context).size.width * 0.87,
                height: 50,
                margin: EdgeInsets.only(top: 40, bottom: 0, left: 0, right: 0),
                padding: EdgeInsets.only(top: 0, bottom: 1, left:10, right: 0),
                decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.circular(7)
                ),

                child: Align(
                  alignment: Alignment.centerLeft,
                    child: TextFormField(initialValue: "Почта",)
                )
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.87,
                height: 50,
                margin: EdgeInsets.only(top: 20, bottom: 40, left: 0, right: 0),
                padding: EdgeInsets.only(top: 0, bottom: 1, left: 10, right: 0),
                decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.circular(7)
                ),

                child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      initialValue: "Пароль",
                    )
                )
            ),
            GestureDetector(
              onTap:(){
                    Navigator.pushNamed(context, '/main_screen_widget');
                      },
              child: Container(
                        width: 200,
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.circular(30)
                ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Войти' , style: TextStyle(fontSize: 18, ),
                    ),
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
