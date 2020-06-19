-- 1. Вывести, какой предмет будет в конкретном классе, в конкретный день на конкретном уроке
SELECT
    C.name as урок
FROM
    hmm."Schedule" S
    JOIN hmm."Course" C on S.course_id = C.id
WHERE
    S.classroom_id = 3
    and S.day = 'monday'
    and S.course_number = '2'
ORDER BY
    C.name 

-- 2. Вывести, сколько учителей преподает каждую из дисциплин
SELECT
    C.name as урок,
    count(teacher_id) as количество_учителей
FROM
    hmm."Course" C
    JOIN (
        SELECT
            teacher_id,
            course_id
        FROM
            hmm."Schedule"
        GROUP BY
            teacher_id,
            course_id
    ) X ON C.id = X.course_id
GROUP BY
    C.name,
    C.id
ORDER BY
    C.name 

-- 3. Вывести успеваемость класса по конкретному предмету в выбранной четверти
SELECT
    S.name as имя,
    S.surname as фамилия,
    C.name as курс,
    Cl.name as класс,
    M.module as четверть,
    M.mark as оценка
FROM
    hmm."Student" S
    JOIN hmm."Class" Cl ON S.class_id = Cl.id,
    hmm."Course" C,
    hmm."Mark" M
WHERE
    S.id = M.student_id
    and M.course_id = C.id
    and Cl.name = '3В'
    and M.module = 2
    and C.name = 'Русский язык'
ORDER BY
    M.module,
    M.mark desc 

-- 4. Какие уроки в понедельник у Кира Колобова, каким уроком, во сколько, в каком кабинете, кто ведет
SELECT
    S.course_number as номер_урока,
    C.name as урок,
    S.time as время,
    CL.number as кабинет,
    CONCAT(T.name, ' ', T.surname) as учитель
FROM
    hmm."Schedule" S
    JOIN hmm."Course" C ON S.course_id = C.id
    JOIN hmm."Classroom" CL ON S.classroom_id = CL.id
    JOIN hmm."Teacher" T ON S.teacher_id = T.id,
    hmm."Student" ST
WHERE
    ST.name = 'Кир'
    and ST.surname = 'Колобов'
    and S.day = 'monday'
ORDER BY
    S.course_number 

-- 5. Вывести всех мальчиков 7Б
SELECT
    S.name as имя,
    S.surname as фамилия,
    S.date_of_birth as дата_рождения,
    S.sex as пол
FROM
    hmm."Student" S
    JOIN hmm."Class" C ON S.class_id = C.id
WHERE
    C.name = '7Б'
    and S.sex = 'male'
ORDER BY
    S.surname,
    S.name,
    S.date_of_birth,
    S.sex 

-- 6. Вывести все общие курсы и их учителей
SELECT
    C.name,
    CONCAT(T.name, ' ', T.surname)
FROM
    hmm."Schedule" S
    JOIN hmm."Course" C ON S.course_id = C.id
    JOIN hmm."Teacher" T ON S.teacher_id = T.id
WHERE
    C.type = 'common'
ORDER BY
    C.name 

-- 7. Вывести все дополнительные курсы и их учителей
SELECT
    C.name,
    CONCAT(T.name, ' ', T.surname)
FROM
    hmm."Schedule" S
    JOIN hmm."Course" C ON S.course_id = C.id
    JOIN hmm."Teacher" T ON S.teacher_id = T.id
WHERE
    C.type = 'extra'
ORDER BY
    C.name 

-- 8. Вывести кабинеты и закрепленных за ними учителей
SELECT
    C.number as кабинет,
    CONCAT(T.name, ' ', T.surname) as учитель
FROM
    hmm."Classroom" C
    JOIN hmm."Teacher" T ON C.teacher_id = T.id
ORDER BY
    C.number 

-- 9. Вывести классных руководителей каждого класса
SELECT
    C.name as класс,
    CONCAT(T.name, ' ', T.surname) as классный_руководитель
FROM
    hmm."Class" C
    JOIN hmm."Teacher" T ON C.teacher_id = T.id 

-- 10. Вывести курсы, которые проходят в кабинете 365
SELECT
    CO.name
FROM
    hmm."Schedule" S
    JOIN hmm."Classroom" C ON S.classroom_id = C.id
    JOIN hmm."Course" CO ON S.course_id = CO.id
WHERE
    C.number = 365