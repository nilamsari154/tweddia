<?php
// SET HEADER
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

// INCLUDING DATABASE AND MAKING OBJECT
require '../database.php';
require '../PHPMailer/Exception.php';
require '../PHPMailer/PHPMailer.php';
require '../PHPMailer/SMTP.php';

$db_connection = new Database();
$conn = $db_connection->dbConnection();

// GET DATA FORM REQUEST
$data = json_decode(file_get_contents("php://input"));

 //CHECKING, ID ID AVAILABLE ON $data
 if(isset($data->email)){

    $apiResponse['success']=true;
    $apiResponse['code']=200;
    $apiResponse['message']="";
    $apiResponse['content']=null;
    $email = $data->email;

    //GET POST BY ID FROM DATABASE
    $get_data = "SELECT * FROM `user` WHERE email=:email";
    $get_stmt = $conn->prepare($get_data);
    $get_stmt->bindValue(':email', $email,PDO::PARAM_STR);
    $get_stmt->execute();

    //CHECK WHETHER THERE IS ANY DATA IN OUR DATABASE
    if($get_stmt->rowCount() > 0){
        
        $code = mt_rand(100000, 999999);
        $verificationNumber = [
            "email"=>$email,
            "verification_code"=>$code
        ];

        $mail = new PHPMailer(true);

        try{
    //Server Settings
    $mail->isSMTP();
    $mail->Host = 'smtp.gmail.com';
    $mail->SMTPAuth = true;
    $mail->Username = 'tweddia.app@gmail.com';
    $mail->Password = 'tweddia123';
    $mail->SMTPOptions = array(
            'ssl' => array(
            'verify_peer' => false,
            'verify_peer_name' => false,
            'allow_self_signed' => true
        )
    );
    $mail->SMTPSecure = 'ssl';
    $mail->Port = 465;

    //Send Email
    $mail->setFrom('tweddia.app@gmail.com');

    //Recipient
    $mail->addAddress($email);

    //Content
    $mail->isHTML(true);
    $mail->Subject = 'Reset Password For Tweddia';
    $mail->Body = 'Your verification code for reset password is<br><b>'.$code.'</b><br>Please do not reply back<br><br>Regards,<br>tweddia Team';

    $mail->send();

    $apiResponse['success']=true;
    $apiResponse['code']=200;
    $apiResponse['message']="Verification code is sent to your Email";
    $apiResponse['content']=$verificationNumber;
    
    } catch (Exception $e){
        $apiResponse['success']=false;
        $apiResponse['code']=100;
        $apiResponse['message'] = 'Message could not be sent. Mailer Error: '.$mail->ErrorInfo;
    }
  }else{

        $apiResponse['success'] = false;
        $apiResponse['code']=50;
        $apiResponse['message'] = 'Email is not exist';

  }

  echo json_encode($apiResponse);

 }

?>