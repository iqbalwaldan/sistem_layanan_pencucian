import 'package:flutter/material.dart';
import 'package:sistem_layanan_pencucian/status.dart';

TextEditingController timeCtl = TextEditingController();
TextEditingController timeCtl2 = TextEditingController();

void main() => runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: halamanMobil()));

class halamanMobil extends StatefulWidget {
  const halamanMobil({Key? key}) : super(key: key);

  @override
  _halamanMobil createState() => _halamanMobil();
}

class _halamanMobil extends State<halamanMobil> {
  String dropdownvalue = 'Pilih Tipe Mobil';

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
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      labelText: 'Tipe Mobil',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    value: dropdownvalue,
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(8.0),
                  child: TextFormField(
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
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Status(),
                      ),
                    ),
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
