import 'package:cashier/controller/transaksicontroller.dart';
import 'package:cashier/transaksi/widget/contenthis.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransaksiController>(
      init: TransaksiController(),
      builder: (val) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            shadowColor: Colors.black,
            elevation: 1,
            iconTheme: IconThemeData(color: Colors.black),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Center(
                  child: Text(
                    "History",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                for (var a in val.transaksi)
                  ContentHis(
                    a: a,
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
