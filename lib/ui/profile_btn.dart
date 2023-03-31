import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_status/Theme/app_colors.dart';
import 'package:health_status/resources/resources.dart';

class ProfileButton extends StatelessWidget {
  final String text;
  final String icon;
  final Function? onClick;

  const ProfileButton({Key? key, required this.icon, required this.text, required this.onClick,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        onClick!(icon, text),
      },

      child: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.42,
        ),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.mainGrey),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10)),
            color: AppColors.mainGrey),
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.05,
        child: Row(
          children: [

            Expanded(
              ///Отвечает за Иконку
              flex: 1,
              child: Container(

                child: Image(
                  image: AssetImage(icon),
                  height: MediaQuery.of(context).size.width * 0.075,
                ),
              ),
            ),

            Expanded(
              ///Отвечает за Название кнопки
                flex: 5,
                child: Container(
                  child: Text(text),
                )
            ),

            Expanded(
              ///Отвечает за стрелку
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
                  child: Image(
                    image: AssetImage(AppImages.pointer),
                    height: MediaQuery.of(context).size.height * 0.014,
                    width: MediaQuery.of(context).size.width * 0.014,
                  ),

                )
            ),

          ],
        ),
      ),


    );

  }
}