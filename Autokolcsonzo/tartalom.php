<?php

switch ($menu) {
    case 'login':
        require_once './pages/login.php';
        break;
    case 'register':
        require_once './pages/register.php';
        break;
    case 'logout':
        require_once './pages/logout.php';
        break;
    case 'autok':
        require_once './pages/autok.php';
        break;  
    case 'fooldal':
        require_once 'index.php';
        break;
    case 'auto_feltoltese':
        require_once './pages/auto_feltoltese.php';
        break;
    case 'cart':
        require_once './pages/cart.php';
        break;
    case 'home':
        if ($id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT)) {
            require_once './pages/kivalasztottAuto.php';
        } else {
            require_once './pages/home.php';
        }
        break;
    default:
        require_once './pages/home.php';
        break;
}