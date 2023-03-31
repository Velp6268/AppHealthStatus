import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

///Класс отвечающий за Поля в редактировании профиля

class TextFieldWidget extends StatefulWidget{
  final String label;
  final String text;
  final ValueChanged<String> onChanged;

  const TextFieldWidget({
    Key? key,
    required this.label,
    required this.text,
    required this.onChanged,
}) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget>{

  late final TextEditingController controller;
  @override
  void initState(){
    ///Инцилизируем контроллер
    super.initState();
    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose(){
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        widget.label,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.008),
      TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12)
          ),
        ),

      )
    ],
  );
}