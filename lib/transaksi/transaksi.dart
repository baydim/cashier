import 'package:cashier/controller/barangcontroller.dart';
import 'package:cashier/manage/formater.dart';
import 'package:cashier/transaksi/widget/listsearch.dart';
import 'package:cashier/transaksi/widget/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Transaksi extends StatefulWidget {
  @override
  _TransaksiState createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          "Cashier mobile",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: GetBuilder<Getbarang>(
        init: Getbarang(),
        builder: (val) {
          final a = val.beli;
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                for (var i = 0; i < val.beli.length; i++)
                  ListSearch(
                    kode: a[i]['kode'],
                    id: a[i]['id'],
                    nama: a[i]['nama'],
                    harga: a[i]['harga'],
                    stock: a[i]['jumlah'],
                    x: true,
                    i: i,
                    jumbel: a[i]['jumlahbeli'],
                  ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GetBuilder<Getbarang>(
            init: Getbarang(),
            builder: (val) {
              int b = 0;
              val.beli.forEach((item) {
                b += item['totharga'];
              });
              return Container(
                margin: EdgeInsets.only(left: 30),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          blurRadius: 5,
                          offset: Offset(0, 5))
                    ]),
                height: 40,
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Center(
                  child: Text(
                    uang.format(b),
                    style: TextStyle(
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
          FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              Get.to(
                Search(),
              );
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
