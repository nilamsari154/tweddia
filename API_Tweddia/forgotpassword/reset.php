<?php
// SET HEADER
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: PUT");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// INCLUDING DATABASE AND MAKING OBJECT
require '../database.php';
$db_connection = new Database();
$conn = $db_connection->dbConnection();

// GET DATA FORM REQUEST
$data = json_decode(file_get_contents("php://input"));

//CHECKING, IF ID AVAILABLE ON $data
if(isset($data->email)){
    
    $apiResponse['success']=false;
    $apiResponse['code']=200;
    $apiResponse['message'] = '';
    $email = $data->email;
    $password = $data->password;
    
    //GET POST BY ID FROM DATABASE
    $get_post = "SELECT * FROM `user` WHERE email=:email";
    $get_stmt = $conn->prepare($get_post);
    $get_stmt->bindValue(':email', $email,PDO::PARAM_STR);
    $get_stmt->execute();
    
    
    //CHECK WHETHER THERE IS ANY POST IN OUR DATABASE
    if($get_stmt->rowCount() > 0){
        
        $update_query = "UPDATE `user` SET password = :password WHERE email= :email"; 
        $update_stmt = $conn->prepare($update_query);
        
        // DATA BINDING AND REMOVE SPECIAL CHARS AND REMOVE TAGS
        
        // DATA BINDING AND REMOVE SPECIAL CHARS AND REMOVE TAGS
        $update_stmt->bindValue(':email', htmlspecialchars(strip_tags($data->email)),PDO::PARAM_STR);
        $update_stmt->bindValue(':password', htmlspecialchars(strip_tags($data->password)),PDO::PARAM_STR);
        
        if($update_stmt->execute()){
            $apiResponse['success']=true;
            $apiResponse['code']=200;
            $apiResponse['message'] = 'Password is changed';
            echo  json_encode($apiResponse);
        }else{
            $apiResponse['success']=false;
            $apiResponse['code']=100;
            $apiResponse['message'] = 'Failed to change password';
            echo  json_encode($apiResponse);
        }   
        
    }
    else{
        $apiResponse['success']=false;
        $apiResponse['code']=100;
        $apiResponse['message'] = 'Invalid Email Address';
        echo  json_encode($apiResponse);
    }  
    
}
?>