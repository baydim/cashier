import 'dart:ui';

import 'package:cashier/manage/listfilter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';

class Filte extends StatefulWidget {
  @override
  _FilteState createState() => _FilteState();
}

class _FilteState extends State<Filte> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        padding: EdgeInsets.all(15),
        height: 150,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          // border: Border.all(
          //   color: Colors.black,
          //   width: 3,
          // ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Text(
              "Filter barang",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ResponsiveGridRow(children: [
              for (var a in filters)
                ResponsiveGridCol(
                  xs: 4,
                  md: 4,
                  sm: 4,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          a,
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ]),
          ],
        ),
      ),
    );
  }
}
