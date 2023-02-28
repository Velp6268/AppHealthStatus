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
        height: 700,
        color: Color.fromARGB(200, 46, 11, 11),
        width: 450,
         child: Stack(

            children: [
               Container(
                 height: 300,
                 width: 300,
                 color: Color.fromARGB(201, 33,222, 11),),
                 Container(
                  height: 100,
                  width: 200,
                  color: Color.fromARGB(201, 222, 11, 67),

                )



            ],
          ),

      )
    );
  }
}