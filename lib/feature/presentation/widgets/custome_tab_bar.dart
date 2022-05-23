// ignore_for_file: prefer_const_constructors,  prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp_clone_app/feature/presentation/widgets/theme/style.dart';

class CustomeTabBar extends StatefulWidget {
  final int index;
  const CustomeTabBar({Key? key, required this.index}) : super(key: key);

  @override
  State<CustomeTabBar> createState() => _CustomeTabBarState();
}

class _CustomeTabBarState extends State<CustomeTabBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: primaryColor,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: Icon(Icons.camera_alt, color: Colors.white),
          ),
          Expanded(
            child: CustomTabBarButton(
              text: 'CHATS',
              textColor: widget.index == 1 ? textIconColor : textIconColorGray,
              borderColor:
                  widget.index == 1 ? textIconColor : Colors.transparent,
            ),
          ),
          Expanded(
            child: CustomTabBarButton(
              text: 'STATUS',
              textColor: widget.index == 2 ? textIconColor : textIconColorGray,
              borderColor:
                  widget.index == 2 ? textIconColor : Colors.transparent,
            ),
          ),
          Expanded(
            child: CustomTabBarButton(
              text: 'CALLS',
              textColor: widget.index == 3 ? textIconColor : textIconColorGray,
              borderColor:
                  widget.index == 3 ? textIconColor : Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTabBarButton extends StatelessWidget {
  final String text;
  final Color borderColor;
  final Color textColor;
  final double borderWidth;

  const CustomTabBarButton({
    Key? key,
    required this.text,
    required this.borderColor,
    required this.textColor,
    this.borderWidth = 3.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: borderColor, width: borderWidth),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }
}
