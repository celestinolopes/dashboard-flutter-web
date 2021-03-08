import 'package:flutter/material.dart';

class Dashboardcard extends StatelessWidget {
  Dashboardcard(
      {@required this.color,
      @required this.icon,
      @required this.label,
      @required this.value});
  final Color color;
  final IconData icon;
  final String label;
  final int value;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 90,
        width: 250,
        margin: const EdgeInsets.only(top: 15, bottom: 15, right: 15),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset.zero)
        ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 90,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 30,
                ),
                color: color,
              ),
            ),
            SizedBox(
              width: 7,
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    value.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
