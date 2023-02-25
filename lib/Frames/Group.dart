import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Group extends StatelessWidget {
  const Group({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(

          automaticallyImplyLeading: false,

            title: Text("Group 32 D",style: TextStyle(fontSize: 22, color: Colors.black87),

            ),
          centerTitle: true,
        ),

        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Group'),
              ],
            ),
          ),
        ),
      );
  }
}