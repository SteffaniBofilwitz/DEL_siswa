// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:lat_delete/screen_page/page_list_mahasiswa.dart';
//
// import '../api/api.dart';
// import '../model/model_list_mahasiwa.dart';
//
// class PageDetailMahasiswa extends StatefulWidget {
//   final Datum mahasiswa;
//   const PageDetailMahasiswa({super.key, required this.mahasiswa});
//
//   @override
//   State<PageDetailMahasiswa> createState() => _PageDetailMahasiswaState();
// }
//
// class _PageDetailMahasiswaState extends State<PageDetailMahasiswa> {
//
//   Future<void> deleteMahasiswa(int id) async {
//     try {
//       final response = await http.post(
//         Uri.parse(Api.DeleteMahasiswa),
//         body: {'id': id.toString()},
//       );
//
//       print('Response status: ${response.statusCode}');
//       print('Response body: ${response.body}');
//
//       if (response.statusCode == 200) {
//         final responseData = json.decode(response.body);
//         if (responseData['isSuccess']) {
//           print('Mahasiswa berhasil dihapus');
//           // fetchDataPegawai(); // Memuat ulang data setelah penghapusan
//
//           // Tampilkan dialog berhasil dihapus
//           showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: Text('Sukses'),
//                 content: Text('Mahasiswa berhasil dihapus'),
//                 actions: <Widget>[
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ListMahasiswaPage()));
//                     },
//                     child: Text('OK'),
//                   ),
//                 ],
//               );
//             },
//           );
//         } else {
//           // Mahasiswa gagal dihapus
//           print('Mahasiswa gagal dihapus');
//           showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: Text('Gagal'),
//                 content: Text('Gagal menghapus data mahasiswa.'),
//                 actions: <Widget>[
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: Text('OK'),
//                   ),
//                 ],
//               );
//             },
//           );
//         }
//       } else {
//         print('Error: Server responded with status code ${response.statusCode}');
//       }
//     } catch (error) {
//       print('Error: $error');
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Error'),
//             content: Text('Terjadi kesalahan saat menghapus data mahasiswa.'),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var mahasiswax = this.widget.mahasiswa;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('${mahasiswax.namaMahasiswa}', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.purple,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           children: [
//             SizedBox(height: 10),
//             Text(mahasiswax.email),
//             SizedBox(height: 10),
//             Center(
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   MaterialButton(
//                     onPressed: () {},
//                     textColor: Colors.white,
//                     child: Text('Edit Data'),
//                     color: Colors.purple,
//                   ),
//                   SizedBox(width: 10),
//                   MaterialButton(
//                     onPressed: () {
//                       showDeleteConfirmationDialog(int.parse(mahasiswax.id));
//                     },
//                     textColor: Colors.white,
//                     child: Text('Delete Data'),
//                     color: Colors.purple,
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> showDeleteConfirmationDialog(int id) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // User harus menekan tombol untuk keluar
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Konfirmasi Hapus'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[
//                 Text('Apakah Anda yakin ingin menghapus data mahasiswa id = $id ini?'),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text('Tidak'),
//               onPressed: () {
//                 Navigator.of(context).pop(); // Tutup dialog
//               },
//             ),
//             TextButton(
//               child: Text('Ya'),
//               onPressed: () {
//                 deleteMahasiswa(id);
//                 Navigator.of(context).pop(); // Tutup dialog
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
