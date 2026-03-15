import 'package:flutter/material.dart';
import '../models/reservasi.dart';
import '../services/supabase_service.dart';

class FormPage extends StatefulWidget {

  final Reservasi? reservasi;

  const FormPage({super.key, this.reservasi});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  final _formKey = GlobalKey<FormState>();

  final namaController = TextEditingController();
  final teleponController = TextEditingController();

  final service = SupabaseService();

  String? selectedPerawatan;
  DateTime? selectedDate;

  final List<String> daftarPerawatan = [
    "Kontrol Behel",
    "Cabut Gigi",
    "Scalling Gigi",
    "Tambal Gigi",
    "Pasang Behel",
    "Perawatan Saluran Akar",
  ];

  @override
  void initState() {
    super.initState();

    if (widget.reservasi != null) {
      namaController.text = widget.reservasi!.nama;
      teleponController.text = widget.reservasi!.telepon;
      selectedPerawatan = widget.reservasi!.perawatan;
      selectedDate = DateTime.parse(widget.reservasi!.tanggal);
    }
  }

  Future<void> pilihTanggal() async {

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void simpanData() async {

    if (_formKey.currentState!.validate() && selectedDate != null) {

      final data = Reservasi(
        id: widget.reservasi?.id,
        nama: namaController.text,
        telepon: teleponController.text,
        perawatan: selectedPerawatan!,
        tanggal: selectedDate.toString(),
      );

      if (widget.reservasi == null) {
        await service.tambahReservasi(data);
      } else {
        await service.updateReservasi(data);
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(
            widget.reservasi == null ? "Tambah Reservasi" : "Edit Reservasi"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child: ListView(
            children: [

              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(
                  labelText: "Nama Pasien",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Nama tidak boleh kosong" : null,
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: teleponController,
                decoration: const InputDecoration(
                  labelText: "No Telepon",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Nomor tidak boleh kosong" : null,
              ),

              const SizedBox(height: 15),

              DropdownButtonFormField<String>(
  value: selectedPerawatan,
  items: daftarPerawatan
      .map((item) => DropdownMenuItem(
            value: item,
            child: Text(item),
          ))
      .toList(),

  decoration: const InputDecoration(
    labelText: "Jenis Perawatan",
    border: OutlineInputBorder(),
  ),

  validator: (value) =>
      value == null ? "Pilih jenis perawatan" : null,

  onChanged: (value) {
    setState(() {
      selectedPerawatan = value;
    });
  },
),

              const SizedBox(height: 15),

              ElevatedButton(
                onPressed: pilihTanggal,
                child: Text(
                  selectedDate == null
                      ? "Pilih Tanggal"
                      : selectedDate.toString().split(' ')[0],
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: simpanData,
                child: const Text("Simpan Reservasi"),
              )
            ],
          ),
        ),
      ),
    );
  }
}







