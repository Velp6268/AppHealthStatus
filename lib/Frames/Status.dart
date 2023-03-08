import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Status extends StatelessWidget {
  const Status({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                padding: EdgeInsets.only(top: 10, right: 10, left: 100, bottom: 0),
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
                margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.53 * 0.18, 0, 0),
                  padding: EdgeInsets.only(top: 13, right: 15, left: 115, bottom: 0),
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[350],
                ),
                  child:const Text(
                    "Здоров" ,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                       ),
                  )
              ),
              ///Линия текущего статуса
              Container(
                width: 280,
                height: 7,
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.155, right: 0, left: 0, bottom: 0),
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.green,
                ),
              ),
                ///Аватарка
                Container(
                  height: MediaQuery.of(context).size.height * 0.155,
                  width: MediaQuery.of(context).size.height * 0.155,
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.22, bottom: 180, left: 0, right: 0),
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[350],
                  ),
                ),
              ///Текстовая плашка "Изменить здоровье"////////////

              Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.85,
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.4, bottom: 180, left: 0, right: 0),
                  padding: EdgeInsets.only(top: 6, bottom: 2, left: MediaQuery.of(context).size.width *0.25, right: 0),
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[350],
                  ),
                  child:const Text(
                    "Изменить статус:" ,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  )
              ),

              ///Задний фон кнопок состояний здоровья////////////
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.3,
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.48, right: 0, left: 0, bottom: MediaQuery.of(context).size.height * 0.01),
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[350],
                  ),
                ///Кнопки состояния здоровья////////////////
               child: Column(
                  verticalDirection: VerticalDirection.up,
                  children: [
                      Row(
                        
                       children:[
                         Container(
                           width: MediaQuery.of(context).size.width * 0.02,
                           height: MediaQuery.of(context).size.height * 0.049,
                           margin: EdgeInsets.only(top: 0, right: 0, left: 15, bottom: 12),
                           decoration:BoxDecoration(
                             borderRadius: BorderRadius.circular(11),
                             color: Colors.black45,
                           ),
                         ),
                         Container(
                             width: MediaQuery.of(context).size.width * 0.79,

                             height: MediaQuery.of(context).size.height * 0.07,
                            margin: EdgeInsets.only(top: 0, right: 0, left: 0,bottom: MediaQuery.of(context).size.height * 0.03),
                            padding: EdgeInsets.only(top: 0, right: 0, left: 2, bottom: 0),
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              color: Colors.grey[350],
                            ),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: TextButton(
                                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xA2A2A2),
                                    ),
                                    onPressed: () {  },
                                    child:Text("Другой статус                                >",style: TextStyle (fontSize: 20,color: Colors.black,) ,  textDirection: TextDirection.ltr)

                                )
                            )
                        )
                       ]
                      ),
                    Container(
                      width: 330,
                      height: 1,
                      color: Colors.black,
                      margin: EdgeInsets.only(top: 2, bottom: 5, left: 0, right: 0),
                    ),

                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.02,
                          height: MediaQuery.of(context).size.height * 0.049,
                          margin: EdgeInsets.only(top: 0, right: 0, left: 15, bottom: 12),
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            color: Colors.red,
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.79,
                            height: MediaQuery.of(context).size.height * 0.07,
                            margin: EdgeInsets.only(top: 0, right: 0, left: 0, bottom: MediaQuery.of(context).size.height * 0.003),
                            padding: EdgeInsets.only(top: 0, right: 0, left: 2, bottom: 0),
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              color: Colors.grey[350],
                            ),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: TextButton(
                                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xA2A2A2)),
                                    onPressed: () {  },
                                    child:Text("Я болен                                            >",style: TextStyle (fontSize: 20,color: Colors.black,) ,  textDirection: TextDirection.ltr)
                                )
                            )
                        ),
                      ],
                    ),
                    Container(
                      width: 330,
                      height: 1,
                      color: Colors.black,
                      margin: EdgeInsets.only(top: 2, bottom: 5, left: 0, right: 0),
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.02,
                          height: MediaQuery.of(context).size.height * 0.049,
                          margin: EdgeInsets.only(top: 0, right: 0, left: 15, bottom: 12),
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            color: Colors.green,
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.79,
                            height: MediaQuery.of(context).size.height * 0.08,
                            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.0009, right: 0, left: 0, bottom: MediaQuery.of(context).size.height * 0.007),
                            padding: EdgeInsets.only(top: 0, right: 0, left: 2, bottom: 0),
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              color: Colors.grey[350],
                            ),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: TextButton(
                                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xA2A2A2)),
                                    onPressed: () {  },
                                    child:Text("Я здоров                                            ",style: TextStyle (fontSize: 20,color: Colors.black,) ,  textDirection: TextDirection.ltr)
                                )
                            )
                        )
                      ],
                    ),
                  ],
                )
                ),
            ],
      ),
    );
  }
}