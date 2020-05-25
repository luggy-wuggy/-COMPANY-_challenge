import 'package:flutter/material.dart';
import '../model/global.dart';

 Widget tabHorizontalScroll() {
    return Container(
      height: 25,
      width: double.infinity,
      child: ListView.builder(
        itemCount: tabText.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 7),
            height: 10,
            width: 80,
            decoration: BoxDecoration(
                border: Border.all(width: 0.7, color: Colors.grey[400]),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey[100]),
            child: Center(
              child: Text(tabText[index]),
            ),
          );
        },
      ),
    );
  }