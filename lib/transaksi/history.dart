import 'package:cashier/controller/transaksicontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<TransaksiController>(
        init: TransaksiController(),
        builder: (val) {
          return SingleChildScrollView(
            child: Column(
              children: [
                for (var a in val.transaksi)
                  Text(
                    a.toString(),
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
