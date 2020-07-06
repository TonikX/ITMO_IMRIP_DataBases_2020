<html>
    <head>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="style.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script src="script.js"></script>
    </head>
    <body>
        <h3>1. Вывести успеваемость класса по конкретному предмету в выбранной четверти</h3>
        <?php
            $dbuser = 'fowku';
            $dbpass = '203400';
            $host = 'localhost';
            $dbname = 'School';

            try {
                $dbh = new PDO("pgsql:host=$host;dbname=$dbname", $dbuser, $dbpass);
            } catch (PDOException $e) {
                echo $e->getMessage();
            }

            $sql = '
            SELECT
                S.name as name,
                S.surname as surname,
                C.name as course,
                Cl.name as class,
                M.module as module,
                M.mark as mark
            FROM
                hmm."Student" S
                JOIN hmm."Class" Cl ON S.class_id = Cl.id,
                hmm."Course" C,
                hmm."Mark" M
            WHERE
                S.id = M.student_id
                and M.course_id = C.id
                and Cl.name = \'3В\'
                and M.module = 2
                and C.name = \'Русский язык\'
            ORDER BY
                M.module,
                M.mark desc
            ';
            $result = $dbh->query($sql);
            $result->setFetchMode(PDO::FETCH_ASSOC);
        ?>
        <table class="table table-sm table-striped mb-5">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Имя</th>
                    <th scope="col">Фамилия</th>
                    <th scope="col">Курс</th>
                    <th scope="col">Класс</th>
                    <th scope="col">Четверть</th>
                    <th scope="col">Оценка</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result->fetch()): ?>
                    <tr>
                        <td><?php echo $row['name'] ?></td>
                        <td><?php echo $row['surname'] ?></td>
                        <td><?php echo $row['course'] ?></td>
                        <td><?php echo $row['class'] ?></td>
                        <td><?php echo $row['module'] ?></td>
                        <td><?php echo $row['mark'] ?></td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>

        <h3>2. Какие уроки в понедельник у Кира Колобова? (каким уроком, во сколько, в каком кабинете, кто ведет)</h3>
        <?php
            $sql = '
            SELECT
                S.course_number as course_number,
                C.name as course,
                S.time as time,
                CL.number as cabinet,
                CONCAT(T.name, \' \', T.surname) as teacher
            FROM
                hmm."Schedule" S
                JOIN hmm."Course" C ON S.course_id = C.id
                JOIN hmm."Classroom" CL ON S.classroom_id = CL.id
                JOIN hmm."Teacher" T ON S.teacher_id = T.id,
                hmm."Student" ST
            WHERE
                ST.name = \'Кир\'
                and ST.surname = \'Колобов\'
                and S.day = \'monday\'
            ORDER BY
                S.course_number
            ';
            $result = $dbh->query($sql);
            $result->setFetchMode(PDO::FETCH_ASSOC);
        ?>
        <table class="table table-sm table-striped mb-5">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Номер урока</th>
                    <th scope="col">Урок</th>
                    <th scope="col">Время</th>
                    <th scope="col">Кабинет</th>
                    <th scope="col">Учитель</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result->fetch()): ?>
                    <tr>
                        <td><?php echo $row['course_number'] ?></td>
                        <td><?php echo $row['course'] ?></td>
                        <td><?php echo $row['time'] ?></td>
                        <td><?php echo $row['cabinet'] ?></td>
                        <td><?php echo $row['teacher'] ?></td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>

        <h3>3. Вывести всех мальчиков 7Б</h3>
        <?php
            $sql = '
            SELECT
                S.name as name,
                S.surname as surname,
                S.date_of_birth as date,
                S.sex as sex
            FROM
                hmm."Student" S
                JOIN hmm."Class" C ON S.class_id = C.id
            WHERE
                C.name = \'7Б\'
                and S.sex = \'male\'
            ORDER BY
                S.surname,
                S.name,
                S.date_of_birth,
                S.sex
            ';
            $result = $dbh->query($sql);
            $result->setFetchMode(PDO::FETCH_ASSOC);
        ?>
        <table class="table table-sm table-striped mb-5">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Имя</th>
                    <th scope="col">Фамилия</th>
                    <th scope="col">Дата рождения</th>
                    <th scope="col">Пол</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result->fetch()): ?>
                    <tr>
                        <td><?php echo $row['name'] ?></td>
                        <td><?php echo $row['surname'] ?></td>
                        <td><?php echo $row['date'] ?></td>
                        <td><?php echo $row['sex'] ?></td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>

        <h3>4. Вывести все общие курсы и их учителей</h3>
        <?php
            $sql = '
            SELECT
                C.name as course,
                CONCAT(T.name, \' \', T.surname) as teacher
            FROM
                hmm."Schedule" S
                JOIN hmm."Course" C ON S.course_id = C.id
                JOIN hmm."Teacher" T ON S.teacher_id = T.id
            WHERE
                C.type = \'common\'
            ORDER BY
                C.name
            ';
            $result = $dbh->query($sql);
            $result->setFetchMode(PDO::FETCH_ASSOC);
        ?>
        <table class="table table-sm table-striped mb-5">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Курс</th>
                    <th scope="col">Учитель</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result->fetch()): ?>
                    <tr>
                        <td><?php echo $row['course'] ?></td>
                        <td><?php echo $row['teacher'] ?></td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>

        <h3>5. Вывести кабинет и закрепленного за ним учителя</h3>
        <?php
            $sql = '
            SELECT
                C.number as cabinet,
                CONCAT(T.name, \' \', T.surname) as teacher
            FROM
                hmm."Classroom" C
                JOIN hmm."Teacher" T ON C.teacher_id = T.id
            ORDER BY
                C.number
            ';
            $result = $dbh->query($sql);
            $result->setFetchMode(PDO::FETCH_ASSOC);
        ?>
        <table class="table table-sm table-striped mb-5">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Кабинет</th>
                    <th scope="col">Учитель</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result->fetch()): ?>
                    <tr>
                        <td><?php echo $row['cabinet'] ?></td>
                        <td><?php echo $row['teacher'] ?></td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>

        <h2>Student</h2>
        <?php
            $sql = 'SELECT * FROM hmm."Student"';
            $result = $dbh->query($sql);
            $result->setFetchMode(PDO::FETCH_ASSOC);
        ?>

        <table class="table table-sm table-striped">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Имя</th>
                    <th scope="col">Фамилия</th>
                    <th scope="col">Дата рождения</th>
                    <th scope="col">Пол</th>
                    <th scope="col">ID класса</th>
                    <th scope="col"></th>
                    <th scope="col"></th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result->fetch()): ?>
                    <tr>
                        <td><?php echo $row['id'] ?></td>
                        <td><?php echo $row['name'] ?></td>
                        <td><?php echo $row['surname'] ?></td>
                        <td><?php echo $row['date_of_birth'] ?></td>
                        <td><?php echo $row['sex'] ?></td>
                        <td><?php echo $row['class_id'] ?></td>
                        <td>
                            <button type="submit" name="submit" class="btn btn-primary" data-toggle="modal" data-target="#updateModal" onclick="onEditRow(event)">Редактировать</button>
                        </td>
                        <td>
                            <form action='delete.php?id="<?php echo $row['id']; ?>"' method="post">
                                <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                                <button type="submit" name="submit" class="btn btn-danger">Удалить</button>
                            </form>
                        </td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>

        <!-- Insert button -->
        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#insertModal">
            Добавить запись
        </button>

        <!-- Insert modal -->
        <form action="insert.php" method="post">
            <div class="modal fade" id="insertModal" tabindex="-1" role="dialog" aria-labelledby="insertModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="insertModalLabel">Добавить новую запись</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="insertStudentId">ID</label>
                                <input type="number" class="form-control" id="insertStudentId" name="id" required>
                            </div>
                            <div class="form-group">
                                <label for="insertStudentName">Имя</label>
                                <input type="text" class="form-control" id="insertStudentName" name="name" required>
                            </div>
                            <div class="form-group">
                                <label for="insertStudentSurname">Фамилия</label>
                                <input type="text" class="form-control" id="insertStudentSurname" name="surname" required>
                            </div>
                            <div class="form-group">
                                <label for="insertStudentBirth">Дата рождения</label>
                                <input type="text" class="form-control" id="insertStudentBirth" name="date_of_birth" required>
                            </div>
                            <div class="form-group">
                                <label for="insertStudentSex">Пол</label>
                                <select class="form-control custom-select" name="sex" id="insertStudentSex">
                                    <option value="male">male</option>
                                    <option value="female">female</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="insertClassId">ID класса</label>
                                <input type="number" class="form-control" id="insertClassId" name="class_id" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Закрыть</button>
                            <button type="submit" class="btn btn-success">Добавить</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <!-- Edit modal -->
        <form action="update.php" method="post">
            <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="updateModalLabel">Редактировать запись</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="studentId">ID</label>
                                <input readonly type="number" class="form-control" id="studentId" name="id" required>
                            </div>
                            <div class="form-group">
                                <label for="studentName">Имя</label>
                                <input type="text" class="form-control" id="studentName" name="name" required>
                            </div>
                            <div class="form-group">
                                <label for="studentSurname">Фамилия</label>
                                <input type="text" class="form-control" id="studentSurname" name="surname" required>
                            </div>
                            <div class="form-group">
                                <label for="studentBirth">Дата рождения</label>
                                <input type="text" class="form-control" id="studentBirth" name="date_of_birth" required>
                            </div>
                            <div class="form-group">
                                <label for="studentSex">Пол</label>
                                <select class="form-control custom-select" name="sex" id="studentSex">
                                    <option value="male">male</option>
                                    <option value="female">female</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="studentClassId">ID класса</label>
                                <input type="number" class="form-control" id="studentClassId" name="class_id" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Закрыть</button>
                            <button type="submit" class="btn btn-success">Сохранить</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>

    </body>
 </html>