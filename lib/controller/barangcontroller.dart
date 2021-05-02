import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Getbarang extends GetxController {
  CollectionReference dbbarang =
      FirebaseFirestore.instance.collection('barang');
  List barang = [];
  List temu = [];
  List beli = [];
  List sortgl = [];

  hapusbeliall() {
    beli.clear();
    update();
  }

  hapusbeli({int i}) {
    beli.removeAt(i);
    print(beli);
    update();
  }

  addbeli(
      {String kode,
      String nama,
      int harga,
      int jumlah,
      String id,
      int jumlahbeli,
      int tot}) {
    beli.add({
      'idb': id,
      'kode': kode,
      'nama': nama,
      'harga': harga,
      'jumlah': jumlah,
      'jumlahbeli': jumlahbeli,
      'totharga': tot,
    });
    temu.clear();
    Get.back();
    update();
  }

  cari({String cari}) async {
    temu = barang
        .where(
          (element) => element.toString().contains(
                cari.toLowerCase(),
              ),
        )
        .toList();
    update();
  }

  Stream<QuerySnapshot> getbarang() {
    barang.clear();
    dbbarang
        .orderBy('tgl', descending: true)
        .snapshots(includeMetadataChanges: true)
        .listen(
      (querySnapshot) {
        barang.clear();
        querySnapshot.docs.forEach(
          (res) {
            barang.add(
              {
                'id': res.id,
                'data': res.data(),
              },
            );
            update();
            // print(barang);
            // update();
          },
        );
        update();
      },
    );

    update();
  }

  addbarang({String bar, String nama, int harga, int jumlah}) async {
    await dbbarang.add({
      'bar': bar,
      'nama': nama,
      'harga': harga,
      'jumlah': jumlah,
      'tgl': DateTime.now(),
    });
    update();
  }

  editbarang({String id, String nama, int harga, int stock}) async {
    await dbbarang.doc(id).update({
      'nama': nama,
      'harga': harga,
      'jumlah': stock,
    });
    update();
  }

  deletbarang({String id, String nama}) async {
    await dbbarang.doc(id).delete();
    Get.rawSnackbar(
      margin: EdgeInsets.all(15),
      borderRadius: 15,
      backgroundColor: Colors.red,
      forwardAnimationCurve: Curves.elasticInOut,
      reverseAnimationCurve: Curves.elasticOut,
      messageText: Row(
        children: [
          Icon(
            Icons.delete_outline_rounded,
            color: Colors.white,
          ),
          Text(
            "$nama berhasil dihapus",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
    update();
  }
}
