# SmileCare Dental

**Deskripsi Aplikasi**

SmileCare Dental adalah aplikasi reservasi klinik gigi yang memungkinkan pengguna untuk melakukan pemesanan jadwal perawatan gigi guna mempermudah dan mempercepat proses bagi pengguna. Aplikasi ini dirancang dengan tampilan yang menarik untuk meningkatkan pengalaman pengguna dalam melakukan reservasi layanan dental.


**Fitur Aplikasi**

1. Menampilkan halaman utama (home page) dengan background gambar gambar klinik yang di buat dengan bantuan AI
2. Menampilkan daftar reservasi
3. Menambahkan reservasi baru
4. Form input data reservasi (nama, no telepon, jenis perawatan, dan tanggal reservasi).
5. Menampilkan pesan "Belum ada reservasi" jika data kosong
6. Dapat memperbarui data dan menghapus data (reservasi).
7. Login jika sudah memiliki akun.
8. Registrasi jika belum memiliki akun.
9. Light Mode dan Dark Mode


**Widget yang Digunakan**

**A. MaterialApp**

digunakan di main.drat, widget utama yang mengatur halaman awal, mengatur tema, routing dll.


**B. Scaffold**

Digunakan di HomePage dan FormPage, Kerangka dasar tampilan halaman, menyediakan AppBar, body, FloatingActionButton, Snackbar,dll.


**C. AppBar**

Menampilkan bar di bagian atas aplikasi, berisi judul halaman, bisa berisi tombol back, action, dll.

**D. Stack**

Menumpuk widget secara bertumpuk (layer), di aplikasi ini digunakan untuk, background gambar, overlay gelap, konten di atasnya.

**E. Image.asset**

Menampilkan gambar dari folder assets, boxFit.cover  gambar memenuhi layar.

**F. Container**

Memberi warna overlay gelap di atas background, bisa mengatur padding, margin, decoration, dll.

**G. SizedBox**

Memberi jarak antar widget (spacer), bisa mengatur lebar atau tinggi kosong.

**H. Padding**

Memberi jarak antara widget dan tepi

**I. ListView.builder**

Menampilkan daftar data secara dinamis, digunakan untuk menampilkan list reservasi.

**J. Card**

Membuat tampilan seperti kartu, memberi efek bayangan (elevation), digunakan untuk setiap data reservasi.

**K. ListTile**

Layout standar untuk list berisi: 

Title : nama pasien

subtitle : perawatan & tanggal

trailing : tombol edit & delete

ListTile(
  title: Text(...),
  subtitle: Text(...),
  trailing: Row(...)
)


**L. IconButton**

Tombol berbentuk icon, digunakan untuk edit data hapus data.

**M. FloatingActionButton**

Tombol bulat mengambang, digunakan untuk menambah reservasi baru.

**N. Navigator**

Berpindah halaman: digunakan saat tambah reservasi, edit reservasi.

**O. Form**

Mengelompokkan field input, digunakan untuk validasi form.

**P. TextFormField**

Input teks bisa divalidasi, digunakan untuk nama pasien, no telepon.


**Q. DropdownButtonFormField**

Dropdown pilihan, digunakan untuk memilih jenis perawatan.

**R. ElevatedButton**

Tombol aksi utama, digunakan untuk pilih tanggal, dan impan reservasi.


**S. showDatePicker**

Menampilkan popup kalender, digunakan untuk memilih tanggal reservasi.

**T. StatefulWidget vs StatelessWidget**

1. StatelessWidget (Tidak memiliki state data tidak berubah)

   class MyApp extends StatelessWidget

2. StatefulWidget (Memiliki state yang bisa berubah)

   class HomePage extends StatefulWidget
   
   class FormPage extends StatefulWidget

   Data reservasi bisa bertambah. Form bisa berubah isinya
   


## Tampilan Aplikasi

Saat membuka aplikasi, user diminta untuk login terlebih dahulu

![image alt](https://github.com/elviraags/MinProPAB_2/blob/cc17aebe4275bfe2de41c892ebac93228386a318/Cuplikan%20layar%202026-03-15%20131647.png)


Aplikasi juga memiliki fitur Light Mode dan Dark Mode

![image alt](https://github.com/elviraags/MinProPAB_2/blob/9b3502fefc12b44fae4c4a71bbc714e7cee4795b/Cuplikan%20layar%202026-03-15%20131655.png)


Jika belum memiliki akun, user diminta untuk registrasi terlebih dahulu, dengan memasukan email dan juga password

![image alt](https://github.com/elviraags/MinProPAB_2/blob/6851be1c4fbb8152ab8a84264e8035e5428b3ac6/Cuplikan%20layar%202026-03-15%20131723.png)


jika registrasi berhasil, maka akun akan masuk ke supabase

![image alt](https://github.com/elviraags/MinProPAB_2/blob/ba32fd67f343cc0bd4a285dd80a7d33176e2a58d/Cuplikan%20layar%202026-03-15%20133114.png)


jika registrasi berhasil, user kemudian login dengan akun yang sudah di buat sebelumnya

![image alt](https://github.com/elviraags/MinProPAB_2/blob/8d465fae966e605a9c842cba3bfe97717b068882/Cuplikan%20layar%202026-03-15%20131744.png)


Jika login berhasil, maka akan masuk ke halaman utama, disini user bisa melihat list registrasi dan menambah registrasi baru

![image alt](https://github.com/elviraags/MinProPAB_2/blob/0951b383757174931d66666e1d1489c0b6c6e21a/Cuplikan%20layar%202026-03-15%20131754.png)


Kemudian menambahkan registrasii baru

![image alt](https://github.com/elviraags/MinProPAB_2/blob/7d6af707769263683f4bc97c4788baac8eda7b5d/Cuplikan%20layar%202026-03-15%20131845.png)


Jika berhasil, maka registrasi akan muncul di halaman utama

![image alt](https://github.com/elviraags/MinProPAB_2/blob/9008e86f06918aea9170eff9a18983ec6e1f7803/Cuplikan%20layar%202026-03-15%20131858.png)


Kemudian akan tersimpan di supabase

![image alt](https://github.com/elviraags/MinProPAB_2/blob/9b7b6a5f5c4e51e09a760c85e332bfb7961a7eea/Cuplikan%20layar%202026-03-15%20131913.png)


Jika data salah, maka bisa di update

![image alt](https://github.com/elviraags/MinProPAB_2/blob/f2b232f68881d935a2c7a2a4de58483d51c865c9/Cuplikan%20layar%202026-03-15%20131934.png)


Dan data akan terupdate juga di supabase

![image alt](https://github.com/elviraags/MinProPAB_2/blob/1889ec1fd9231a8f66d512066da2044bbe3a7bb1/Cuplikan%20layar%202026-03-15%20131957.png)



