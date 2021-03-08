import 'package:flutter/material.dart';

class CustomMenuIconButton extends StatelessWidget {
  const CustomMenuIconButton({
    Key key,
    this.icon,
    this.iconSize = 18,
    this.iconColor = Colors.white,
    this.title,
    this.titleStyle,
    this.onTap,
  }) : super(key: key);

  final IconData icon;
  final double iconSize;
  final Color iconColor;

  final String title;
  final TextStyle titleStyle;

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF1a2226),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: iconSize,
              color: iconColor,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              title,
              style: titleStyle ??
                  TextStyle(
                    color: Colors.grey[400],
                    fontSize: 13,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
