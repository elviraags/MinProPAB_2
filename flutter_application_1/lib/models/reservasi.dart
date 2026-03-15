class Reservasi {
  int? id;
  String nama;
  String telepon;
  String perawatan;
  String tanggal;

  Reservasi({
    this.id,
    required this.nama,
    required this.telepon,
    required this.perawatan,
    required this.tanggal,
  });

  factory Reservasi.fromJson(Map<String, dynamic> json) {
    return Reservasi(
      id: json['id'],
      nama: json['nama'],
      telepon: json['telepon'],
      perawatan: json['perawatan'],
      tanggal: json['tanggal'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'telepon': telepon,
      'perawatan': perawatan,
      'tanggal': tanggal,
    };
  }
}