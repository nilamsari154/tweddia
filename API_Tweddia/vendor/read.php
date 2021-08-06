<?php
// SET HEADER
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json; charset=UTF-8");

// INCLUDING DATABASE AND MAKING OBJECT
require '../database.php';
$db_connection = new Database();
$conn = $db_connection->dbConnection();

$apiResponse['success']=true;
$apiResponse['code']=200;
$apiResponse['messages']="";
$apiResponse['content']=null;

// GET DATA FORM REQUEST
$data = json_decode(file_get_contents("php://input"));

if(isset($data->jenis_vendor)){
//IF HAS ID PARAMETER
    $post_id = $data->jenis_vendor;
}
else {
    $post_id = 'all_posts';
}
// MAKE SQL QUERY
// IF GET POSTS ID, THEN SHOW POSTS BY ID OTHERWISE SHOW ALL POSTS
$sql = "SELECT * FROM `vendor` WHERE jenis_vendor='$post_id'"; 
$stmt = $conn->prepare($sql);

$stmt->execute();

//CHECK WHETHER THERE IS ANY POST IN OUR DATABASE
if($stmt->rowCount() > 0){
    // CREATE POSTS ARRAY
    $posts_array = [];
    
    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        
        $post_data = [
            'id_vendor' => $row['id_vendor'],
            'name_vendor' => $row['name_vendor'],
            'jenis_vendor' => $row['jenis_vendor'],
            'address' => $row['address'],
            'jam_kerja' => $row['jam_kerja'],
            'deskripsi' => $row['deskripsi'],
            'handphone' => $row['handphone'],
            'email' => $row['email'],
        ];
        // PUSH POST DATA IN OUR $posts_array ARRAY
        if(isset($data->id)){

            $apiResponse['content'] = $post_data;
        }else{
            array_push($posts_array, $post_data);
                
        }
        
    }
    if(!isset($data->id)){
        $apiResponse['content']=$posts_array;
    }
    //SHOW POST/POSTS IN JSON FORMAT
    echo json_encode($apiResponse);
 

}
else{
    $apiResponse['success']=false;
    $apiResponse['code']=200;
    $apiResponse['messages']="No Data Found";
    //IF THER IS NO POST IN OUR DATABASE
    echo json_encode($apiResponse);
}
?>