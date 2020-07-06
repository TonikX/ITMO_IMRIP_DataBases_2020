<?php
for($index = 0; $index < 5; $index ++)
{
    echo "Current loop counter ".$index.".\n";
}
?>

<?php
$index = 10;
while ($index >= 0)
{
    echo "The index is ".$index.".\n";
    $index--;
}
?>

<?php
$index = 3;
do
{
    // execute this at least 1 time
    echo "Index: ".$index.".\n"; 
    $index --;
}
while ($index > 0);
?>

<?php
function say_hello() {
  return "Hello!";
}

echo say_hello();
?>

<?php
$cars = array("Volvo", "BMW", "Toyota");
echo count($cars);
?>