import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class StatusButton extends StatefulWidget {
  final int idStatus;
  final String text;
  final Color color;
  final Function? onClick;

  const StatusButton({Key? key,required this.idStatus, required this.color, required this.text, required this.onClick,}) : super(key: key);

  @override
  _StatusButtonState createState() => _StatusButtonState();
}

class _StatusButtonState extends State<StatusButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
        widget.onClick!(widget.idStatus, widget.color, widget.text);
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: Material(
        color: _isPressed ? Colors.grey : Colors.transparent,
        borderRadius: BorderRadius.circular(11),
        child: InkWell(
          borderRadius: BorderRadius.circular(11),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.02,
                height: MediaQuery.of(context).size.height * 0.049,
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.009,
                  right: 0,
                  left: 7,
                  bottom: 12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: widget.color,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.07,
                margin: EdgeInsets.only(
                  top: 0,
                  right: 0,
                  left: 0,
                  bottom: MediaQuery.of(context).size.height * 0.01,
                ),
                padding: EdgeInsets.only(
                  top: 0,
                  right: 0,
                  left: 5,
                  bottom: 0,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              Container(
                height: 20,
                width: 20,
                child: Image.asset("images/pointer.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
