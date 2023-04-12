import 'package:health_status/Architecture/IDataSourse.dart';
import 'package:health_status/Architecture/Result.dart';
import 'package:health_status/Architecture/auth/ILoginDataSource.dart';
import 'package:health_status/Architecture/auth/LoggedUserRepository.dart';
import 'package:health_status/Architecture/auth/UserSession.dart';
import 'package:health_status/Theme/app_colors.dart';
import 'package:health_status/resources/resources.dart';
import 'Architecture/DbMock.dart';
import 'main_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_status/Architecture/Repository.dart';
import 'package:health_status/Architecture/OldUser.dart';
import 'dart:convert';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final LoginRepository repository = LoginRepository(DbMock());
  await repository.init();

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
        '/':(context) =>Root(),
        '/main_screen_widget':(context) =>  MainScreenWidget(),
      },
    ),
  );
}


class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
 late final LoggedUserRepository userRepository;
  @override

  Widget build(BuildContext context) {

    void updateAuthState(OldUser user) {
      setState(() {
      });
    }
    UserSession.function = updateAuthState;

    if (UserSession.get() == null) {
      return  LoginView(); //replace to  LoginView
    }
    else {
      UserSession.get();
      return  MainScreenWidget(); //replace to AppView
    }
  }
}



class LoginView extends StatefulWidget {

  final LoginRepository repository = LoginRepository(DbMock());

   LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState(repository);

}


class _LoginViewState extends State<LoginView> {

  final LoginRepository repository;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String textError = "";
  void signIn(){
    var result = repository.login(_emailController.text.trim(), _passwordController.text.trim());
    if (result.isSuccess()){
      UserSession.set(result.data);
    }
    else{
      _showError(result.exception);
    }
  }

  _showError(String? exception){
    setState(() {
      textError = exception.toString();
    });
  }

  _LoginViewState(this.repository);
  @override
  Widget build(BuildContext context) {
final textError = this.textError;

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
                    child: Image.asset("images/loveIcon.png")
                ),),
            ),

            const Text('Вход в Life' , style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,), ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 0, left: 30, right: 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(textError , style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red), ),
              ),
            ),


            Container(

                width: MediaQuery.of(context).size.width * 0.87,
                height: 50,
                margin: EdgeInsets.only(top: 5, bottom: 0, left: 0, right: 0),
                padding: EdgeInsets.only(top: 0, bottom: 1, left:10, right: 0),
                decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.circular(7)
                ),

                child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Почта"
                      ),
                      controller: _emailController,
                    )
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

                      decoration: InputDecoration(

                          hintText: "Пароль",

                      ),
                      obscureText: true,


                      controller: _passwordController,

                    )
                )
            ),


            GestureDetector(
              onTap:(){
                signIn();
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
                    'Войти' , style: TextStyle(fontSize: 18,  ),
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
