
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_status/resources/resources.dart';

class Group extends StatelessWidget {
  const Group({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Группы",
            style: TextStyle(fontSize: 18, color: Colors.black87)),
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.only(top: 6),
            itemCount: 26,
            itemExtent: 60,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.fromLTRB(24, 8, 16, 0), ///отвечает за отступы///
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(236, 234, 234, 1)),
                      borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(10)),
                      color: const Color.fromRGBO(236, 234, 234, 1)),
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 5), ///меняем рассположение авы///
                      ),
                      Image(
                          image: AssetImage(AppImages.man),
                          width: 44,
                          height: 44,

                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
