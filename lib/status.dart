import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const status());
}

class status extends StatelessWidget {
  const status({Key? key}) : super(key: key);

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
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            body: ListView(
              children: const <Widget>[
                MyStatus(
                    code: "1",
                    nama: "Iqbal",
                    price: "Rp. 10.000",
                    status: "Proses"),
                MyStatus(
                    code: "2",
                    nama: "Thosin",
                    price: "Rp. 10.000",
                    status: "Proses"),
                MyStatus(
                    code: "3",
                    nama: "Afada",
                    price: "Rp. 10.000",
                    status: "Proses"),
              ],
            )));
  }
}

class MyStatus extends StatelessWidget {
  const MyStatus({
    Key? key,
    required this.nama,
    required this.code,
    required this.price,
    required this.status,
  }) : super(key: key);

  final String nama;
  final String code;
  final String price;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.blue,
        elevation: 2.0,
        margin: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
        child: ListTile(
          leading: Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.ad_units),
            ),
          ),
          title: Container(
            margin: EdgeInsets.only(top: 5, bottom: 25),
            child: Text(
              code,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
          subtitle: Container(
            margin: EdgeInsets.only(bottom: 5),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                nama,
                style: GoogleFonts.inter(fontSize: 10, color: Colors.white),
              ),
              Text(
                price,
                style: GoogleFonts.inter(fontSize: 10, color: Colors.white),
              ),
            ]),
          ),
          trailing: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Icon(Icons.edit),
                  onTap: () async {},
                ),
                Text(
                  status,
                  style: GoogleFonts.inter(fontSize: 10, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
