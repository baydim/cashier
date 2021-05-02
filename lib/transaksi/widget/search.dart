import 'dart:ui';

import 'package:cashier/controller/barangcontroller.dart';
import 'package:cashier/transaksi/widget/listsearch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Getbarang b = Get.put(Getbarang());
  TextEditingController barang = TextEditingController();
  String barcode;
  _scan() async {
    barcode = await scanner.scan();
    setState(() {
      barang.text = barcode;
      b.cari(cari: barcode);
    });

    print(barcode);
  }

  Widget sc() {
    return Container(
      height: 40,
      padding: EdgeInsets.only(left: 15, right: 0, bottom: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
      ),
      child: TextField(
        onChanged: (value) {
          setState(() {
            b.cari(cari: value);
          });
        },
        cursorColor: Colors.black,
        style: TextStyle(
          fontSize: 13,
        ),
        controller: barang,
        decoration: InputDecoration(
          suffixIcon: InkWell(
              onTap: _scan,
              child: Icon(Icons.qr_code_outlined, color: Colors.black)),
          hintText: "Cari barang",
          border: InputBorder.none,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        b.temu.clear();

        Get.back();
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            shadowColor: Colors.transparent,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            title: sc(),
          ),
          body: SizedBox.expand(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  GetBuilder<Getbarang>(
                    init: Getbarang(),
                    builder: (val) {
                      return Column(
                        children: [
                          for (var a in val.temu)
                            ListSearch(
                              kode: a['data']['bar'],
                              id: a['id'],
                              nama: a['data']['nama'],
                              harga: a['data']['harga'],
                              stock: a['data']['jumlah'],
                              x: false,
                              i: 0,
                            ),
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
