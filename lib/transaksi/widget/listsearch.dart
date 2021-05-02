import 'package:cashier/controller/barangcontroller.dart';
import 'package:cashier/manage/formater.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListSearch extends StatefulWidget {
  final String id;
  final String kode;
  final String nama;
  final int harga;
  final int stock;
  final bool x;
  final int i;
  final int jumbel;
  ListSearch(
      {this.id,
      this.kode,
      this.nama,
      this.harga,
      this.stock,
      this.x,
      this.i,
      this.jumbel});
  @override
  _ListSearchState createState() => _ListSearchState();
}

class _ListSearchState extends State<ListSearch> {
  final Getbarang b = Get.put(Getbarang());
  TextEditingController jumbel = TextEditingController();

  Widget by() {
    return Container(
      height: 40,
      padding: EdgeInsets.only(left: 15, right: 0, bottom: 1),
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        autofocus: true,
        onChanged: (value) {
          setState(() {});
        },
        cursorColor: Colors.black,
        style: TextStyle(
          fontSize: 13,
        ),
        controller: jumbel,
        decoration: InputDecoration(
          suffixIcon: InkWell(
              onTap: () {
                if (Get.isBottomSheetOpen) Get.back();

                b.addbeli(
                  id: widget.id,
                  kode: widget.kode,
                  nama: widget.nama,
                  harga: widget.harga,
                  jumlah: widget.stock,
                  jumlahbeli: int.tryParse(jumbel.text),
                  tot: widget.harga * int.tryParse(jumbel.text),
                );
              },
              child: Icon(Icons.send, color: Colors.black)),
          hintText: "Jumlah barang",
          border: InputBorder.none,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Icon(Icons.folder_open, color: Colors.black),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.nama,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  uang.format(widget.harga),
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black.withOpacity(0.6),
                  ),
                )
              ],
            ),
            Spacer(),
            Row(
              children: [
                widget.x
                    ? Container(
                        padding: EdgeInsets.fromLTRB(5, 4, 5, 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black),
                        child: Text(
                          widget.jumbel.toString(),
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                      )
                    : jumbel.text.length > 0
                        ? Container(
                            padding: EdgeInsets.fromLTRB(5, 4, 5, 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black),
                            child: Text(
                              jumbel.text,
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white),
                            ),
                          )
                        : SizedBox(
                            width: 0,
                            height: 0,
                          ),
                SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () {
                    if (widget.x) {
                      b.hapusbeli(i: widget.i);
                    } else {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      Get.bottomSheet(by());
                    }
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: widget.x ? Colors.red : Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Icon(
                        widget.x ? Icons.close : Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
