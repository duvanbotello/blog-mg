<?php
class QueryManager
{
    private $pdo;
    public function __construct($user, $password, $db)
    {
        try {
            $this->pdo = new PDO(
                'mysql:host=localhost;dbname=' . $db . ';charset=utf8',
                $user,
                $password,
                [
                    PDO::ATTR_EMULATE_PREPARES => FALSE,
                    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
                ]
            );
        } catch (PDOException $e) {
            print "Error!: " . $e->getMessage();
            die();
        }
    }
    //creamos el metodo para hacer las consultas
    //pedimos como parametros las columnubas a consultas, el nombre de la tabla
    //la restriccion y los parametros de las restriciones
    function select($attr, $table, $where, $param)
    {
        try {
            //verificamos si el where trae datos.
            if ($where == "") {
                //si el where no trae datos se hace una consulta sin restricciones.
                $query = " SELECT " . $attr . " FROM " . $table;
            } else {
                //y si trae datos se hace la consulta con la restriccion
                $query = "SELECT " . $attr . " FROM " . $table . " WHERE " . $where;
            }
            //utilizo la clase pdo para almacer el query en sth
            $sth = $this->pdo->prepare($query);
            //ejecuto el query
            if($param == null){
                $sth->execute();
            }else{
                $sth->execute($param);
            }
            //guardo todos los datos de la consulta dentro de un array
            $response = $sth->fetchALL(PDO::FETCH_ASSOC);
            //retorno un array con el resultado
            return array("results" => $response);
        } catch (PDOExepcion $e) {
            return $e->getMessage();
        }
        $pdo = null;
    }
 
    function insert($table, $value, $param) {
        try {
            $query = 'INSERT INTO '.$table.$value;
            $sth = $this->pdo->prepare($query);
            $sth->execute($param);
            return true;
        } catch (PDOException $e) {
            return $e->getMessage();
        }
    }
    function update($table, $where, $newvalue, $campo,$param)
    {
        try {
            $query = "UPDATE " . $table . " SET " . $campo . " = " . $newvalue ." WHERE ".$where;
            $sth = $this->pdo->prepare($query);
            if ($sth->execute($param)) {
                return 2;
            } else {
                return $sth;
            }
        } catch (PDOExepcion $e) {
            return $e->getMessage();
        }
        $pdo = null;
    }


}
?>