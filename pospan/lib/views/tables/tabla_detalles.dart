import 'dart:convert';
import 'package:flutter/material.dart';

class DetallesTable extends StatelessWidget {
  final Future<List<Map<String, dynamic>>> futureData;

  DetallesTable({required this.futureData});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: futureData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
          final stringData = data.map((item) => {
            'cantidad': item['cantidad'].toString(),
            'id': item['id'].toString(),
            'impuesto': item['impuesto'].toString(),
            'nombre': item['nombre'].toString(),
            'ordenesid': item['ordenesid'].toString(),
            'precio': item['precio'].toString(),
            'subtotal': item['subtotal'].toString(),
            'total': item['total'].toString(),
          }).toList();

          return SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  
                  DataColumn(label: Text('Cantidad')),
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Impuesto')),
                  DataColumn(label: Text('Nombre')),
                  DataColumn(label: Text('Ordenes ID')),
                  DataColumn(label: Text('Precio')),
                  DataColumn(label: Text('Subtotal')),
                  DataColumn(label: Text('Total')),
                ],
                rows: stringData.map((item) {
                  return DataRow(
                    cells: [
                      DataCell(Text(item['cantidad']!)),
                      DataCell(Text(item['id']!)),
                      DataCell(Text(item['impuesto']!)),
                      DataCell(Text(item['nombre']!)),
                      DataCell(Text(item['ordenesid']!)),
                      DataCell(Text(item['precio']!)),
                      DataCell(Text(item['subtotal']!)),
                      DataCell(Text(item['total']!)),
                    ],
                  );
                }).toList(),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}