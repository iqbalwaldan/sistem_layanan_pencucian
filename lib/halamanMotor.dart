import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sistem_layanan_pencucian/services/firestore.dart';
import 'package:sistem_layanan_pencucian/status.dart';

void main() => runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: HalamanMotor()));

class HalamanMotor extends StatefulWidget {
  const HalamanMotor({Key? key}) : super(key: key);

  @override
  _motor createState() => _motor();
}

class _motor extends State<HalamanMotor> {
  final TextEditingController timeCtl = TextEditingController();
  final TextEditingController timeCtl2 = TextEditingController();
  final noPlat = TextEditingController();
  final namaPelanggan = TextEditingController();
  final noHp = TextEditingController();
  final namaPegawai1 = TextEditingController();
  final namaPegawai2 = TextEditingController();
  final status = TextEditingController();
  final code = TextEditingController();
  final diskon = TextEditingController();
  final harga = TextEditingController();
  FirestoreHelper fh = FirestoreHelper();

  var dropdownvalue;

  // List of items in our dropdown menu
  var items = [
    'Pilih Tipe Motor',
    'Motor Kecil',
    'Motor > 250 CC',
  ];
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        title: const Text(
          "Cuci Motor",
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(children: [
        Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: <Widget>[
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('motor')
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return const CircularProgressIndicator();
                      } else {
                        List<DropdownMenuItem<String>> layanan = [];
                        for (int i = 0; i < snapshot.data!.docs.length; i++) {
                          DocumentSnapshot snap = snapshot.data!.docs[i];
                          layanan.add(
                            DropdownMenuItem(
                              child: Text(
                                snap['layanan'],
                              ),
                              value: snap['layanan'],
                            ),
                          );
                        }
                        return Container(
                          width: double.infinity,
                          margin: const EdgeInsets.all(8.0),
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              labelText: 'Tipe Motor',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                            items: layanan,
                            onChanged: (newValue) {
                              setState(() {
                                dropdownvalue = newValue;
                              });
                            },
                            value: dropdownvalue,
                          ),
                        );
                      }
                    },
                  ),
                  //   ],
                  // ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: code,
                      decoration: InputDecoration(
                        labelText: "Code",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Status tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: noPlat,
                      decoration: InputDecoration(
                        labelText: "No Plat Kendaraan",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'No Plat Kendaraan tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: namaPelanggan,
                      decoration: InputDecoration(
                        labelText: "Nama Pelanggan",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nama Pelanggan tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: noHp,
                      decoration: InputDecoration(
                        labelText: "No Handphone",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'No Handphone tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: namaPegawai1,
                      decoration: InputDecoration(
                        labelText: "Nama Pegawai 1",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nama Pegawai tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: namaPegawai2,
                      decoration: InputDecoration(
                        labelText: "Nama Pegawai 2",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nama Pegawai tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: timeCtl, // add this line.
                      decoration: InputDecoration(
                        labelText: 'Jam Mulai',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      onTap: () async {
                        TimeOfDay time = TimeOfDay.now();
                        FocusScope.of(context).requestFocus(new FocusNode());

                        TimeOfDay? picked = await showTimePicker(
                            context: context, initialTime: time);
                        if (picked != null && picked != time) {
                          timeCtl.text = picked.format(context);
                          setState(() {
                            time = picked;
                          });
                        }
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: timeCtl2, // add this line.
                      decoration: InputDecoration(
                        labelText: 'Jam Selesai',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      onTap: () async {
                        TimeOfDay time = TimeOfDay.now();
                        FocusScope.of(context).requestFocus(new FocusNode());

                        TimeOfDay? picked = await showTimePicker(
                            context: context, initialTime: time);
                        if (picked != null && picked != time) {
                          timeCtl2.text =
                              picked.format(context); // add this line.
                          setState(() {
                            time = picked;
                          });
                        }
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: status,
                      decoration: InputDecoration(
                        labelText: "Status",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Status tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      controller: diskon,
                      decoration: InputDecoration(
                        labelText: "Diskon",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return 'D tidak boleh kosong';
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      controller: harga,
                      decoration: InputDecoration(
                        labelText: "Harga",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return 'Status tidak boleh kosong';
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: const Text(
                        "Store",
                        style: TextStyle(
                          color: Color.fromARGB(240, 255, 255, 255),
                          fontSize: 20,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 133, 128, 126),
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onPressed: () async {
                        final double? discount = double.tryParse(diskon.text);
                        final double? price = double.tryParse(harga.text);
                        final double? total = price! - (price * (discount!));
                        await fh.createTransaksi(
                            code.text,
                            namaPelanggan.text,
                            noHp.text,
                            status.text,
                            noPlat.text,
                            '',
                            total,
                            discount,
                            dropdownvalue,
                            timeCtl.text,
                            timeCtl2.text,
                            namaPegawai1.text,
                            namaPegawai2.text,
                            0,
                            0);

                        code.text = '';
                        namaPelanggan.text = '';
                        noHp.text = '';
                        status.text = '';
                        noPlat.text = '';
                        timeCtl.text = '';
                        timeCtl2.text = '';
                        namaPegawai1.text = '';
                        namaPegawai2.text = '';

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Status(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
