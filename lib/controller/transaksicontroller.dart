import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class TransaksiController extends GetxController {
  List transaksi = [];
  CollectionReference dbtransaksi =
      FirebaseFirestore.instance.collection('transaksi');

  addtransaksi({var data, int bayar}) async {
    await dbtransaksi.add({
      'data': data,
      'bayar': bayar,
      'tgl': DateTime.now(),
    });

    update();
  }

  Stream<QuerySnapshot> gettransaksi() {
    transaksi.clear();
    dbtransaksi
        .orderBy('tgl', descending: true)
        .snapshots(includeMetadataChanges: true)
        .listen(
      (querySnapshot) {
        transaksi.clear();
        querySnapshot.docs.forEach(
          (res) {
            transaksi.add(
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
}
