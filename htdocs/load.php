<?php
//open connection to mysql db
$connection = mysqli_connect('localhost', 'giftshopriro', 'robert2975', 'giftshopriro') or die('Error ' . mysqli_error($connection));

//get the user's id
$username = $_GET['username'];
$userID = mysqli_fetch_assoc($connection->execute_query('SELECT userID FROM accounts WHERE username = ?', [$username])) or 0;

//create an array
$json = array();
$own = array();

//get all types
$sql = 'SELECT * FROM itemTypes';
$result1 = $connection->execute_query($sql);
while ($types = mysqli_fetch_assoc($result1)) {
    //sort items into types and if the user submitted it
    $sql = 'SELECT * FROM items WHERE typeID = ?';
    $items = array();
    $result2 = $connection->execute_query($sql, [$types['typeID']]);
    while ($row = mysqli_fetch_assoc($result2)) {
        $item = ['itemID' => $row['itemID'], 'title' => $row['title'], 'detail' => $row['detail'], 'imageURL' => $row['imageURL'], 'linkURL' => $row['linkURL'], 'userID' => $row['userID'], 'typeID' => $row['typeID']];
        if ($userID != NULL and $row['userID'] == $userID['userID']) {
            $own[] = $item;
            continue;
        }
        $items[] = $item;
    }
    $json[] = ['typeName' => $types['name'], 'items' => $items];
}

//if the user is logged in, put the items into the array. if not, there would be no items so we don't have to
if ($username != null) {
    $json[] = ['typeName' => $username, 'items' => $own];
}

//if the temporary json is empty
if (count($json) == 0) {
    echo json_encode(['response' => 'Items not found.', 'types' => $json]);
    mysqli_close($connection);
    exit();
}

//go back go back go back go back go back go back go back go back go back go back
echo json_encode(['response' => 'True', 'types' => $json]);
mysqli_close($connection);
?>