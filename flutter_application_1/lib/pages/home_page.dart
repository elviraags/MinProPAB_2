import 'package:flutter/material.dart';
import '../models/reservasi.dart';
import '../services/supabase_service.dart';
import 'form_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final SupabaseService service = SupabaseService();
  List<Reservasi> dataReservasi = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final data = await service.getReservasi();
    setState(() {
      dataReservasi = data;
    });
  }

  void hapusData(int id) async {
    await service.hapusReservasi(id);
    loadData();
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    extendBodyBehindAppBar: true,

    appBar: AppBar(
      title: const Text(
        "SmileCare Dental",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,

      actions: [

        /// DARK MODE BUTTON
        IconButton(
          icon: const Icon(Icons.dark_mode),
          onPressed: () {
            // toggle theme nanti dipanggil disini
          },
        ),

        /// LOGOUT BUTTON
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () async {
            await Supabase.instance.client.auth.signOut();

            Navigator.pop(context);
          },
        ),

      ],
    ),

    body: Stack(
      children: [
          /// BACKGROUND IMAGE
          SizedBox.expand(
            child: Image.asset(
              "assets/dentalcare.jpg",
              fit: BoxFit.cover,
            ),
          ),

          /// DARK OVERLAY
          Container(
            color: Colors.black.withOpacity(0.5),
          ),

          /// CONTENT
          Padding(
            padding: const EdgeInsets.only(top: 120, bottom: 80),
            child: dataReservasi.isEmpty
                ? const Center(
                    child: Text(
                      "Belum ada reservasi",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: dataReservasi.length,
                    itemBuilder: (context, index) {
                      final reservasi = dataReservasi[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        color: Colors.white.withOpacity(0.9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          title: Text(reservasi.nama),
                          subtitle: Text(
                              "${reservasi.perawatan}\nTanggal: ${reservasi.tanggal}"),
                          isThreeLine: true,
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [

                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          FormPage(reservasi: reservasi),
                                    ),
                                  );
                                  loadData();
                                },
                              ),

                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () =>
                                    hapusData(reservasi.id!),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const FormPage(),
            ),
          );
          loadData();
        },
      ),
    );
  }
}