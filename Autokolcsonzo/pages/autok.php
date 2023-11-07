<div class="container-fluid" style="height: 100vh;">
    <div class="row d-flex align-items-center justify-content-center">
        <?php
        foreach ($db->osszesAuto() as $row) {
            $image = null;
            if (file_exists("./img/" . ucwords($row['gyarto_es_modell']) . ".jpg")) {
                $image = "./img/" . ucwords($row['gyarto_es_modell']) . ".jpg";
            } else if (file_exists("./img/" . ucwords($row['gyarto_es_modell']) . ".jpeg")) {
                $image = "./img/" . ucwords($row['gyarto_es_modell']) . ".jpeg";
            } else if (file_exists("./img/" . ucwords($row['gyarto_es_modell']) . ".png")) {
                $image = "./img/" . ucwords($row['gyarto_es_modell']) . ".png";
            } else {
                $image = "./img/noimage.png";
            }
            $card = '<div class="card" style="width: 18rem;">
                        <img src="' . $image . '" class="card-img-top" alt="..." style="width: auto; height: 180px;">
                            <div class="card-body">
                                <h5 class="card-title">' . $row['gyarto_es_modell'] . '</h5>' .
                    '<p class="card-text">Évjarat: ' . $row['evjarat'] . '</p>' .
                    '<p class="card-text">Üzemanyag: ' . $row['uzemanyag'] . '</p>' .
                    '<p class="card-text">Ár: ' . $row['ar'] . " Ft" . '</p>' .
                    '<a href="index.php?menu=home&id=' . $row['cars_id'] . '" class="btn btn-primary">Adatok</a>
                        </div>
                    </div>
                ';
            echo $card;
        }
        ?>
    </div>
</div>
