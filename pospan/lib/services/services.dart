import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:pospan/global/globals.dart';

class AppsSerices {


 List? lista1 =[];


Future<Map<String, dynamic>> fetchUserData() async {
  final response = await http.get(Uri.parse('https://my-json-server.typicode.com/egarciapospan/mockup-faker/db'));

  if (response.statusCode == 200) {
    print(response.body.toString());
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load user data');
  }
}





Future<List<Map<String, dynamic>>> getDetalles(String idorden) async {
  final response = await http.post(
    Uri.parse(Globals().detalles),
    body: {
      'ordenesid': idorden,
    },
  );

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    print(jsonResponse.toString());
    return List<Map<String, dynamic>>.from(jsonResponse);
  } else {
    throw Exception('Failed to load detalles');
  }
}


// Future<List<Map<String, dynamic>>> getDetalles(idorden) async {
//   final response = await http.post(Uri.parse(Globals().detalles),body: {


//   });

//   if (response.statusCode == 200) {
//     final jsonResponse = json.decode(response.body);
//     print(jsonResponse.toString());
//     return List<Map<String, dynamic>>.from(jsonResponse);
//   } else {
//     throw Exception('Failed to load detalles');
//   }
// }


Future<List<Map<String, dynamic>>> getOrdenes() async {
  final response = await http.get(Uri.parse(Globals().ordenes));

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    print(jsonResponse.toString());
    return List<Map<String, dynamic>>.from(jsonResponse);
  } else {
    throw Exception('Failed to load detalles');
  }
}

}

// // <?php
// // require "connection.php";

// // $ordenesid = "963639d4-131b-42b6-96c5-c52fa40bcd49";
// // $query = "SELECT * FROM detalles WHERE ordenesid = '$ordenesid'";

// // // Ejecutar la consulta
// // $resultado = mysqli_query($conn, $query);

// // // Crear un array para almacenar los resultados
// // $rows = array();
// // while ($row = mysqli_fetch_assoc($resultado)) {
// //   $rows[] = $row;
// // }

// // // Convertir el array a JSON y mostrarlo en pantalla
// // echo json_encode($rows);

// // // Cerrar la conexión
// // mysqli_close($conn);

// // ?>




// Future<void> initDatabase() async {
//   final dbPath = await getDatabasesPath();
//   final path = join(dbPath, 'my_database.db');

//   final exists = await databaseExists(path);

//   if (!exists) {
//     print('Creating new database...');
//     try {
//       await openDatabase(path, version: 1, onCreate: (db, version) async {
//         await db.execute('''
//           CREATE TABLE `detalles` (
//             `cantidad` double NOT NULL,
//             `id` varchar(50) NOT NULL,
//             `impuesto` double NOT NULL,
//             `nombre` varchar(50) NOT NULL,
//             `ordenesid` varchar(50) NOT NULL,
//             `precio` double NOT NULL,
//             `subtotal` double NOT NULL,
//             `total` double NOT NULL
//           ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
//         ''');

//         await db.execute('''
//           CREATE TABLE `ordenes` (
//             `id` varchar(50) NOT NULL,
//             `impuesto` double NOT NULL,
//             `subtotal` double NOT NULL,
//             `total` double NOT NULL
//           ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
//         ''');

//         await db.execute('''
//           ALTER TABLE `detalles`
//             ADD PRIMARY KEY (`id`),
//             ADD KEY `ordenesid` (`ordenesid`);
//         ''');

//         await db.execute('''
//           ALTER TABLE `ordenes`
//             ADD PRIMARY KEY (`id`);
//         ''');

//         await db.execute('''
//           ALTER TABLE `detalles`
//             ADD CONSTRAINT `detalles_ibfk_1` FOREIGN KEY (`ordenesid`) REFERENCES `ordenes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
//         ''');
//       });
//       print('Database created successfully!');
//     } catch (e) {
//       print('Error creating database: $e');
//     }
//   } else {
//     print('Database already exists');
//   }
// }

