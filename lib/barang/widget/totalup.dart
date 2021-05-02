import 'package:cashier/controller/barangcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TotalUp extends StatefulWidget {
  @override
  _TotalUpState createState() => _TotalUpState();
}

class _TotalUpState extends State<TotalUp> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Getbarang>(
      init: Getbarang(),
      builder: (val) {
        int b = 0;
        val.barang.forEach((item) {
          b += item['data']['jumlah'];
        });
        return Row(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jenis barang",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    val.barang.length.toString(),
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jumlah stock",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    b.toString(),
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
