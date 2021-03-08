import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.network(
            "https://random.dog/3f62f2c1-e0cb-4077-8cd9-1ca76bfe98d5.jpg",
            width: 50,
            height: 50,
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Celestino Lopes",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Icon(
                  Icons.circle,
                  color: Colors.green,
                  size: 9,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "Online",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}