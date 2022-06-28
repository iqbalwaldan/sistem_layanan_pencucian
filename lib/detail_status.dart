import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sistem_layanan_pencucian/print_page.dart';

class DetailStatus extends StatefulWidget {
  const DetailStatus({Key? key, required this.docId}) : super(key: key);
  final String? docId;
  @override
  State<DetailStatus> createState() => _DetailStatusState();
}

class _DetailStatusState extends State<DetailStatus> {
  CollectionReference transaksi =
      FirebaseFirestore.instance.collection('transaksi');
  Map<String, dynamic>? datas;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Detail Layanan',
            style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold)),
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: transaksi.doc(widget.docId).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            datas = data;
            return Stack(
              children: [
                SizedBox(
                  width: 800,
                  height: 400,
                  child: Center(
                    widthFactor: 20.0,
                    child: Container(
                      margin: const EdgeInsets.only(top: 30),
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Layanan Cuci ${data['layanan']}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: data['no_plat'] == ""
                                      ? Text(
                                          'No. Plat/No Antrian : ${data['no_cucian']}')
                                      : Text(
                                          'No. Plat/No Antrian : ${data['no_plat']}'),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child: data['panjang'] != 0
                                      ? Column(
                                          children: [
                                            Text(
                                                'Panjang : ${data['panjang']}'),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text('Lebar : ${data['lebar']}'),
                                          ],
                                        )
                                      : Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                        ),
                                ),
                                Text(
                                    'Nama Pelanggan : ${data['nama_pelanggan']}'),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('No. HP : ${data['no_hp']}'),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('Nama Pegawai 1 : ${data['pegawai1']}'),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('Nama Pegawai 2 : ${data['pegawai2']}'),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('Mulai : ${data['waktu_mulai']}'),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('Selesai : ${data['waktu_selesai']}'),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('Diskon : ${data['diskon']}'),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('Total Harga : ${data['total']}'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
            // Text(
            //     "Full Name: ${data['full_name']} ${data['last_name']}");
          }
          return const CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.print),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => PrintPage(data: datas)));
        },
      ),
    );
  }
}
