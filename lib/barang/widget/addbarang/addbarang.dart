import 'dart:ui';

import 'package:cashier/controller/barangcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class AddBaranG extends StatefulWidget {
  @override
  _AddBaranGState createState() => _AddBaranGState();
}

class _AddBaranGState extends State<AddBaranG> {
  TextEditingController kodebar = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController harga = TextEditingController();
  TextEditingController jumlah = TextEditingController();
  String barcode;
  Getbarang b = Get.put(Getbarang());

  _scan() async {
    barcode = await scanner.scan();
    setState(() {
      kodebar.text = barcode;
    });

    print(barcode);
  }

  Widget sc({String hint, TextEditingController c, TextInputType tp}) {
    return Container(
      height: 40,
      padding: EdgeInsets.only(left: 15, right: 0, bottom: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
      ),
      child: TextField(
        keyboardType: tp,
        onChanged: (value) {
          setState(() {});
        },
        cursorColor: Colors.black,
        style: TextStyle(
          fontSize: 13,
        ),
        controller: c,
        decoration: InputDecoration(
          suffixIcon: hint == "Kode"
              ? InkWell(
                  onTap: _scan,
                  child: Icon(Icons.qr_code_rounded),
                )
              : null,
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        height: Get.height / 2,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(top: 100),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Text(
              "Tambah barang",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            sc(hint: "Kode", c: kodebar, tp: TextInputType.text),
            SizedBox(
              height: 10,
            ),
            sc(hint: "Nama barang", c: nama, tp: TextInputType.text),
            SizedBox(
              height: 10,
            ),
            sc(hint: "Harga satuan", c: harga, tp: TextInputType.number),
            SizedBox(
              height: 10,
            ),
            sc(hint: "Jumlah", c: jumlah, tp: TextInputType.number),
            Spacer(),
            nama.text.length <= 0 ||
                    harga.text.length <= 0 ||
                    jumlah.text.length <= 0
                ? FloatingActionButton(
                    backgroundColor: Colors.grey.shade300,
                    foregroundColor: Colors.white,
                    onPressed: () {},
                    child: Icon(
                      Icons.save_outlined,
                      color: Colors.grey,
                    ),
                  )
                : FloatingActionButton(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    onPressed: () {
                      b.addbarang(
                        bar: kodebar.text,
                        nama: nama.text,
                        harga: int.tryParse(harga.text),
                        jumlah: int.tryParse(jumlah.text),
                      );
                      if (Get.isBottomSheetOpen) Get.back();
                    },
                    child: Icon(
                      Icons.save_outlined,
                      color: Colors.white,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
