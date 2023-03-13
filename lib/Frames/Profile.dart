import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_status/Theme/app_colors.dart';
import 'package:health_status/resources/resources.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "Профиль",
            style: TextStyle(fontSize: 22, color: Colors.black87),
          ),
          centerTitle: true,
        ),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            ContainerImage(context),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.18,
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.mainGrey),

                  ///Окружность краев Элемента списка
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  color: AppColors.mainGrey),
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.height * 0.18,
            ),
          ],
        ));
  }

  Container ContainerImage(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      child: const Image(
        fit: BoxFit.fill,
        image: AssetImage(AppImages.city),
      ),
    );
  }
}
