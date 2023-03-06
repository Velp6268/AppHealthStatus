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
                width: 350,
                height: 150,
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
                width: 325,
                height: 75,
                margin: EdgeInsets.fromLTRB(0, 90, 0, 0),
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
              Container(
                width: 280,
                height: 7,
                margin: EdgeInsets.only(top: 145, right: 0, left: 0, bottom: 0),
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.green,
                ),
              ),

                 const Positioned(
                   top: 190,
                     child: CircleAvatar(

                       backgroundImage: NetworkImage(
                           "https://cdn-icons-png.flaticon.com/512/4792/4792944.png"),
                  radius: 80,
                )),
              ///Текстовая плашка "Изменить здоровье"////////////
              Container(
                width: 350,
                height: 40,
                margin: EdgeInsets.only(top: 365, right: 0, left: 0, bottom: 0),
                padding:  EdgeInsets.only(top: 8, right: 15, left: 90, bottom: 0),
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
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
                  width: 350,
                  height: 400,
                  margin: EdgeInsets.only(top: 425, right: 0, left: 0, bottom: 20),

                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[350],
                  ),
                ),
                ///Кнопки состояния здоровья////////////////
                Column(
                  verticalDirection: VerticalDirection.up,
                  children: [
                    Container(
                      width: 330,
                      height: 60,
                      margin: EdgeInsets.only(top: 0, right: 0, left: 0, bottom: 30),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[400],
                      ),

                        child: Align(
                          alignment: Alignment.centerLeft,
                            child: TextButton(
                                style: ElevatedButton.styleFrom(backgroundColor: Color(
                                    0xA2A2A2)),

                                onPressed: () {  },
                                child:Text("Другой статус                            ",style: TextStyle (fontSize: 23,color: Colors.black,) ,  textDirection: TextDirection.ltr)

                            )
                        )


                    ),
                    Container(
                      width: 330,
                      height: 60,
                        margin: EdgeInsets.only(top: 0, right: 0, left: 0, bottom: 30),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[400],
                      ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                            child: TextButton(
                                style: ElevatedButton.styleFrom(backgroundColor: Color(
                                0xA2A2A2)),
                               onPressed: () {  },
                                child:Text("Я болен                                          ",style: TextStyle (fontSize: 23,color: Colors.black,) ,  textDirection: TextDirection.ltr)

                           )
                        )

                    ),
                    Container(

                      width: 330,
                      height: 60,
                        margin: EdgeInsets.only(top: 0, right: 0, left: 0, bottom: 25),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[400],
                      ),
                        child: Align(

                        alignment: Alignment.centerLeft,
                        child: TextButton(

                            style: ElevatedButton.styleFrom(backgroundColor: Color(
                                0xA2A2A2)),
                            onPressed: () {  },
                            child:Text("Я здоров                                     ",style: TextStyle (fontSize: 23,color: Colors.black,) ,  textDirection: TextDirection.ltr)

                        )
                    )
                    )
                  ],
                )
            ],

      ),














    );

  }
}