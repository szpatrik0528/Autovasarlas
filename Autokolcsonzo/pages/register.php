<?php
if (filter_input(INPUT_POST, "regisztraciosAdatok", FILTER_VALIDATE_BOOLEAN, FILTER_NULL_ON_FAILURE)) {
    $error = false;
    $errormessage = "";
    $password = filter_input(INPUT_POST, "password");
    $password2 = filter_input(INPUT_POST, "password2");
    $username = htmlspecialchars(filter_input(INPUT_POST, "username"));
    $fullname = htmlspecialchars(filter_input(INPUT_POST, "fullname"));
    if ($password != $password2) {
        $error = true;
        $errormessage .= '<p>Nem egyeznek a jelszavak!</p>';
    } else if ($username == null) {
        $error = true;
        $errormessage .= '<p>Nem megfelelő felhasználónév</p>';
    }
    if ($error) {
        echo $errormessage;
    } else {
        //-- regisztrációs adatok kiírása
        $db->register($fullname,$username, $password);
        header("Location:index.php"); //-- átvált a nyitólapra
    }
}
?>
<div class="col-8 mt-4 mx-auto">
    <form action="#" method="post" class="row needs-validation" novalidate>
        <div class="mb-3">
            <label for="fullname" class="form-label">Felhasználó teljes neve</label>
            <input type="text" class="form-control" id="fullname" name="fullname" minlength="3" maxlength="50" aria-describedby="felhasznalonevHelp" required>
            <div class="invalid-feedback">Kérem ellenőrízze a beírt nevet!</div>
        </div>
        <div class="mb-3">
            <label for="username" class="form-label">Felhasználó név</label>
            <input type="text" class="form-control" id="username" name="username" aria-describedby="usernameHelp" required>
            <div id="usernameHelp" class="form-text">Bejelentkezéshez használt azonosító.</div>
        </div>
        <div class="row">
            <div class="mb-3 col-6">
                <label for="password" class="form-label">Jelszó</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <div class="mb-3 col-6">
                <label for="password2" class="form-label">Jelszó még egyszer</label>
                <input type="password" class="form-control" id="password2" name="password2" required>
            </div>
        </div>
        <button type="submit" class="col-2 mx-auto btn btn-outline-primary" name="regisztraciosAdatok" value="true">Regisztráció</button>
    </form>
</div>