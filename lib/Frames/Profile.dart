import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        automaticallyImplyLeading: false,

        title: Text("Group 32 D",style: TextStyle(fontSize: 22, color: Colors.black87),

        ),
        centerTitle: true,
      ),
      body: Stack(
        alignment:  Alignment.topCenter,
        children: [

          const CircleAvatar(
            backgroundImage: AssetImage('images/pic.jpg'),
            radius: 100,
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.black45,
            ),
            child: const Text(
              'Лазарев Никита',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      )

    );

  }
}