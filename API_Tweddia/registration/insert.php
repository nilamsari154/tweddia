<?php
// SET HEADER
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// INCLUDING DATABASE AND MAKING OBJECT
require '../database.php';
$db_connection = new Database();
$conn = $db_connection->dbConnection();

// GET DATA FORM REQUEST
$data = json_decode(file_get_contents("php://input"));

//CREATE MESSAGE ARRAY AND SET EMPTY
$msg['message'] = '';

// CHECK IF RECEIVED DATA FROM THE REQUEST
if(isset($data->name) && isset($data->email) && isset($data->password)){
    // CHECK DATA VALUE IS EMPTY OR NOT
    if(!empty($data->name) && !empty($data->email) && !empty($data->password) && !empty($data->phone)){
        
        $insert_query = "INSERT INTO `user`(name,email,password,phone) VALUES(:name,:email,:password,:phone)";
        
        $insert_stmt = $conn->prepare($insert_query);
        // DATA BINDING
        $insert_stmt->bindValue(':name', htmlspecialchars(strip_tags($data->name)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':email', htmlspecialchars(strip_tags($data->email)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':password', htmlspecialchars(strip_tags($data->password)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':phone', htmlspecialchars(strip_tags($data->phone)),PDO::PARAM_INT);
        
        if($insert_stmt->execute()){
            $msg['message'] = 'Data Inserted Successfully';
        }else{
            $msg['message'] = 'Data not Inserted';
        } 
        
    }else{
        $msg['message'] = 'Oops! empty field detected. Please fill all the fields';
    }
}
else{
    $msg['message'] = 'Please fill all the fields | name, email, password';
}
//ECHO DATA IN JSON FORMAT
echo  json_encode($msg);
?>