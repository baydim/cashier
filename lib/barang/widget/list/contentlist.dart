import 'package:cashier/controller/barangcontroller.dart';
import 'package:cashier/manage/formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';

class Expa extends StatefulWidget {
  final String id;
  final String kode;
  final String nama;
  final int harga;
  final int stock;
  Expa({this.id, this.kode, this.nama, this.harga, this.stock});
  @override
  _ExpaState createState() => _ExpaState();
}

class _ExpaState extends State<Expa> {
  TextEditingController kode = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController harga = TextEditingController();
  TextEditingController stock = TextEditingController();
  bool ex = false;
  Getbarang b = Get.put(Getbarang());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actions: [
        IconSlideAction(
          caption: 'Hapus',
          color: Colors.transparent,
          icon: Icons.delete_outline_rounded,
          foregroundColor: Colors.black,
          onTap: () {
            b.deletbarang(id: widget.id, nama: widget.nama);
          },
        ),
      ],
      secondaryActions: [
        IconSlideAction(
          caption: 'Hapus',
          color: Colors.transparent,
          icon: Icons.delete_outline_rounded,
          foregroundColor: Colors.black,
          onTap: () {
            b.deletbarang(id: widget.id, nama: widget.nama);
          },
        ),
      ],

      // actionExtentRatio: 0.25,
      child: Theme(
        data: ThemeData(fontFamily: 'm').copyWith(
          dividerColor: Colors.transparent,
          accentColor: Colors.black,
          focusColor: Colors.black,
          primaryColor: Colors.black,
        ),
        child: ExpansionTile(
          tilePadding: EdgeInsets.fromLTRB(15, 15, 15, 15),
          backgroundColor: Colors.white,
          leading: Container(
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.nama,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: ex ? Colors.black : Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    uang.format(widget.harga),
                    style: TextStyle(
                      fontSize: 13,
                      color: ex
                          ? Colors.black.withOpacity(0.6)
                          : Colors.black.withOpacity(0.6),
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5, 4, 5, 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: widget.stock <= 5 ? Colors.red : Colors.green,
                ),
                child: Text(
                  widget.stock.toString(),
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
              )
            ],
          ),
          trailing: RotatedBox(
            quarterTurns: !ex ? 0 : 45,
            child: Icon(Icons.chevron_right_rounded),
          ),
          children: [
            // Container(
            //   margin: EdgeInsets.all(10),
            //   width: 140,
            //   height: 140,
            //   decoration: BoxDecoration(
            //       color: Colors.white,
            //       shape: BoxShape.circle,
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.black26,
            //           blurRadius: 5,
            //         ),
            //       ]),
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(100),
            //     child: Image.asset(
            //       "assets/gula.jpg",
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    "Kode",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.only(left: 15, right: 15),
                  padding: EdgeInsets.only(left: 15, right: 15, bottom: 1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200,
                  ),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    cursorColor: Colors.black,
                    style: TextStyle(
                      fontSize: 13,
                    ),
                    controller: kode,
                    decoration: InputDecoration(
                      hintText: "Kode",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    "Nama",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.only(left: 15, right: 15),
                  padding: EdgeInsets.only(left: 15, right: 15, bottom: 1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200,
                  ),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    cursorColor: Colors.black,
                    style: TextStyle(
                      fontSize: 13,
                    ),
                    controller: nama,
                    decoration: InputDecoration(
                      hintText: "Nama",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            ResponsiveGridRow(children: [
              ResponsiveGridCol(
                xs: 6,
                md: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        "Harga",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      margin: EdgeInsets.only(left: 15, right: 7.5),
                      padding: EdgeInsets.only(left: 15, right: 15, bottom: 1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade200,
                      ),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {});
                        },
                        cursorColor: Colors.black,
                        style: TextStyle(
                          fontSize: 13,
                        ),
                        controller: harga,
                        decoration: InputDecoration(
                          hintText: "Harga",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ResponsiveGridCol(
                xs: 6,
                md: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        "Jumlah",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      margin: EdgeInsets.only(left: 7.5, right: 15),
                      padding: EdgeInsets.only(left: 15, right: 15, bottom: 1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade200,
                      ),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {});
                        },
                        cursorColor: Colors.black,
                        style: TextStyle(
                          fontSize: 13,
                        ),
                        controller: stock,
                        decoration: InputDecoration(
                          hintText: "Jumlah",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  b.editbarang(
                    id: widget.id,
                    nama: nama.text,
                    harga: int.tryParse(harga.text),
                    stock: int.tryParse(stock.text),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  height: 40,
                  width: Get.width / 3,
                  decoration: BoxDecoration(
                    color: nama.text.length <= 0 ||
                            harga.text.length <= 0 ||
                            stock.text.length <= 0 ||
                            nama.text == widget.nama &&
                                harga.text == widget.harga.toString() &&
                                stock.text == widget.stock.toString()
                        ? Colors.grey.shade200
                        : Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text(
                    "Simpan",
                    style: TextStyle(
                      color: nama.text.length <= 0 ||
                              harga.text.length <= 0 ||
                              stock.text.length <= 0
                          ? Colors.grey
                          : Colors.white,
                      fontSize: 13,
                    ),
                  )),
                ),
              ),
            )
          ],
          onExpansionChanged: (value) {
            setState(() {
              if (value == false) {
                kode.text.length <= 0
                    ? kode.text = widget.kode
                    : kode.text = kode.text;
                nama.text.length <= 0
                    ? nama.text = widget.nama
                    : nama.text = nama.text;
                harga.text.length <= 0
                    ? harga.text = widget.harga.toString()
                    : harga.text = harga.text;
                stock.text.length <= 0
                    ? stock.text = widget.stock.toString()
                    : stock.text = stock.text;
              }
              if (value == true) {
                kode.text = widget.kode;
                nama.text = widget.nama;
                harga.text = widget.harga.toString();
                stock.text = widget.stock.toString();
              }
              ex = value;
            });
          },
        ),
      ),
    );
  }
}
