<?php
//open connection to mysql db
$connection = mysqli_connect('localhost', 'giftshopriro', 'robert2975', 'giftshopriro') or die('Error ' . mysqli_error($connection));

//fetch account details
$username = $_GET['username'];
$authToken = $_GET['authToken'];
$lastLogin = $_GET['lastLogin'];

//get an account with the username and password
$sql = 'SELECT lastLogin FROM accounts WHERE username = ? AND lastLogin*? = lastLogin*authToken*?';
$result = $connection->execute_query($sql, [$username, $authToken, $lastLogin]);
$row = mysqli_fetch_assoc($result);

//check if the credentials are correct
if ($row == NULL) {
    echo ('Incorrec credentials.');
    mysqli_close($connection);
    exit();
}

//check if the credentials are still valid (it's not from the future and it's not from 3 days ago)
if ($row == NULL || $lastLogin < $row['lastLogin'] || $lastLogin - $row['lastLogin'] > 259200000) {
    echo ('Expired credentials.');
    mysqli_close($connection);
    exit();
}

//leave
echo ('True');
mysqli_close($connection);
?>