<?php
if (filter_input(INPUT_POST, 'belepesiAdatok', FILTER_VALIDATE_BOOLEAN, FILTER_NULL_ON_FAILURE)) {
    $username = htmlspecialchars(filter_input(INPUT_POST, 'username'));
    $password = htmlspecialchars(filter_input(INPUT_POST, 'password'));
    
    if ($db->login($username, $password)) {
        $_SESSION['login'] = true;
        $_SESSION['username'] = $username; 
        $_SESSION['password'] = $password; // Set the password in the session (not recommended in a real application)
        header("Location: index.php");
    }
}
?>

<div class="container">
    <form action="#" method="post" class="mx-auto">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <div class="mb-2">
                    <label for="username" class="form-label">Felhasználó név</label>
                    <input type="text" class="form-control" id="username" name="username" minlength="5" maxlength="50" aria-describedby="emailHelp">
                </div>
                <div class="mb-2">
                    <label for="password" class="form-label">Jelszó</label>
                    <input type="password" class="form-control" id="password" minlength="2" name="password">
                </div>
                <button type="submit" class="btn btn-primary" name="belepesiAdatok" value="true">Belépés</button>
            </div>
            <div class="col-md-4"></div>
        </div>
    </form>
</div>
