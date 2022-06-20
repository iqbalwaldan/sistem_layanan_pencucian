import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/material.dart';

class PrintPage extends StatefulWidget {
  PrintPage({Key? key, required this.data}) : super(key: key);
  final List<Map<String, dynamic>> data;
  @override
  State<PrintPage> createState() => _PrintPageState();
}

class _PrintPageState extends State<PrintPage> {
  BluetoothPrint bluetoothPrint = BluetoothPrint.instance;
  List<BluetoothDevice> _devices = [];
  String _deviceMsg = "";
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => {initPrinter()});
  }

  Future<void> initPrinter() async {
    bluetoothPrint.startScan(timeout: Duration(seconds: 2));

    if (!mounted) return;
    bluetoothPrint.scanResults.listen((val) {
      if (!mounted) return;
      setState(() {
        _devices = val;
      });
      if (_devices.isEmpty) {
        setState(() {
          _deviceMsg = "No Devices";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Select Printer')),
        body: _devices.isEmpty
            ? Center(
                child: Text(_deviceMsg),
              )
            : ListView.builder(
                itemCount: _devices.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.print),
                    title: Text(_devices[index].name!),
                    subtitle: Text(_devices[index].address!),
                    onTap: () {
                      startPrint(_devices[index]);
                    },
                  );
                }));
  }

  Future<void> startPrint(BluetoothDevice device) async {
    if (device != null && device.address != null) {
      await bluetoothPrint.connect(device);

      Map<String, dynamic> config = Map();
      List<LineText> list = [];

      list.add(
        LineText(
            type: LineText.TYPE_TEXT,
            content: "Layanan Pencucian",
            weight: 2,
            width: 2,
            height: 2,
            align: LineText.ALIGN_CENTER,
            linefeed: 1),
      );

      for (var i = 0; i < widget.data.length; i++) {
        list.add(
          LineText(
              type: LineText.TYPE_TEXT,
              content: widget.data[i]['layanan'],
              weight: 2,
              width: 2,
              height: 2,
              align: LineText.ALIGN_LEFT,
              linefeed: 1),
        );

        list.add(
          LineText(
              type: LineText.TYPE_TEXT,
              content: widget.data[i]['no_cucian'],
              weight: 2,
              width: 2,
              height: 2,
              align: LineText.ALIGN_LEFT,
              linefeed: 1),
        );
        list.add(
          LineText(
              type: LineText.TYPE_TEXT,
              content: widget.data[i]['no_plat'],
              weight: 2,
              width: 2,
              height: 2,
              align: LineText.ALIGN_LEFT,
              linefeed: 1),
        );
        list.add(
          LineText(
              type: LineText.TYPE_TEXT,
              content: widget.data[i]['nama_pelanggan'],
              weight: 2,
              width: 2,
              height: 2,
              align: LineText.ALIGN_LEFT,
              linefeed: 1),
        );
        list.add(
          LineText(
              type: LineText.TYPE_TEXT,
              content: widget.data[i]['no_hp'],
              weight: 2,
              width: 2,
              height: 2,
              align: LineText.ALIGN_LEFT,
              linefeed: 1),
        );
        list.add(
          LineText(
              type: LineText.TYPE_TEXT,
              content: widget.data[i]['pegawai1'],
              weight: 2,
              width: 2,
              height: 2,
              align: LineText.ALIGN_LEFT,
              linefeed: 1),
        );
        list.add(
          LineText(
              type: LineText.TYPE_TEXT,
              content: widget.data[i]['pegawai2'],
              weight: 2,
              width: 2,
              height: 2,
              align: LineText.ALIGN_LEFT,
              linefeed: 1),
        );
        list.add(
          LineText(
              type: LineText.TYPE_TEXT,
              content: widget.data[i]['waktu_mulai'],
              weight: 2,
              width: 2,
              height: 2,
              align: LineText.ALIGN_LEFT,
              linefeed: 1),
        );
        list.add(
          LineText(
              type: LineText.TYPE_TEXT,
              content: widget.data[i]['waktu_selesai'],
              weight: 2,
              width: 2,
              height: 2,
              align: LineText.ALIGN_LEFT,
              linefeed: 1),
        );
        list.add(
          LineText(
              type: LineText.TYPE_TEXT,
              content: widget.data[i]['diskon'],
              weight: 2,
              width: 2,
              height: 2,
              align: LineText.ALIGN_LEFT,
              linefeed: 1),
        );
        list.add(
          LineText(
              type: LineText.TYPE_TEXT,
              content:
                  "${widget.data[i]['total'] - (widget.data[i]['total'] * widget.data[i]['diskon'])}",
              weight: 2,
              width: 2,
              height: 2,
              align: LineText.ALIGN_LEFT,
              linefeed: 1),
        );
      }
    }
  }
}
