import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Status extends StatelessWidget {
  const Status({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        automaticallyImplyLeading: false,

        title: Text("Status",style: TextStyle(fontSize: 22, color: Colors.black87),

        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Status'),

            ],
          ),
        ),
      ),
    );
  }
}