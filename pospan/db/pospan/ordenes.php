<?php
require "connection.php";


$query = "SELECT * FROM `ordenes`";

// Ejecutar la consulta
$resultado = mysqli_query($conn, $query);

// Crear un array para almacenar los resultados
$rows = array();
while ($row = mysqli_fetch_assoc($resultado)) {
  $rows[] = $row;
}

// Convertir el array a JSON y mostrarlo en pantalla
echo json_encode($rows);

// Cerrar la conexión
mysqli_close($conn);

?>