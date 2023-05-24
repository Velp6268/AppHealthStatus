import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;

  const RoundedButton({
    Key? key,
    required this.buttonText,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.red, // Цвет фона кнопки
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Округленные края
        ),
      ),
      onPressed: onPressed, // Обработчик нажатия
      child: Text(
        buttonText,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}