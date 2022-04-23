import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(laporankeuangan());
}

class laporankeuangan extends StatefulWidget {
  laporankeuangan({Key? key}) : super(key: key);

  @override
  State<laporankeuangan> createState() => _laporankeuanganState();
}

class _laporankeuanganState extends State<laporankeuangan> {
  String dropdownvaluemonth = 'Pilih Bulan';

  String dropdownvalueyear = 'Pilih Tahun';

  // List of items in our dropdown menu
  var bulan = [
    'Pilih Bulan',
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ];

  var tahun = [
    'Pilih Tahun',
    '2020',
    '2021',
    '2022',
  ];

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
            "Laporan Keuangan",
            style: GoogleFonts.inter(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(8.0),
                        width: 200,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButtonFormField(
                                value: dropdownvaluemonth,
                                items: bulan.map((String bulan) {
                                  return DropdownMenuItem(
                                    value: bulan,
                                    child: Text(bulan),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvaluemonth = newValue!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(8.0),
                        width: 200,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButtonFormField(
                                value: dropdownvalueyear,
                                items: tahun.map((String tahun) {
                                  return DropdownMenuItem(
                                    value: tahun,
                                    child: Text(tahun),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvalueyear = newValue!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 100),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(25.0),
                        child: const Text("Laporan Keuangan Keseluruhan"),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(
                            left: 25, top: 8, right: 8, bottom: 8),
                        child: const Text("Layanan"),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(
                            left: 55, top: 8, right: 8, bottom: 8),
                        child: const Text("Mobil"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(
                                left: 77, top: 8, right: 8, bottom: 8),
                            child: const Text("Keluarga"),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            padding: const EdgeInsets.only(
                                left: 52, top: 8, right: 25, bottom: 8),
                            child: const Text("Rp.000"),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(
                                left: 77, top: 8, right: 8, bottom: 8),
                            child: const Text("Offroad"),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            padding: const EdgeInsets.only(
                                left: 52, top: 8, right: 25, bottom: 8),
                            child: const Text("Rp.000"),
                          )
                        ],
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(
                            left: 55, top: 8, right: 8, bottom: 8),
                        child: const Text("Motor"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(
                                left: 77, top: 8, right: 8, bottom: 8),
                            child: const Text("Kecil"),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            padding: const EdgeInsets.only(
                                left: 52, top: 8, right: 25, bottom: 8),
                            child: const Text("Rp.000"),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(
                                left: 77, top: 8, right: 8, bottom: 8),
                            child: const Text("> 250 CC"),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            padding: const EdgeInsets.only(
                                left: 52, top: 8, right: 25, bottom: 8),
                            child: const Text("Rp.000"),
                          )
                        ],
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(
                            left: 55, top: 8, right: 8, bottom: 8),
                        child: const Text("Karpet"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(
                                left: 77, top: 8, right: 8, bottom: 8),
                            child: const Text("Dasar"),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            padding: const EdgeInsets.only(
                                left: 52, top: 8, right: 25, bottom: 8),
                            child: const Text("Rp.000"),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(
                                left: 77, top: 8, right: 8, bottom: 8),
                            child: const Text("Masjid"),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            padding: const EdgeInsets.only(
                                left: 52, top: 8, right: 25, bottom: 8),
                            child: const Text("Rp.000"),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(
                                left: 77, top: 8, right: 8, bottom: 8),
                            child: const Text("Permadani"),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            padding: const EdgeInsets.only(
                                left: 52, top: 8, right: 25, bottom: 8),
                            child: const Text("Rp.000"),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(
                                left: 77, top: 8, right: 8, bottom: 8),
                            child: const Text("Tikar"),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            padding: const EdgeInsets.only(
                                left: 52, top: 8, right: 25, bottom: 8),
                            child: const Text("Rp.000"),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(
                                left: 55, top: 8, right: 8, bottom: 25),
                            child: const Text("Total Pendapatan"),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            padding: const EdgeInsets.only(
                                left: 52, top: 8, right: 25, bottom: 8),
                            child: const Text("Rp.000"),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          tooltip: 'Print',
          child: const Icon(Icons.print),
          backgroundColor: const Color(0xFFA87C4F),
        ),
      ),
    );
  }
}
