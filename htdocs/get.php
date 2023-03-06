<?php
//open connection to mysql db
$connection = mysqli_connect('localhost', 'giftshopriro', 'robert2975', 'giftshopriro') or die('Error ' . mysqli_error($connection));

//try to get the item based of of the item's id
$itemID = $_GET['id'];
$sql = 'SELECT * FROM items WHERE itemID = ?';
$result1 = $connection->execute_query($sql, [$itemID]);
$row = mysqli_fetch_assoc($result1);

//if there's none, go return the 404 response
if ($row == NULL) {
    $item['response'] = 'Item not found.';
    echo json_encode($item);
    mysqli_close($connection);
    exit();
}
//if there is
//get the poster's name
$sql = 'SELECT username FROM accounts WHERE userID = ?';
$result2 = $connection->execute_query($sql, [$row['userID']]);
$username = mysqli_fetch_assoc($result2);

//pack the item
$item = ['title' => $row['title'], 'detail' => $row['detail'], 'imageURL' => $row['imageURL'], 'linkURL' => $row['linkURL'], 'username' => $username['username']];

//send the item and a response saying so
$item['response'] = 'True';
echo json_encode($item);
mysqli_close($connection);
?>