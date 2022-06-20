import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FirestoreHelper {
  final CollectionReference _transaksi =
      FirebaseFirestore.instance.collection('transaksi');

  Future<void> createTransaksi(
      [String? code,
      namaPelanggan,
      noHp,
      status,
      String? noPlat,
      noCucian,
      double? total,
      double? diskon,
      String? layanan,
      String? mulai,
      selesai,
      namaPegawai1,
      namaPegawai2,
      int? panjang,
      lebar]) async {
    try {
      await _transaksi.doc(code).set(
        {
          "nama_pelanggan": namaPelanggan,
          "no_hp": noHp,
          "no_plat": noPlat,
          "no_cucian": noCucian,
          "status": status,
          "total": total,
          "diskon": diskon,
          "layanan": layanan,
          "pegawai1": namaPegawai1,
          "pegawai2": namaPegawai2,
          "waktu_mulai": mulai,
          "waktu_selesai": selesai,
          "panjang": panjang,
          "lebar": lebar,
        },
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateTransaksi(
      {required String code,
      namaPelanggan,
      noHp,
      status,
      noPlat,
      noCucian,
      // required int total,
      // diskon,
      required String layanan,
      mulai,
      selesai,
      namaPegawai1,
      namaPegawai2,
      required int panjang,
      lebar}) async {
    DocumentReference docRef = _transaksi.doc(code);
    Map<String, dynamic> data = <String, dynamic>{
      "nama_pelanggan": namaPelanggan,
      "no_hp": noHp,
      "no_plat": noPlat,
      "no_cucian": noCucian,
      "status": status,
      // "total": total,
      // "diskon": diskon,
      "layanan": layanan,
      "pegawai1": namaPegawai1,
      "pegawai2": namaPegawai2,
      "waktu_mulai": mulai,
      "waktu_selesai": selesai,
      "panjang": panjang,
      "lebar": lebar,
    };
    await docRef
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  // Future<void> createDetailTransaksi(
  //     [String? idTransaksi,
  //     String? layanan,
  //     String? mulai,
  //     selesai,
  //     namaPegawai1,
  //     namaPegawai2,
  //     int? panjang,
  //     lebar]) async {
  //   _transaksi.doc(idTransaksi).set({
  //     "layanan": layanan,
  //     "pegawai1": namaPegawai1,
  //     "pegawai2": namaPegawai2,
  //     "waktu_mulai": mulai,
  //     "waktu_selesai": selesai,
  //     "panjang": panjang,
  //     "lebar": lebar,
  //   });
  // }

  // Future<void> updateTransaksi(
  //     [DocumentSnapshot? documentSnapshot,
  //     String? namaPelanggan,
  //     noHp,
  //     status,
  //     String? noPlat,
  //     noCucian,
  //     int? total,
  //     int? diskon,
  //     String? layanan,
  //     String? mulai,
  //     selesai,
  //     namaPegawai1,
  //     namaPegawai2,
  //     int? panjang,
  //     lebar]) async {
  //   if (documentSnapshot != null) {
  //     namaPelanggan = documentSnapshot['nama_pelanggan'];
  //     noHp = documentSnapshot['no_hp'];
  //     noPlat = documentSnapshot['no_plat'];
  //     noCucian = documentSnapshot['no_cucian'];
  //     diskon = documentSnapshot['diskon'];
  //     total = documentSnapshot['total'];
  //     namaPegawai1 = documentSnapshot['nama_pegawai_1'];
  //     namaPegawai2 = documentSnapshot['nama_pegawai_2'];
  //     mulai = documentSnapshot['mulai'];
  //     selesai = documentSnapshot['selesai'];
  //     layanan = documentSnapshot['layanan'];
  //   }
  // }

  // Future<void> updateDetailTransaksi(
  //     [DocumentSnapshot? documentSnapshot,
  //     String? idTransaksi,
  //     String? layanan,
  //     String? mulai,
  //     selesai,
  //     namaPegawai1,
  //     namaPegawai2,
  //     int? panjang,
  //     lebar]) async {
  //   if (documentSnapshot != null) {
  //     idTransaksi = documentSnapshot['transaksi'];
  //     namaPegawai1 = documentSnapshot['nama_pegawai_1'];
  //     namaPegawai2 = documentSnapshot['nama_pegawai_2'];
  //     mulai = documentSnapshot['mulai'];
  //     selesai = documentSnapshot['selesai'];
  //     layanan = documentSnapshot['layanan'];
  //   }
  // }

  Future<void> deleteTransaksi(String babId) async {
    // await _detail_transaksi.doc(babId).delete();
    await _transaksi.doc(babId).delete();
  }

  // Future getDataTransaksi(String noTrans) async {
  //   List itemsList = [];

  //   try {
  //     await _transaksi.doc(noTrans).get().then((querySnapshot) {
  //       querySnapshot.data()((element) {
  //         itemsList.add(element.data);
  //       });
  //     });
  //     return itemsList;
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }
}
