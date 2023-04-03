import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pospan/services/services.dart';
import 'package:pospan/views/tables/tabla_detalles.dart';

class OrdenesTable extends StatelessWidget {
  final Future<List<Map<String, dynamic>>> futureData;


  OrdenesTable({required this.futureData});

  @override
  Widget build(BuildContext context) {
    return Column( crossAxisAlignment: CrossAxisAlignment.end,
      children: [
 
  
        ElevatedButton(style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0), // Establece la forma cuadrada del botón
    ),
    primary: Colors.orange, // Establece el color naranja del botón
  ),
                onPressed: () {},
                child: Text("Actualizar",style: TextStyle(color: Colors.black)),
              ),
   
    
        FutureBuilder<List<Map<String, dynamic>>>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!;
              final stringData = data.map((item) => {
                    'id': item['id'].toString(),
                    'impuesto': item['impuesto'].toString(),
                    'subtotal': item['subtotal'].toString(),
                    'total': item['total'].toString(),
                  }).toList();

              return Column(
                children: [
                  DataTable(
                    columns: [
                      DataColumn(label: Text('ID')),
                      DataColumn(label: Text('Impuesto')),
                      DataColumn(label: Text('Subtotal')),
                      DataColumn(label: Text('Total')),
                       DataColumn(label: Text("Acciones")),
                    ],
                    rows: stringData.map((item) {
                      return DataRow(cells: [
                        DataCell(
                         Text(item['id']!),
                            
                          
                        ),
                        DataCell(Text(item['impuesto']!)),
                        DataCell(Text(item['subtotal']!)),
                        DataCell(Text(item['total']!)),
                        DataCell(ElevatedButton(style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0), // Establece la forma cuadrada del botón
    ),
    primary: Colors.orange, // Establece el color naranja del botón
  ),child: Text("Ver",style: TextStyle(color: Colors.black),),onPressed: () async {
                              final detallesData =
                                  await AppsSerices().getDetalles;
                              showDialog(
                                
                                context: context,
                                builder: (context) {
                                  return SingleChildScrollView(
                                    child: AlertDialog(
                                            content: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(16),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Orden #" + item["id"]!,
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 24,
                                                        ),
                                                      ),
                                                      IconButton(
                                                        icon: Icon(Icons.close),
                                                        color: Colors.red,
                                                        onPressed: () => Navigator.of(context).pop(),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  padding: EdgeInsets.all(16),
                                                  child: SingleChildScrollView(
                                                    child: DetallesTable(
                                                      futureData: AppsSerices().getDetalles(item['id']!),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                  );
                                },
                              );
                            },)),
                        
                      ]);
                    }).toList(),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }
}


//  import 'dart:convert';

// import 'package:flutter/material.dart';

// class OrdenesTable extends StatelessWidget {
//   final Future<List<Map<String, dynamic>>> futureData;

//   OrdenesTable({required this.futureData});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Map<String, dynamic>>>(
//       future: futureData,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           final data = snapshot.data!;
//           final stringData = data.map((item) => {
//             'id': item['id'].toString(),
//             'impuesto': item['impuesto'].toString(),
//             'subtotal': item['subtotal'].toString(),
//             'total': item['total'].toString(),
//           }).toList();

//           return DataTable(
//             columns: [
//               DataColumn(label: Text('ID')),
//               DataColumn(label: Text('Impuesto')),
//               DataColumn(label: Text('Subtotal')),
//               DataColumn(label: Text('Total')),
//             ],
//             rows: stringData.map((item) {
//               return DataRow(cells: [
//                 DataCell(Text(item['id']!)),
//                 DataCell(Text(item['impuesto']!)),
//                 DataCell(Text(item['subtotal']!)),
//                 DataCell(Text(item['total']!)),
//               ]);
//             }).toList(),
//           );
//         } else if (snapshot.hasError) {
//           return Text('${snapshot.error}');
//         } else {
//           return CircularProgressIndicator();
//         }
//       },
//     );
//   }
// }

// import 'dart:convert';

// import 'package:flutter/material.dart';

// class OrdenesTable extends StatelessWidget {
//   final Future<List<Map<String, dynamic>>> futureData;

//   OrdenesTable({required this.futureData});
//    @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Map<String, dynamic>>>(
//       future: futureData,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           final data = snapshot.data!;
//           final stringData = data.map((item) => {
//             'id': item['id'].toString(),
//             'impuesto': item['impuesto'].toString(),
//             'subtotal': item['subtotal'].toString(),
//             'total': item['total'].toString(),
//           }).toList();

//           return ListView.builder(
//             itemCount: stringData.length,
//             itemBuilder: (context, index) {
//               final item = stringData[index];

//               return  Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('ID: ${item['id']}'),
//                     SizedBox(height: 8),
//                     Text('Impuesto: ${item['impuesto']}'),
//                     SizedBox(height: 8),
//                     Text('Subtotal: ${item['subtotal']}'),
//                     SizedBox(height: 8),
//                     Text('Total: ${item['total']}'),
//                   ],
                
//               );
//             },
//           );
//         } else if (snapshot.hasError) {
//           return Text('${snapshot.error}');
//         } else {
//           return CircularProgressIndicator();
//         }
//       },
//     );
//   }
// }
