// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:lat_delete/screen_page/page_detail_mahasiswa.dart';
//
// import '../model/model_list_mahasiwa.dart';
//
//
//
// class ListMahasiswaPage extends StatefulWidget {
//   const ListMahasiswaPage({super.key});
//
//   @override
//   State<ListMahasiswaPage> createState() => _ListMahasiswaPageState();
// }
//
// class _ListMahasiswaPageState extends State<ListMahasiswaPage> {
//
//   Future<List<Datum>?> getData() async{
//     try{
//       //localhost:8080/server_university/getData.php
//       //192.168.1.3
//       http.Response res = await http.get(Uri.parse
//         ('http://192.168.100.44/siswa/getData.php'));
//       return modelListMahasiswaFromJson(res.body).data;
//     }catch(e){
//       setState(() {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text(e.toString())));
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('List Mahasiswa',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.purple,
//       ),
//
//       body: FutureBuilder(
//         future: getData(),
//         builder: (BuildContext context, AsyncSnapshot<List<Datum>?> snapshot){
//           if(snapshot.hasData){
//             return ListView.builder(
//               itemCount: snapshot.data?.length ?? 0,
//               itemBuilder: (context, index){
//                 Datum? data = snapshot.data?[index];
//                 return Padding(padding: EdgeInsets.all(8),
//                   child: GestureDetector(
//                     onTap: (){
//                       //untuk detail page
//                       Navigator.push(context, MaterialPageRoute(builder: (context)
//                       => PageDetailMahasiswa(mahasiswa: data!)
//                       ));
//                     },
//                     child: Card(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//
//                             Divider(),
//                             Text('${data?.namaMahasiswa}', style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold
//                             ),),
//                             Text('${data?.namaSekolah}', style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 9,
//                                 fontWeight: FontWeight.bold
//                             ),),
//                             Text('${data?.email}', style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 9,
//                                 fontWeight: FontWeight.bold
//                             ),),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//           }else if (snapshot.hasError){
//             return Center(
//               child: Text(snapshot.error.toString()),
//             );
//           }else{
//             return const Center(
//                 child: CircularProgressIndicator(color: Colors.purple,)
//             );
//           }
//         },
//       ),
//     );
//   }
// }
