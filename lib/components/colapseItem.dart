import 'package:flutter/material.dart';

class ColaspeItem extends StatelessWidget {
  ColaspeItem({this.icon, this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 15,
          ),
          SizedBox(
            width: 6,
          ),
          Text(
            label,
            softWrap: false,
            maxLines: 2,
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
