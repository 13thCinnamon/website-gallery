<?php
    $servername ="localhost";
    $username = "root";
    $password = "";
    $dbname = "gallery";
	$connect = mysqli_connect($servername, $username, $password, $dbname);

	if(!$connect){
		die();
	}
    // Список жанров для фильтра
    $genres = mysqli_query($connect, "SELECT * FROM `genre`");
?>

<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/index.css" />
    <link rel="stylesheet" href="assets/css/filter.css" />
    <link rel="stylesheet" href="assets/css/header.css" />
    <link rel="stylesheet" href="assets/css/footer.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>Галерея</title>
</head>
<body>

    <header class="header" id="header">
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

    <div class="filter-container" id="filter">
        <div class="filter">

            <div class="filter-name">
                Фильтр по жанрам
            </div>   
            <div class="filter-selector">
                <form method="post">

                    <select class="selector" name="selector" onchange="filterData()">

                        <option value="0">Все</option>
                        <?php
                        while ($genre = mysqli_fetch_assoc($genres)) {
                            echo "<option value='{$genre['genre_id']}'>{$genre['genre']}</option>";
                        }
                        ?>

                    </select>
                </form>
            </div>
        </div>
    </div>

    <div class="gallery-container" id="gallery">
        <?php
            $genre_id = isset($_POST['selector']) ? $_POST['selector'] : 0;

            $sql = $genre_id > 0 ? "SELECT * FROM `photo` WHERE `genre_id` = $genre_id ORDER BY `photo_id` DESC" : "SELECT * FROM `photo` ORDER BY `photo_id` DESC";
            $photos = mysqli_query($connect, $sql);
        
            if(!$photos){
                die("Ошибка запроса: " . mysqli_error($connect));
            }
            while ($row = mysqli_fetch_assoc($photos)) {
                $output .= '<div class="box-1"> 
                                <img class="img" src="' . $row['image'] . '" alt="">  
                                <button type="button" id="delete_from_db" onclick="deleteFromDB(\'' . $row['photo_id'] . '\')"  class="overlay-button delete-from-db">Удалить изображение</button> 
                            </div>';
            }
            echo $output;
        ?>
    </div>

    <footer class="footer">
        <div class="footer-container">
          <div class="footer_text">Сайт-галерея</div>
        </div>
    </footer>

</body>

<script>
    function filterData() {
        var selectorValue = $('.selector').val();
        $.ajax({
            url: 'filter.php',
            type: 'POST',
            data: { selector: selectorValue },
            success: function(response) {
                $('.gallery-container').html(response);
            }
        });

    }

    function deleteFromDB(imageID) {
        if (confirm('Удалить изображение из базы данных?')){
            var selectorValue = $('.selector').val();
            $.ajax({
              url: 'delete.php',
              type: 'POST',
              data: {
                delete_from_db: 1,
                photo_id: imageID,
                selector: selectorValue,
              },
              success: function(response) {
                $('.gallery-container').html(response);
            }
            });
        }
    }
</script>
