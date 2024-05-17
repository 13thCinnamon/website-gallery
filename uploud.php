<?php
// Подключение к базе данных
$servername ="localhost";
$username = "root";
$password = "";
$dbname = "gallery";
$connect = mysqli_connect($servername, $username, $password, $dbname);

if(!$connect){
    die();
}

$genres = mysqli_query($connect, "SELECT * FROM `genre`");

mysqli_close($connect);
?>


<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/upload.css" />
    <link rel="stylesheet" href="assets/css/header.css" />
    <link rel="stylesheet" href="assets/css/footer.css" />
    <title>Галерея</title>
</head>
<body>
    <header class="header">
        <div class="header-container">
            <div class="header-logo">
                <a class="logo" href="index.php"><img class="logo-img" src="assets\other\image .png" alt="logo"></a>
            </div>
            <div class="header-nav">
                <ul class="header-nav_ul">
                    <li class="header-nav_li"><a class="header-nav_link" href="index.php">
                        <span class="header-nav_text">Галерея </span>
                    </a></li>
                    <li class="header-nav_li"><a class="header-nav_link" href="uploud.php">
                        <span class="header-nav_text">Загрузить изображение </span>
                    </a></li>
                </ul>
            </div>
        </div>
    </header>

    <div class="container">
        <div class="upload-box">
            <form method="post" enctype="multipart/form-data">
                <a class="text"> Выберите изображение </a>
                <input type="file" class="upload_image" name="image" accept="image/*" required>
                <a class="text"> Выберите жанр </a>
                <select id = "genre_id" name="genre_id" class="selector" required>
                    <?php
                    while ($genre = mysqli_fetch_assoc($genres)) {
                        echo "<option value='{$genre['genre_id']}'>{$genre['genre']}</option>";
                    }
                    ?>
                </select>
                <button type="submit" class="submit" name="submit">Загрузить изображение</button>
                <?php
                $servername ="localhost";
                $username = "root";
                $password = "";
                $dbname = "gallery";
                $connect = mysqli_connect($servername, $username, $password, $dbname);
                
                if(!$connect){
                    die();
                }

                if(isset($_POST['submit'])) {

                    $genre_id = $_POST['genre_id'];
                    $image = "_".str_replace(" ","_",$_FILES['image']['name']);
                
                    $target_dir = "assets/image/";
                
                    $target_file = $target_dir . basename($image);
                    $uploadOk = 1;
                
                    $new_target_file = $target_dir . basename($image);
                
                    $image_path = "assets/image/". $image;
                    
                    if (move_uploaded_file($_FILES["image"]["tmp_name"], $new_target_file)) {
                        $sql = "INSERT INTO photo (image, genre_id) VALUES ('$image_path', '$genre_id')";
                        
                        if(mysqli_query($connect, $sql)) {
                            echo '<script>alert("Изображение загруженно")</script>';
                        } else {
                            echo '<script>alert("Ошибка при загрузке файла")</script>';
                        }
                    } else {
                        echo '<script>alert("Ошибка при добавлении изображения")</script>';
                    }
                }
                ?>
            </form>
        </div>
    </div>

    <footer class="footer">
        <div class="footer-container">
          <div class="footer_text">Сайт-галерея</div>
        </div>
    </footer>

</body>    