import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sistem_layanan_pencucian/services/firestore.dart';
import 'package:sistem_layanan_pencucian/status.dart';

class EditHalamanKendaraan extends StatefulWidget {
  const EditHalamanKendaraan(
      {Key? key,
      required this.docId,
      required this.nama_pelanggan,
      required this.noHp,
      required this.noPlat,
      required this.status,
      required this.total,
      required this.diskon,
      required this.layanan,
      required this.namaPegawai1,
      required this.namaPegawai2,
      required this.mulai,
      required this.selesai})
      : super(key: key);
  final String docId;
  final String nama_pelanggan;
  final String noHp;
  final String noPlat;
  final String status;
  final double total;
  final double diskon;
  final String layanan;
  final String namaPegawai1;
  final String namaPegawai2;
  final String mulai;
  final String selesai;

  @override
  _halamanKendaraan createState() => _halamanKendaraan();
}

// ignore: camel_case_types
class _halamanKendaraan extends State<EditHalamanKendaraan> {
  final FocusNode pelangganFocusNode = FocusNode();
  final FocusNode hpFocusNode = FocusNode();
  final FocusNode platFocusNode = FocusNode();
  final FocusNode statusFocusNode = FocusNode();
  final FocusNode totalFocusNode = FocusNode();
  final FocusNode diskonFocusNode = FocusNode();
  final FocusNode layananFocusNode = FocusNode();
  final FocusNode pegawai1FocusNode = FocusNode();
  final FocusNode pegawai2FocusNode = FocusNode();
  final FocusNode mulaiFocusNode = FocusNode();
  final FocusNode selesaiFocusNode = FocusNode();
  final FocusNode codeFocusNode = FocusNode();

  late TextEditingController timeCtl;
  late TextEditingController timeCtl2;
  late TextEditingController noPlat;
  late TextEditingController namaPelanggan;
  late TextEditingController noHp;
  late TextEditingController namaPegawai1;
  late TextEditingController namaPegawai2;
  late TextEditingController status;
  late TextEditingController diskon;
  late TextEditingController totalController;
  late TextEditingController code;

  FirestoreHelper fh = FirestoreHelper();
  bool _isProcessing = false;

  @override
  void initState() {
    code = TextEditingController(text: widget.docId);

    namaPelanggan = TextEditingController(
      text: widget.nama_pelanggan,
    );

    noHp = TextEditingController(
      text: widget.noHp,
    );
    noPlat = TextEditingController(
      text: widget.noPlat,
    );
    status = TextEditingController(
      text: widget.status,
    );
    namaPegawai1 = TextEditingController(
      text: widget.namaPegawai1,
    );
    namaPegawai2 = TextEditingController(
      text: widget.namaPegawai2,
    );
    timeCtl = TextEditingController(
      text: widget.mulai,
    );
    timeCtl2 = TextEditingController(
      text: widget.selesai,
    );
    totalController = TextEditingController(text: widget.total.toString());
    diskon = TextEditingController(text: widget.diskon.toString());
    super.initState();
  }

  // ignore: prefer_typing_uninitialized_variables
  var dropdownvalue;

  // List of items in our dropdown menu
  var items = [
    'Pilih Tipe Mobil',
    'Keluarga',
    'Off Road',
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
          "Cuci Mobil",
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(children: [
        Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('mobil')
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
                            labelText: 'Tipe Mobil',
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
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    focusNode: codeFocusNode,
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
                    focusNode: platFocusNode,
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
                    focusNode: pelangganFocusNode,
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
                    focusNode: hpFocusNode,
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
                    focusNode: pegawai1FocusNode,
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
                    focusNode: pegawai2FocusNode,
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
                    focusNode: mulaiFocusNode,
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
                    focusNode: selesaiFocusNode,
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
                    focusNode: statusFocusNode,
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
                    focusNode: diskonFocusNode,
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
                    focusNode: totalFocusNode,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    controller: totalController,
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
                      final double? price =
                          double.tryParse(totalController.text);
                      final double total = price! - (price * (discount!));
                      pelangganFocusNode.unfocus();
                      hpFocusNode.unfocus();
                      platFocusNode.unfocus();
                      statusFocusNode.unfocus();
                      codeFocusNode.unfocus();
                      layananFocusNode.unfocus();
                      pegawai1FocusNode.unfocus();
                      pegawai2FocusNode.unfocus();
                      mulaiFocusNode.unfocus();
                      selesaiFocusNode.unfocus();
                      totalFocusNode.unfocus();

                      await FirestoreHelper().updateTransaksi(
                          code: widget.docId,
                          namaPelanggan: namaPelanggan.text,
                          noHp: noHp.text,
                          status: status.text,
                          noPlat: noPlat.text,
                          noCucian: '',
                          total: total,
                          diskon: discount,
                          layanan: dropdownvalue,
                          mulai: timeCtl.text,
                          selesai: timeCtl2.text,
                          namaPegawai1: namaPegawai1.text,
                          namaPegawai2: namaPegawai2.text,
                          panjang: 0,
                          lebar: 0);

                      namaPelanggan.text = '';
                      noHp.text = '';
                      status.text = '';
                      noPlat.text = '';
                      timeCtl.text = '';
                      timeCtl2.text = '';
                      namaPegawai1.text = '';
                      namaPegawai2.text = '';
                      code.text = '';
                      diskon.text = '';
                      totalController.text = '';

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
      ]),
    );
  }
}
