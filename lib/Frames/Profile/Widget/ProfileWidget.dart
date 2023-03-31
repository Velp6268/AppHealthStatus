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
          buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    // final i = Image.network(imagePath, loadingBuilder: (_, __,___)=> Container(color: Colors.green, height: 100, width: 100,),);
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: onClicked),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color)=> buildCircle(
    color: Colors.white,
    all: 3,
    child: buildCircle(
      color: color,
      all: 8,
      child: Icon(
        isEdit ? Icons.add_a_photo : Icons.edit,
        color: Colors.white,
        size: isEdit ? 18 : 15,
      ),
    ),
  );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
})=>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}