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
    <button type="button" id="addToCart">Add to Cart</button>
    <div id="cart">
        <h3>Cart</h3>
        <ul id="cartItems">
            <!-- Cart items will be displayed here -->
        </ul>
    </div>
</form>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const cart = [];

        document.getElementById('addToCart').addEventListener('click', function () {
            const itemName = 'Product Name'; // Replace with the actual item name
            const itemPrice = 19.99; // Replace with the actual item price

            // Create an object to represent the item
            const item = {
                name: itemName,
                price: itemPrice
            };

            // Add the item to the cart
            cart.push(item);

            // Update the cart display
            updateCartDisplay();
        });

        function updateCartDisplay() {
            const cartItems = document.getElementById('cartItems');
            cartItems.innerHTML = ''; // Clear the current cart items

            cart.forEach(item => {
                const listItem = document.createElement('li');
                listItem.textContent = `${item.name} - $${item.price}`;
                cartItems.appendChild(listItem);
            });
        }
    });
</script>

