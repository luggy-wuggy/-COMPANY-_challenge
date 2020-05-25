import 'package:flutter/material.dart';
import '../model/global.dart';

Widget headDisplay() {
    return Container(
      height: 150,
      width: double.infinity,
      padding: EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your Auby for the day',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
              Icon(Icons.file_upload, color: highlightColor, size: 30)
            ],
          ),
          SizedBox(height: 10),
          Text(
            '05/23/2020',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 35,
                width: 120,
                decoration: BoxDecoration(
                    color: highlightColor,
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Center(
                  child: Text(
                    "Play all",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }