<?php

// stranica prima dva broja putem GET parametara
// stranica ispisuje veći
// Ako su brojevi jednaki, stranica ispisuje: jednaki su
/*
$b1 = isset($_GET['b1']) ? $_GET['b1'] : 0;
$b2 = isset($_GET['b2']) ? $_GET['b2'] : 0;
if($b1===$b2){
    echo 'Jednaki su';
}else if($b1>$b2){
    echo $b1;
}else{
    echo $b2;
}
*/

// DOMAĆA ZADAĆA
// stranica prima TRI broja putem GET parametara
// stranica ispisuje najmanji broj
// Ako su svi brojevi jednaki, stranica ispisuje: jednaki su
$a = isset($_GET['a']) ? $_GET['a'] : 98;
$b = isset($_GET['b']) ? $_GET['b'] : 9999;
$c = isset($_GET['c']) ? $_GET['c'] : 9;

/*
Klasika

if(($a < $b) && ($a < $c)){
    echo $a, ' je najmanji broj';
}elseif (($b < $a) && ($b < $c)) {
    echo $b, ' je najmanji broj';
}elseif (($c < $a) && ($c < $a)) {
    echo $c, ' je najmanji broj';
}elseif (($b===$a) && ($b===$c) && ($c===$a)) {
    echo 'Svi brojevi su jednaki';
}*/

//S dodatnom varijablom
$i = $a;
if($i > $b){
    $i = $b;
}
if($i > $c){
    $i = $c;
    echo $i, ' je najmanji';
} 
if(($b===$a) && ($b===$c) && ($c===$a)){
    echo 'Brojevi su jednaki';
}
?>