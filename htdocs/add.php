<?php
//connect to mysql db
$con = mysqli_connect('localhost', 'giftshopriro', 'robert2975', 'giftshopriro') or die('Could not connect: ' . mysqli_error($con));

//get the item's values and user's name
$title = $_GET['title'];
$detail = $_GET['detail'];
$linkURL = $_GET['linkURL'];
$imageURL = $_GET['imageURL'];
$username = $_GET['username'];
$typeID = $_GET['typeID'];

//check is there is an account with the username and get the user's id
$userID = mysqli_fetch_assoc($con->execute_query('SELECT userID FROM accounts WHERE username = ?', [$username]));
if ($userID == NULL) {
    echo 'User not found.';
    mysqli_close($con);
    exit();
}

//insert into mysql table
$sql = 'INSERT INTO items(title, detail, linkURL, imageURL, userID, typeID) VALUES(?,?,?,?,?,?)';
$result = $con->execute_query($sql, [$title, $detail, $linkURL, $imageURL, $userID['userID'], $typeID]);
if ($result != NULL) {
    echo 'True';
    mysqli_close($con);
    exit();
}

//close the db connection
echo 'Insertion failed.';
mysqli_close($con);
?>