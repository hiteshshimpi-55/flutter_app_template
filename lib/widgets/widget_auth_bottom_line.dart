import 'package:flutter/material.dart';

class WidgetAuthBottomLine extends StatelessWidget {
  final String title;
  final String actionText;
  final Function onPressed;
  const WidgetAuthBottomLine(
      {Key? key,
      required this.title,
      required this.actionText,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: "Inter",
                color: Colors.black,
              ),
            ),
            TextButton(
              onPressed: () {
                onPressed();
              },
              child: Text(
                actionText,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Inter",
                  color: Color(0xff2e7e78),
                ),
              ),
            )
          ]),
    );
  }
}
