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
    $apiResponse['success']=false;
    $apiResponse['code']=200;
    $apiResponse['message']="";
    $apiResponse['content']=null;

// CHECK IF RECEIVED DATA FROM THE REQUEST
if(isset($data->id_user) && isset($data->id_vendor) && isset($data->name_vendor) && isset($data->address)){
    // CHECK DATA VALUE IS EMPTY OR NOT
    if(!empty($data->id_user) && !empty($data->id_vendor) && !empty($data->name_vendor) && !empty($data->address)){
        
        $insert_query = "INSERT INTO `favorit_vendor`(id_user,id_vendor,name_vendor,address) VALUES(:id_user,:id_vendor,:name_vendor,:address)";
        
        $insert_stmt = $conn->prepare($insert_query);
        // DATA BINDING
        $insert_stmt->bindValue(':id_user', htmlspecialchars(strip_tags($data->id_user)),PDO::PARAM_INT);
        $insert_stmt->bindValue(':id_vendor', htmlspecialchars(strip_tags($data->id_vendor)),PDO::PARAM_INT);
        $insert_stmt->bindValue(':name_vendor', htmlspecialchars(strip_tags($data->name_vendor)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':address', htmlspecialchars(strip_tags($data->address)),PDO::PARAM_STR);
        
        if($insert_stmt->execute()){
            $apiResponse['message'] = 'Send Succes';
            $apiResponse['success']=true;
            $apiResponse['code']=200;  
            echo  json_encode($apiResponse);

        }else{
            $apiResponse['message'] = 'Send Failed';
            $apiResponse['success']=false;
            $apiResponse['code']=100;
            echo  json_encode($apiResponse);
        } 
        
    }else{
        $apiResponse['message'] = 'Oops! empty field detected. Please fill all the field';
        $apiResponse['success']=false;
        $apiResponse['code']=100;
        echo  json_encode($apiResponse);
    }
}
else{
    $apiResponse['message'] = 'Please fill all the fields | name, complaint';
    $apiResponse['success']=false;
    $apiResponse['code']=100;
    echo  json_encode($apiResponse);
}
//ECHO DATA IN JSON FORMAT
?>