<nav class="navbar navbar-expand-lg bg-body-secondary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img src="../img/menu.png" height="30">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.php">Főoldal</a>
                </li>
                <li class = "nav-item">
                    <a class = "nav-link hover-element" <?php ($menu == 'autok' ? ' active' : ''); ?> href = "index.php?menu=autok">Autók</a>
                </li>
                <?php
                if ($_SESSION['login']) {
                    echo '<li class = "nav-item hover-element">
                    <a class = "nav-link' . ($menu == 'auto_feltoltese' ? ' active' : '') . '" href = "index.php?menu=auto_feltoltese">Autó Feltöltése</a>
                </li>' . '<li class = "nav-item hover-element">
                            <a class = "nav-link' . ($menu == 'cart' ? ' active' : '') . '" href = "index.php?menu=cart">Kosár</a>
                        </li>' .'<li class = "nav-item hover-element">
                            <a class = "nav-link' . ($menu == 'logout' ? ' active' : '') . '" href = "index.php?menu=logout">Kilépés</a>
                        </li>';
                } else {
                    echo '<li class = "nav-item dropdown">
                    <a class = "nav-link dropdown-toggle" href = "#" role = "button" data-bs-toggle = "dropdown" aria-expanded = "false"> 
                    <i class="fa-regular fa-user fa-sm"></i></a>
                    <ul class = "dropdown-menu">
                    <li><a class = "dropdown-item' . ($menu == 'login' ? 'active' : '') . '"href = "index.php?menu=login">Belépés</a></li>
                    <li><a class = "dropdown-item' . ($menu == 'register' ? 'active' : '') . '"href = "index.php?menu=register">Regisztráció</a></li>
                    </ul>
                    </li>';
                }
                ?>

            </ul>

        </div>
    </div>
</nav>

<style>
    .nav-item .nav-link .dropdown-toggle{
        border: 1px solid black;
        border-radius: 15px;
        margin-left: 10px;
    }
    .hover-element {
        /* Define the default background color */
        background-color: transparent;
        border-radius: 10px;
        /* Add transitions for smooth color change */
        transition: background-color 0.3s;
    }

    .hover-element:hover {
        /* Define the background color when the mouse is over it */
        background-color: darkgrey;
        border-radius: 10px;
    }
    .navbar-expand-lg {
        padding: 10px;
    }

</style>