<?php
//web kami tidak menyimpan password, namun kami hanya menyimpan
//authentication tokennya. kami tidak tahu apakah ini memang sistem
//yang digunakan website yang profesional, tapi ide ini muncul
//mendadak saat robert sedang jalan pulang dan robert sangat senang
//dengan idenya sehingga dia implementasikan saja. menurut robert sih,
//ide ini sangat keren, walau sekarang kalau lupa password harus ganti
//password (belum diimplementasi jadi kalau lupa harus ganti akun).
//robert juga menambahkan enkripsi dengan mengalikan authtokennya
//dengan waktu login, sehingga jika ingin mencuri authtoken aslinya,
//antara harus lewat meretas databasenya, atau dengan mengetahui kapan
//terakhir user login, kapan user sedang mencoba login, dan apa
//authtoken user yang diinputkan, dan authtoken itupun masih harus
//diterjemah menjadi username dan password, sehingga juga perlu
//mengetahui username pengguna.

//connect to mysql db
$con = mysqli_connect('localhost', 'giftshopriro', 'robert2975', 'giftshopriro') or die('Could not connect: ' . mysqli_error($con));

//get the account details
$username = $_GET['username'];
$authToken = $_GET['authToken'];
$lastLogin = $_GET['lastLogin'];
$imageURL = $_GET['imageURL'];

//check is there is an account with the username
$sql = 'SELECT * FROM accounts WHERE username = ?';
$result = $con->execute_query($sql, [$username]);
if (mysqli_fetch_assoc($result) != NULL) {
    echo 'Username found.';
    mysqli_close($con);
    exit();
}

//insert into mysql table
$sql = 'INSERT INTO accounts(username, authToken, lastLogin, imageURL) VALUES(?,?,?,?)';
$result = $con->execute_query($sql, [$username, $authToken, $lastLogin, $imageURL]);
if ($result) {
    echo 'True';
    mysqli_close($con);
    exit();
}

//close the db connection
echo 'Insertion failed.';
mysqli_close($con);
?>