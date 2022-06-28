import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sistem_layanan_pencucian/detail_status.dart';
import 'package:sistem_layanan_pencucian/edit_page/edit_karpet.dart';
import 'package:sistem_layanan_pencucian/edit_page/edit_kendaraan.dart';

import 'edit_page/edit_motor.dart';

// void main() {
//   runApp(Status());
// }

class Status extends StatefulWidget {
  Status({Key? key}) : super(key: key);

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  final CollectionReference _transaksi =
      FirebaseFirestore.instance.collection('transaksi');

  // final CollectionReference _detail_transaksi =
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_outlined),
          ),
          toolbarHeight: 100,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Status",
            style: GoogleFonts.inter(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: StreamBuilder(
            stream: _transaksi.snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (!streamSnapshot.hasData) {
                return const CircularProgressIndicator();
              }
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  //   crossAxisCount: 2,
                  //   childAspectRatio: 1.5,
                  // ),
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot docSnap =
                        streamSnapshot.data!.docs[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 2.0,
                      margin: const EdgeInsets.only(
                          bottom: 15, left: 15, right: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueAccent,
                        ),
                        child: ListTile(
                          leading: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: const CircleAvatar(
                              backgroundColor: Colors.white,
                              child: const Icon(Icons.ad_units),
                            ),
                          ),
                          title: Text(
                            docSnap.id,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    docSnap['nama_pelanggan'],
                                    style: GoogleFonts.inter(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                  Text(
                                    docSnap['total'].toString(),
                                    style: GoogleFonts.inter(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                ]),
                          ),
                          trailing: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  child: const Icon(Icons.edit),
                                  onTap: () {
                                    switch (docSnap['layanan']) {
                                      case 'Mobil Keluarga':
                                      case 'Mobil Offroad':
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                EditHalamanKendaraan(
                                              docId: docSnap.id,
                                              nama_pelanggan:
                                                  docSnap['nama_pelanggan'],
                                              noHp: docSnap["no_hp"],
                                              noPlat: docSnap["no_plat"],
                                              status: docSnap["status"],
                                              total: docSnap["total"],
                                              diskon: docSnap["diskon"],
                                              layanan: docSnap["layanan"],
                                              namaPegawai1: docSnap["pegawai1"],
                                              namaPegawai2: docSnap["pegawai2"],
                                              mulai: docSnap["waktu_mulai"],
                                              selesai: docSnap["waktu_selesai"],
                                            ),
                                          ),
                                        );
                                        break;
                                      case 'Motor >250cc':
                                      case 'Motor Kecil':
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                EditHalamanMotor(
                                              docId: docSnap.id,
                                              nama_pelanggan:
                                                  docSnap['nama_pelanggan'],
                                              noHp: docSnap["no_hp"],
                                              noPlat: docSnap["no_plat"],
                                              status: docSnap["status"],
                                              total: docSnap["total"],
                                              diskon: docSnap["diskon"],
                                              layanan: docSnap["layanan"],
                                              namaPegawai1: docSnap["pegawai1"],
                                              namaPegawai2: docSnap["pegawai2"],
                                              mulai: docSnap["waktu_mulai"],
                                              selesai: docSnap["waktu_selesai"],
                                            ),
                                          ),
                                        );
                                        break;
                                      case 'Karpet Permadani':
                                      case 'Karpet Tikar':
                                      case 'Karpet Masjid':
                                      case 'Karpet Dasar':
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                EditHalamanKarpet(
                                              docId: docSnap.id,
                                              nama_pelanggan:
                                                  docSnap['nama_pelanggan'],
                                              noHp: docSnap["no_hp"],
                                              noCucian: docSnap["no_cucian"],
                                              status: docSnap["status"],
                                              total: docSnap["total"],
                                              diskon: docSnap["diskon"],
                                              layanan: docSnap["layanan"],
                                              namaPegawai1: docSnap["pegawai1"],
                                              namaPegawai2: docSnap["pegawai2"],
                                              mulai: docSnap["waktu_mulai"],
                                              selesai: docSnap["waktu_selesai"],
                                              panjang: docSnap["panjang"],
                                              lebar: docSnap["lebar"],
                                            ),
                                          ),
                                        );
                                        break;
                                    }
                                  },
                                ),
                                Text(
                                  docSnap['status'],
                                  style: GoogleFonts.inter(
                                      fontSize: 10, color: Colors.white),
                                ),
                              ],
                            ),
                          ),

                          // trailing: Wrap(
                          //   spacing: 12,
                          //   children: <Widget>[
                          //     IconButton(
                          //         onPressed: () async {
                          //           FirestoreHelper()
                          //               .deleteBab(docSnap.id);
                          //         },
                          //         icon: const Icon(Icons.delete),
                          //         color: Theme.of(context).errorColor),
                          //   ],
                          // ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  // return DetailStatus(noTransaksi: docSnap.id);
                                  return DetailStatus(
                                    docId: docSnap.id,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// class MyStatus extends StatelessWidget {
//   const MyStatus({
//     Key? key,
//     required this.nama,
//     required this.code,
//     required this.price,
//     required this.status,
//   }) : super(key: key);

//   final String nama;
//   final String code;
//   final String price;
//   final String status;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Card(
//         color: Colors.blue,
//         elevation: 2.0,
//         margin: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
//         child: ListTile(
//           leading: Container(
//             margin: const EdgeInsets.symmetric(vertical: 5),
//             child: const CircleAvatar(
//               backgroundColor: Colors.white,
//               child: const Icon(Icons.ad_units),
//             ),
//           ),
//           title: Container(
//             margin: const EdgeInsets.only(top: 5, bottom: 25),
//             child: Text(
//               code,
//               style: GoogleFonts.inter(
//                 fontSize: 14,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           subtitle: Container(
//             margin: const EdgeInsets.only(bottom: 5),
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Text(
//                 nama,
//                 style: GoogleFonts.inter(fontSize: 10, color: Colors.white),
//               ),
//               Text(
//                 price,
//                 style: GoogleFonts.inter(fontSize: 10, color: Colors.white),
//               ),
//             ]),
//           ),
//           trailing: Container(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 GestureDetector(
//                   child: const Icon(Icons.edit),
//                   onTap: () {
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (context) => const DetailStatus(),
//                     //   ),
//                     // );
//                   },
//                 ),
//                 Text(
//                   status,
//                   style: GoogleFonts.inter(fontSize: 10, color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
