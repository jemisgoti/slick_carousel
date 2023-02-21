import 'package:flutter/material.dart';

///Actiuon widget for the slick view
class ActionWidget extends StatelessWidget {
  ///initialize the widget
  const ActionWidget({required this.icon, super.key});

  ///icon of the widget
  final IconData icon;

  @override
  Widget build(BuildContext context) => Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.25),
            borderRadius: BorderRadius.circular(22.5)),
        child: Center(
            child: Icon(
          icon,
          size: 16,
        )),
      );
}
