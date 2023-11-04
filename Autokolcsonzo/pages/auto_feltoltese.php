<?php
if (filter_input(INPUT_POST, "autoFeltoltese", FILTER_VALIDATE_BOOL, FILTER_NULL_ON_FAILURE)) {
    $adatok = $_POST;
    $gyarto_es_modell = filter_input(INPUT_POST, "gyarto_es_modell");
    $evjarat = filter_input(INPUT_POST, "evjarat");
    $szin = filter_input(INPUT_POST, "szin");
    $uzemanyag = filter_input(INPUT_POST, "uzemanyagSelect");
    $valto_tipus = filter_input(INPUT_POST, "valtoTipusSelect");
    $utasok_szama = filter_input(INPUT_POST, "utasokSzamaSelect");
    $ar = filter_input(INPUT_POST, "ar");

    if ($db->autoFeltoltese($gyarto_es_modell, $evjarat, $szin, $uzemanyag, $valto_tipus, $utasok_szama, $ar)) {
        echo '<p>Az adatok feltöltése sikeres</p>';
        header("Location: index.php?menu=fooldal");
    } else {
        echo '<p>Az adatok feltöltése sikertelen</p>';
    }
}
?>
<h1>Autó Feltöltése</h1>
<form action="#" method="post">
    <div class="row">
        <div class="mb-3 col-6">
            <label for="gyarto_es_modell">Gyártó és Modell:</label>
            <input type="text" class="form-control" id="gyarto_es_modell" name="gyarto_es_modell" required>
        </div>
        <div class="mb-3 col-6">
            <label for="evjarat">Évjárat:</label>
            <input type="text" class="form-control" name="evjarat" id="evjarat" required>
        </div>
    </div>
    <div class="row">
        <div class="mb-3 col-6">
            <label for="szin">Szín:</label>
            <input type="text" class="form-control" name="szin" id="szin" required>
        </div>
        <div class="mb-3 col-6">
            <label for="uzemanyagSelect" class="form-label">Üzemanyag</label>
            <select id="uzemanyagSelect" name="uzemanyagSelect" class="form-select">
                <?php
                foreach ($db->getUzemanyag() as $value) {
                    if ($adatok['uzemanyag'] == $value[0]) {
                        echo '<option selected value="' . $value[0] . '">' . $value[0] . '</option>';
                    } else {
                        echo '<option value="' . $value[0] . '">' . $value[0] . '</option>';
                    }
                }
                ?>
            </select>
        </div>
    </div>
    <div class="row">
        <div class="mb-3 col-6">
            <label for="valtoTipusSelect" class="form-label">Váltó Típus</label>
            <select id="valtoTipusSelect" name="valtoTipusSelect" class="form-select">
                <?php
                foreach ($db->getValto() as $value) {
                    if ($adatok['valto_tipus'] == $value[0]) {
                        echo '<option selected value="' . $value[0] . '">' . $value[0] . '</option>';
                    } else {
                        echo '<option value="' . $value[0] . '">' . $value[0] . '</option>';
                    }
                }
                ?>
            </select>
        </div>

        <div class="mb-3 col-6">
            <label for="utasokSzamaSelect" class="form-label">Utasok Száma</label>
            <select id="utasokSzamaSelect" name="utasokSzamaSelect" class="form-select">
                <?php
                foreach ($db->getUtasok() as $value) {
                    if ($adatok['utasok_szama'] == $value[0]) {
                        echo '<option selected value="' . $value[0] . '">' . $value[0] . '</option>';
                    } else {
                        echo '<option value="' . $value[0] . '">' . $value[0] . '</option>';
                    }
                }
                ?>
            </select>
        </div>
    </div>
    <div class="row">
        <div class="mb-3 col-6">
            <label for="ar">Ár:</label>
            <input type="text" class="form-control" name="ar" id="ar" required>
        </div>
    </div>

    <button type="submit" class="col-1,5 mx-auto btn btn-outline-primary" name="autoFeltoltese" value="true">Adatok feltöltése</button>
</form>
