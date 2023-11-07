<?php
if (filter_input(INPUT_POST, "KivalasztottAuto", FILTER_VALIDATE_BOOL, FILTER_NULL_ON_FAILURE)) {
    $adatok = $_POST;
    $cars_id = filter_input(INPUT_POST, "cars_id", FILTER_SANITIZE_NUMBER_INT);
    $gyarto_es_modell = htmlspecialchars(filter_input(INPUT_POST, "gyarto_es_modell"));
    $evjarat = filter_input(INPUT_POST, "evjarat");
    $szin = filter_input(INPUT_POST, "szin");
    $uzemanyag = filter_input(INPUT_POST, "uzemanyag");
    $valto_tipus = filter_input(INPUT_POST, "valto_tipus");
    $utasok_szama = filter_input(INPUT_POST, "utasok_szama");
    $ar = filter_input(INPUT_POST, "ar");
    $elerhetoseg = filter_input(INPUT_POST, "elerhetoseg");
} else {
    $carData = $db->getKivalasztottAuto($id);
}
?>

<form method="post" action="index.php?menu=home&id=<?php echo $carData['cars_id']; ?>" enctype="multipart/form-data">
    <input type="hidden" name="cars_id" value="<?php echo $carData['cars_id']; ?>">
    <div class="row">
        <div class="mb-3 col-6">
            <label for="gyarto_es_modell" class="form-label">Gyártó és Modell</label>
            <input type="text" class="form-control" name="gyarto_es_modell" id="gyarto_es_modell" value="<?php echo $carData['gyarto_es_modell']; ?>">
        </div>
        <div class="mb-3 col-6">
            <label for="szin" class="form-label">Szín</label>
            <input type="text" class="form-control" name="szin" id="szin" value="<?php echo $carData['szin']; ?>">
        </div>
    </div>
    <div class="row">
        <div class="mb-3 col-6">
            <label for="evjarat" class="form-label">Évjárat</label>
            <input type="text" class="form-control" name="evjarat" id="evjarat" value="<?php echo $carData['evjarat']; ?>">
        </div>
        <div class="mb-3 col-6">
            <label for="uzemanyag" class="form-label">Üzemanyag</label>
            <input type="text" class="form-control" name="uzemanyag" id="uzemanyag" value="<?php echo $carData['uzemanyag']; ?>">
        </div>
    </div>
    <div class="row">
        <div class="mb-3 col-6">
            <label for="valto_tipus" class="form-label">Vátló típus</label>
            <input type="text" class="form-control" name="valto_tipus" id="valto_tipus" value="<?php echo $carData['valto_tipus']; ?>">
        </div>
        <div class="mb-3 col-6">
            <label for="utasok_szama" class="form-label">Utasok Száma</label>
            <input type="text" class="form-control" name="utasok_szama" id="utasok_szama" value="<?php echo $carData['utasok_szama'] . " Fő"; ?>">
        </div>
    </div>
    <div class="row">
        <div class="mb-3 col-6">
            <label for="ar" class="form-label">Ár</label>
            <input type="text" class="form-control" name="ar" id="ar" value="<?php echo $carData['ar'] . ' Ft'; ?>">
        </div>
    </div>
    <?php
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        if ($_SESSION['login']) {
            // Replace '123' with the actual car ID obtained from the form or any other source.
            $car_id = $_POST['car_id'];
            $user_id = $_SESSION['user_id']; // Get the user's ID from the session.
            
            
            // Example SQL query:
            // INSERT INTO user_cart (user_id, car_id, date_added) VALUES (:user_id, :car_id, NOW());
            // You should use prepared statements to prevent SQL injection.
            // After inserting, you can redirect the user to the cart page.
            header('Location: cart.php');
            exit;
        }
    }
    ?>

</form>
