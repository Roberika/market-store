<?php
//open connection to mysql db
$connection = mysqli_connect('localhost', 'giftshopriro', 'robert2975', 'giftshopriro') or die('Error ' . mysqli_error($connection));

//fetch data
$username = $_GET['username'];
$authToken = $_GET['authToken'];
$lastLogin = $_GET['lastLogin'];
$imageURL = '';

//check is there is an account with the username
$sql = 'SELECT * FROM accounts WHERE username = ?';
$result = $connection->execute_query($sql, [$username]);
if (mysqli_fetch_assoc($result) == NULL) {
    echo json_encode(['response' => 'Username not found.']);
    mysqli_close($connection);
    exit();
}

//check is there is an account with the username and password
$sql = 'SELECT imageURL FROM accounts WHERE username = ? AND lastLogin*? = lastLogin*authToken*?';
$result = $connection->execute_query($sql, [$username, $authToken, $lastLogin]);
$rows = mysqli_fetch_assoc($result);
if ($rows == NULL) {
    $response = ('Incorrect password.');
} else {
    $sql = 'UPDATE accounts SET lastLogin = ? WHERE username = ?';
    $connection->execute_query($sql, [$lastLogin, $username]);
    $imageURL = $rows['imageURL'];
    $response = ('True');
}

//create a new json
$json = ['username' => $username, 'authToken' => $authToken, 'lastLogin' => $lastLogin, 'imageURL' => $imageURL, 'response' => $response];
echo json_encode($json);

//close the db connection
mysqli_close($connection);
?>