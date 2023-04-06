

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


///Класс отвечающий за аватарку в профиле

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    this.isEdit = false,
    required this.onClicked,
  }) : super (key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Container(

      padding: isEdit ? EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01) : EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.032),
      alignment: Alignment.topCenter,
      child: Stack(
        children: [


          buildImage(context),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color, context),
          ),
        ],
      ),
    );
  }


  Widget buildImage(BuildContext context) {
    final image = imagePath.contains('http://')
    ? NetworkImage(imagePath) : FileImage(File(imagePath));
    return SizedBox(
      width: MediaQuery.of(context).size.height * 0.15,
      height: MediaQuery.of(context).size.height * 0.15,
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: Ink.image(
            image: image as ImageProvider,
            fit: BoxFit.cover,
            child: InkWell(onTap: onClicked),
          ),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color, BuildContext context)=> buildCircle(
    context,
    color: Colors.white,
    all: 3,
    child: buildCircle(
      context,
          color: color,
          all: 1,
          child: Icon(
            isEdit ? Icons.add_a_photo : Icons.edit,
            color: Colors.white,
            size: MediaQuery.of(context).size.width * 0.04,
          ),

        ),
  );

  Widget buildCircle(BuildContext context,{
    required Widget child,
    required double all,
    required Color color,
})=>
      ClipOval(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.height * 0.045,
          height: MediaQuery.of(context).size.height * 0.045,
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}