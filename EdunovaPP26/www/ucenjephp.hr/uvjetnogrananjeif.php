<?php
// ako PHP datoteka nema HTML oznake ne moramo stavljati upitnik znak veće

$uvjet=true;
// if radi s boolean tipom podatka
// minimalna sintaksa if naredbe
if($uvjet){
    // ako je rezultat true ulazi u if granu
    echo '1', '<br>';
}


// loša praksa
if($uvjet)
    echo '2', '<br>'; //kada nema {} if se odnosi samo na prvu liniju nakon if
    echo '3', '<br>'; // ova linija nije pod if naredbom

// puna sintaksa if naredbe 
if($uvjet){
    echo '4', '<br>';
}else{
    echo  '5', '<br>';
}


// uobičajni način rada s if
$i=10;
if($i>0){
    echo  '6', '<br>';
}

$uvjet = $i>0;
if($uvjet){
    echo  '7', '<br>';
}


// logički operatori & (i, and) | (ili, or) ! (ne, not)

$i=2; $j=4;
// & provjerava oba uvjeta
if($i===2 & $j===4){
    echo  '8', '<br>';
}

$i=3;
// && u slučaju da se prvi uvjet NE ispunjava 
// drugi uvjet se NE provjerava
if($i===2 && $j===4){
    echo  '9', '<br>';
}


$i=2; $j=1;
// | provjerava oba uvjeta
if($i>0 | $j<2){
    echo  '10', '<br>';
}

$i=2; $j=1;
// || u slučaju da je prvi uvjet zadovoljen
// drugi uvjet se ne provjerava
if($i>0 || $j<2){
    echo  '11', '<br>';
}

if(!($i>4 && $j>0)){
    echo  '12', '<br>';
}

//ugnježđivanje
if($i>0){
    if($j>0){
        echo  '13', '<br>';
    }
}

// if else if

if($i===1){
    echo  '14', '<br>';
}else if($i===2){
    echo  '15', '<br>';
}else{
    echo  '16', '<br>';
}


$godine=19;

// u slučaju kada imam istu akciju u if i else grani mogu koristiti inline if
// inline if mora obavezno imati if i else granu
if($godine>=18){
    echo 'Punoljetan' , '<br>';
}else{
    echo 'Maloljetan' , '<br>';
}

// inline if
echo $godine>=18 ? 'Punoljetan' : 'Maloljetan', '<br>';


if(isset($_GET['broj'])){
    echo $_GET['broj'], '<br>';
}else{
    echo 'Postavite GET parametar broj', '<br>';
}
// https://www.php.net/manual/en/function.isset.php
$b = isset($_GET['b']) ? $_GET['b'] : 0;


// mi smo sigurni da će postojati vrijednost u varijabli b
echo $b, '<br>';
