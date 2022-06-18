import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sistem_layanan_pencucian/services/firestore.dart';
import 'package:sistem_layanan_pencucian/status.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';

// void main() => runApp(const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HalamanKarpet(),
//       localizationsDelegates: [
//         GlobalWidgetsLocalizations.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       supportedLocales: [Locale('en', 'US')],
//     ));

class EditHalamanKarpet extends StatefulWidget {
  const EditHalamanKarpet(
      {Key? key,
      required this.docId,
      required this.nama_pelanggan,
      required this.noHp,
      required this.noCucian,
      required this.status,
      // required this.total,
      // required this.diskon,
      required this.layanan,
      required this.namaPegawai1,
      required this.namaPegawai2,
      required this.mulai,
      required this.selesai,
      required this.panjang,
      required this.lebar})
      : super(key: key);
  final String docId;
  final String nama_pelanggan;
  final String noHp;
  final String noCucian;
  final String status;
  // final String total;
  // final String diskon;
  final String layanan;
  final String namaPegawai1;
  final String namaPegawai2;
  final String mulai;
  final String selesai;
  final String panjang;
  final String lebar;
  @override
  _halamanEditKarpet createState() => _halamanEditKarpet();
}

class _halamanEditKarpet extends State<EditHalamanKarpet> {
  // final timeCtl = TextEditingController();
  // final timeCtl2 = TextEditingController();
  final noCucian = TextEditingController();
  final panjang = TextEditingController();
  final lebar = TextEditingController();
  final namaPelanggan = TextEditingController();
  final noHp = TextEditingController();
  final namaPegawai1 = TextEditingController();
  final namaPegawai2 = TextEditingController();
  final status = TextEditingController();
  final code = TextEditingController();
  var dropdownvalue;
  late TextEditingController _controllerIn;
  late TextEditingController _controllerOut;
  FirestoreHelper fh = FirestoreHelper();

  String _valueChangedIn = '';
  String _valueToValidateIn = '';
  String _valueSavedIn = '';
  String _valueChangedOut = '';
  String _valueToValidateOut = '';
  String _valueSavedOut = '';

  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = 'pt_BR';
    //_initialValue = DateTime.now().toString();
    _controllerIn = TextEditingController(text: DateTime.now().toString());
    _controllerOut = TextEditingController(text: DateTime.now().toString());

    _getValue();
  }

  Future<void> _getValue() async {
    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        //_initialValue = '2000-10-22 14:30';
        _controllerIn.text = '';
        _controllerOut.text = '';
      });
    });
  }

  // List of items in our dropdown menu
  var items = ['Pilih Tipe Karpet', 'Dasar', 'Masjid', 'Permadani', 'Tikar'];
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
          "Cuci Karpet",
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('layanan')
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
                              labelText: 'Tipe Karpet',
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
                      controller: noCucian,
                      decoration: InputDecoration(
                        labelText: "No Cucian",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'No Cucian tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: TextFormField(
                            controller: panjang,
                            decoration: InputDecoration(
                              labelText: "Panjang",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Panjang tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          flex: 5,
                          child: TextFormField(
                            controller: lebar,
                            decoration: InputDecoration(
                              labelText: "Lebar",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Lebar tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
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
                    margin: const EdgeInsets.all(8.0),
                    child: DateTimePicker(
                      type: DateTimePickerType.date,
                      dateMask: 'dd/MM/yyyy',
                      controller: _controllerIn,
                      //initialValue: _initialValue,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                      // icon: Icon(Icons.event),
                      decoration: InputDecoration(
                        labelText: "Tanggal Masuk",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      dateLabelText: 'Date',
                      locale: Locale('en'),
                      onChanged: (val) => setState(() => _valueChangedIn = val),
                      validator: (val) {
                        setState(() => _valueToValidateIn = val ?? '');
                        return null;
                      },
                      onSaved: (val) =>
                          setState(() => _valueSavedIn = val ?? ''),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    child: DateTimePicker(
                      type: DateTimePickerType.date,
                      dateMask: 'dd/MM/yyyy',
                      controller: _controllerOut,
                      //initialValue: _initialValue,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                      // icon: Icon(Icons.event),
                      decoration: InputDecoration(
                        labelText: "Tanggal Keluar",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      dateLabelText: 'Date',
                      locale: Locale('en'),
                      onChanged: (val) =>
                          setState(() => _valueChangedOut = val),
                      validator: (val) {
                        setState(() => _valueToValidateOut = val ?? '');
                        return null;
                      },
                      onSaved: (val) =>
                          setState(() => _valueSavedOut = val ?? ''),
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
                      onPressed: () {
                        fh.createTransaksi(
                            code.text,
                            namaPelanggan.text,
                            noHp.text,
                            status.text,
                            '',
                            noCucian.text,
                            0,
                            0,
                            dropdownvalue,
                            _controllerIn.text,
                            _controllerOut.text,
                            namaPegawai1.text,
                            namaPegawai2.text,
                            0,
                            0);

                        code.text = '';
                        namaPelanggan.text = '';
                        noHp.text = '';
                        status.text = '';
                        noCucian.text = '';
                        _controllerIn.text = '';
                        _controllerOut.text = '';
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
        ],
      ),
    );
  }
}
