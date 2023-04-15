import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_status/Architecture/auth/LoggedUserRepository.dart';
import 'package:health_status/Architecture/auth/UserSession.dart';
import 'package:health_status/Architecture/groups/GroupRemoteDbMock.dart';
import 'package:health_status/Architecture/status/StatusRepository.dart';
import 'package:health_status/resources/resources.dart';
import '../ui/status_btn.dart';
import 'package:health_status/Architecture/Repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_status/Architecture/Repository.dart';
import 'package:health_status/Architecture/OldUser.dart';
import 'dart:convert';
import 'package:health_status/Architecture/DbMock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_status/Architecture/Repository.dart';

class Status2 extends StatefulWidget {
  final StatusRepository repository;
  const Status2({Key? key, required this.repository}) : super(key: key);

  @override
  State<Status2> createState() => _Status2State(repository);
}

class _Status2State extends State<Status2> {


  _Status2State(this.repository);

  final StatusRepository repository;

  String text = "Я здоров";
  Color? colorHealt = Colors.green;
  _changeStatus(Color color, String text){
    setState(() {

      this.colorHealt = color;
      this.text = text;
    });


  }



  @override
  Widget build(BuildContext context) {

    final id = UserSession.get()?.userId;
    final user = repository.getByUserId(id!);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Статус",style: TextStyle(fontSize: 18, color: Colors.black87),
        ),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        textDirection: TextDirection.ltr,
        children: <Widget>[
          Container(
            width: 450,
            height: 750,
            color: Colors.grey[100],
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.18,
              padding: EdgeInsets.only(top: 10, right: 10, left: MediaQuery.of(context).size.width*0.2, bottom: 0),
              margin: EdgeInsets.all(23),
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.grey[300],
              ),
              child:const Text(
                "Текущий статус:" ,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              )
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.09,
              margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.11, 0, 0),
              padding: EdgeInsets.only(top: 0, right: 0, left: 0, bottom: MediaQuery.of(context).size.height * 0.01),
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[350],
              ),

              child: Center(

                child: Text(
                  text ,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                  ),
                ),
              )
          ),
          ///Линия текущего статуса
          buildStatusContainer(context),

          Container(
            height: MediaQuery.of(context).size.height * 0.155,
            width: MediaQuery.of(context).size.height * 0.155,
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.23, bottom: 180, left: 0, right: 0),
            decoration:BoxDecoration(

              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.155,),
              color: Colors.grey[350],
            ),
              child: ClipOval(

                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image(
                      image: AssetImage(user?.imageName ?? "")
                  )
              ),
              ),
          ),
          ///Текстовая плашка "Изменить здоровье"////////////

          Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.85,
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.4, bottom: 150, left: 0, right: 0),

              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[350],
              ),
              child: Align(
                alignment: Alignment.center,
                  child:const Text(
                    "Изменить статус:" ,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  )
              )

          ),

          ///Задний фон кнопок состояний здоровья////////////
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.25,
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.47, right: 0, left: 0, bottom: MediaQuery.of(context).size.height * 0.01),
            padding:  EdgeInsets.only(top: 0 * 0.001, right: 0, left: 0, bottom: 0),
            decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[350],
            ),
            ///Кнопки состояния здоровья////////////////
            child:SingleChildScrollView(
                child:
                Column(
                  verticalDirection: VerticalDirection.up,
                  children: [
                    StatusButton(color: Colors.grey, text: "Другой статус", onClick: _changeStatus,  ),

                    Container(
                      height: 2,
                      width: 330,
                      color: Colors.black45,
                    ),
                    StatusButton(color: Colors.red, text: "Я болен", onClick: _changeStatus, ),
                    Container(
                      height: 2,
                      width: 330,
                      color: Colors.black45,
                    ),
                    StatusButton(color: Colors.green, text: "Я здоров", onClick: _changeStatus,),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Container buildStatusContainer(BuildContext context) {
    return Container(

          width: MediaQuery.of(context).size.width*0.7,
          height: 7,
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.17, right: 0, left: 0, bottom: 0),
          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: colorHealt,
          ),
        );
  }
}
