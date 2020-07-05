<html>

    <body>

        <h2> Select data </h2>

        <?php

        $dbh = new PDO('pgsql:host=localhost;port=5432;dbname=Luch;user=postgres;password=1995');

        $sql = "SELECT luch_schema.order.date_payment, client.full_name as client_name, content_order.service_id, worker.full_name as worker_name FROM luch_schema.order JOIN luch_schema.client ON luch_schema.order.client_id = client.id JOIN luch_schema.content_order ON luch_schema.order.id = content_order.order_id JOIN luch_schema.worker ON worker.id = content_order.worker_id JOIN luch_schema.price_list ON content_order.service_id = price_list.id WHERE luch_schema.order.status = 'paid';";
        $result = $dbh->query($sql);

        echo "<h3>Запрос 1. Список выполненных работ, фиксирующих дату оплаты заявки, заказчиков, код услуги, фамилию исполнителя</h3>";
        echo "<table>";
        echo "<tr>";
        echo "<th>date_payment</th>";
        echo "<th>client_name</th>";
        echo "<th>service_id</th>";
        echo "<th>worker_name</th>";
        echo "</tr>";
        while ($row = $result->fetch()) {
            echo "<tr>";
            echo "<td>" . $row['date_payment'] . "</td>";
            echo "<td>" . $row['client_name'] . "</td>";
            echo "<td>" . $row['service_id'] . "</td>";
            echo "<td>" . $row['worker_name'] . "</td>";
            echo "</tr>";
        }
        echo "</table>";

        $sql = "SELECT client.full_name as client_name, price_list.service, luch_schema.order.status FROM luch_schema.order join luch_schema.client on luch_schema.order.client_id = client.id join luch_schema.content_order on luch_schema.order.id = content_order.order_id join luch_schema.worker on worker.id = content_order.worker_id join luch_schema.price_list on content_order.service_id = price_list.id where content_order.date_forming between '2018-01-19' and '2018-01-25';";
        $result = $dbh->query($sql);

        echo "<h3>Запрос 2. Список платежных поручений, выставленных рекламодателям за любой промежуток времени, фиксирующий заказчика, услугу, состояние заявки (оплачено или нет)</h3>";
        echo "<table>";
        echo "<tr>";
        echo "<th>client_name</th>";
        echo "<th>service</th>";
        echo "<th>status</th>";
        echo "</tr>";
        while ($row = $result->fetch()) {
            echo "<tr>";
            echo "<td>" . $row['client_name'] . "</td>";
            echo "<td>" . $row['service'] . "</td>";
            echo "<td>" . $row['status'] . "</td>";
            echo "</tr>";
        }
        echo "</table>";

        $sql = "select service, price from luch_schema.price_list order by service;";
        $result = $dbh->query($sql);

        echo "<h3>Запрос 3. Просмотр номенклатуры рекламных услуг, предлагаемых агентством по видам услуг</h3>";
        echo "<table>";
        echo "<tr>";
        echo "<th>service</th>";
        echo "<th>price</th>";
        echo "</tr>";
        while ($row = $result->fetch()) {
            echo "<tr>";
            echo "<td>" . $row['service'] . "</td>";
            echo "<td>" . $row['price'] . "</td>";
            echo "</tr>";
        }
        echo "</table>";

        $sql = "select client.full_name as client_name, luch_schema.order.id from luch_schema.order join luch_schema.client on client.id = luch_schema.order.client_id join luch_schema.content_order on content_order.order_id = luch_schema.order.id where content_order.date_forming between '2018-01-19' and '2018-01-25'";
        $result = $dbh->query($sql);

        echo "<h3>Запрос 4. Список заявок, заключенных каждым отдельным заказчиком за любой промежуток времени</h3>";
        echo "<table>";
        echo "<tr>";
        echo "<th>client_name</th>";
        echo "<th>order_id</th>";
        echo "</tr>";
        while ($row = $result->fetch()) {
            echo "<tr>";
            echo "<td>" . $row['client_name'] . "</td>";
            echo "<td>" . $row['id'] . "</td>";
            echo "</tr>";
        }
        echo "</table>";

        $sql = "select worker.full_name as worker_name, count(content_order.order_id) from luch_schema.worker join luch_schema.content_order on worker.id = luch_schema.content_order.worker_id where content_order.date_forming between '2018-01-19' and '2018-01-25' group by worker.id";
        $result = $dbh->query($sql);

        echo "<h3>Запрос 5. Список сотрудников с указанием количества заявок, которые выполнял каждый сотрудник в заданный период</h3>";
        echo "<table>";
        echo "<tr>";
        echo "<th>worker_name</th>";
        echo "<th>count</th>";
        echo "</tr>";
        while ($row = $result->fetch()) {
            echo "<tr>";
            echo "<td>" . $row['worker_name'] . "</td>";
            echo "<td>" . $row['count'] . "</td>";
            echo "</tr>";
        }
        echo "</table>";

        ?>

        <h2> Add data </h2>

        <form action="add_service.php" method="post">
            <h3> Add service </h3>

            <table>
            <tr> <td> Service ID:   </td>  <td> <input type="text" name="id">       </td> </tr>
            <tr> <td> Service name: </td>  <td> <input type="text" name="service">  </td> </tr>
            <tr> <td> Price:        </td>  <td> <input type="text" name="price">    </td> </tr>
            </table>
            <input type="submit" value="Add">
        </form>

        <h2> Update or delete data </h2>

        <form action="update_or_delete_service.php" method="post">
            <h3> Update or delete service </h3>

            <?php

            $result = $dbh->query("SELECT * FROM luch_schema.price_list");

            echo "<table>";
            echo "<tr>";
            echo "<th>id</th>";
            echo "<th>service</th>";
            echo "<th>price</th>";
            echo "<th></th>";
            echo "<th></th>";
            echo "</tr>";

            while ($row = $result->fetch()) {
                $id = $row['id'];
                echo "<tr>";
                echo "<td>" . $id . "</td>";
                echo "<td>" . '<input type="text" name="EditService' . $id . '" value="' . $row['service'] . '"/>' . "</td>";
                echo "<td>" . '<input type="text" name="EditPrice'   . $id . '" value="' . $row['price']   . '"/>' . "</td>";
                echo "<td>" . '<input type="submit" name="Delete" value="Delete ' . $id . '"/>' . "</td>";
                echo "<td>" . '<input type="submit" name="Update" value="Update ' . $id . '"/>' . "</td>";
                echo "</tr>";
            }
            echo "</table>";

            ?>
        </form>

    </body>

</html>