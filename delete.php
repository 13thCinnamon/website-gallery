<?php
    $servername ="localhost";
    $username = "root";
    $password = "";
    $dbname = "gallery";
	$connect = mysqli_connect($servername, $username, $password, $dbname);

	if(!$connect){
		die();
	}

    if(isset($_POST['delete_from_db'])){
        $photo_id = $_POST['photo_id'];
        $photo_id = mysqli_real_escape_string($connect, $photo_id);
        
        $sql_delete_from_db = "DELETE FROM photo WHERE photo_id = '$photo_id'";
        if (mysqli_query($connect, $sql_delete_from_db)) {
            echo '<script>alert("Изображение удалено")</script>';
        } else {
            echo '<script>alert("Ошибка при удалении изображения")</script>';
        }

        $genre_id = isset($_POST['selector']) ? $_POST['selector'] : 0;


        $sql = $genre_id > 0 ? "SELECT * FROM `photo` WHERE `genre_id` = $genre_id ORDER BY `photo_id` DESC" : "SELECT * FROM `photo` ORDER BY `photo_id` DESC";
        $photos = mysqli_query($connect, $sql);
    
        $output = '';
    
        while ($row = mysqli_fetch_assoc($photos)) {
            $output .= '<div class="box-1">  
                            <img class="img" src="' . $row['image'] . '" alt="">   
                            <button type="button" id="delete_from_db" onclick="deleteFromDB(\'' . $row['photo_id'] . '\')" class="overlay-button delete-from-db">Удалить изображение</button>  
                        </div>'; 
        }
    
        echo $output; // Отправляем обновленный HTML код обратно на страницу
    }
?>