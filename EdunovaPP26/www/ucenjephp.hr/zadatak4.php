
<?php
// DOMAĆA ZADAĆA
// stranica prima TRI broja putem GET parametara
// stranica ispisuje najmanji broj
// Ako su svi brojevi jednaki, stranica ispisuje: jednaki su

$a = isset($_GET['a']) ? $_GET['a'] : 10;
$b = isset($_GET['b']) ? $_GET['b'] : 9;
$c = isset($_GET['c']) ? $_GET['c'] : 5;

/*
if(($a < $b) && ($a < $c)){
    echo $a, ' je najmanji broj';
}elseif (($b < $a) && ($b < $c)) {
    echo $b, ' je najmanji broj';
}elseif (($c < $a) && ($c < $a)) {
    echo $c, ' je najmanji broj';
}elseif (($b===$a) && ($b===$c) && ($c===$a)) {
    echo 'Svi brojevi su jednaki';
}*/

$i = $a;
if($i > $b){
    $i = $b;
}
if($i > $c){
    $i = $c;
} 

echo $i, ' je najmanji';