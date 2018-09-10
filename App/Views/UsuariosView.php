<?php
require('../Controllers/UsuariosController.php');

echo "<h1>CRUD Con MVC de la tabla usuarios</h1>";

$usuarios = new UsuariosController();

$usuarios_data = $usuarios->read();
//var_dump($usuarios_data);

echo '<table>
        <tr>
            <th>id</th>
            <th>Nombre</th>
            <th>tipo</th>
        </tr>';

    for($n = 0; $n < count($usuarios_data) ; $n++){
        echo '  <tr> <td>'. $usuarios_data[$n]['id_usuario'] .'</td> 
                <td>'. $usuarios_data[$n]['nombre_usuario'] .'</td> 
                <td>'. $usuarios_data[$n]['tipo_usuario'] .'</td> </tr>';
    }
            
 echo  ' </table>';



//$usuarios->update($update_usuario);
 //$usuarios->create( $new_usuario );
 $usuarios->delete(3);
