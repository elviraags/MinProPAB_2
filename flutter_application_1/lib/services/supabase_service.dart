import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/reservasi.dart';

class SupabaseService {

  final supabase = Supabase.instance.client;

  Future<List<Reservasi>> getReservasi() async {
    final data = await supabase
        .from('reservasi')
        .select();

    return data.map((e) => Reservasi.fromJson(e)).toList();
  }

  Future<void> tambahReservasi(Reservasi reservasi) async {
    await supabase
        .from('reservasi')
        .insert(reservasi.toJson());
  }

  Future<void> updateReservasi(Reservasi reservasi) async {
    await supabase
        .from('reservasi')
        .update(reservasi.toJson())
        .eq('id', reservasi.id!);
  }

  Future<void> hapusReservasi(int id) async {
    await supabase
        .from('reservasi')
        .delete()
        .eq('id', id);
  }
}

