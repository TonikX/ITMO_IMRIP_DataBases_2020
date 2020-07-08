<?php
    session_start();
?>
<html>
    <head>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="../style.css">
    </head>
    <body>
        <h2>Площадь прямоугольного треугольника</h2>
        <img class="w-25" src="triangle.png" alt="Прямоугольный треугольник">

        <form class="w-50" action="find.php" method="post">
            <div class="form-group">
                <label for="a">значение a:</label>
                <input type="number" class="form-control" id="a" name="a" required>
            </div>
            <div class="form-group">
                <label for="c">значение c:</label>
                <input type="number" class="form-control" id="c" name="c" required>
            </div>
            <button type="submit" class="btn btn-primary">Посчитать</button>
        </form>
    </body>
</html>