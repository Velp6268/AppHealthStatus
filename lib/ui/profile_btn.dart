import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_status/Theme/app_colors.dart';
import 'package:health_status/resources/resources.dart';

class ProfileButton extends StatelessWidget {
  final String text;
  final String icon;
  final VoidCallback onClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                onTap: onClicked,
                child: Row(
                children: [
                  Expanded(
                    ///Отвечает за Иконку
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 12,
                        right: 12
                      ),
                      child: Image(
                        image: AssetImage(icon),
                      ),
                    ),
                  ),
                  Expanded(
                      ///Отвечает за Название кнопки
                      flex: 5,
                      child: Container(
                        child: Text(text),
                      )),
                  Expanded(

                      ///Отвечает за стрелку
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.05),
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 14.5,
                            bottom: 14.5
                          ),
                          child: Image(
                            image: AssetImage(AppImages.pointer),

                          ),
                        ),
                      )),
                ],
                ),
              ),
            ),
          );
  }

  const ProfileButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onClicked,
  }) : super(key: key);
}
