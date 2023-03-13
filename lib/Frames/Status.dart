import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Status extends StatelessWidget {
  const Status({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        automaticallyImplyLeading: false,

        title: Text("Статус",style: TextStyle(fontSize: 22, color: Colors.black87),

        ),
        centerTitle: true,

      ),

      body:  Container(
        height: 300,
        color: Color.fromARGB(2, 46, 1, 1),
        width: 400,
         child: Stack(

            children: [


            ],
          ),

      )
    );
  }
}