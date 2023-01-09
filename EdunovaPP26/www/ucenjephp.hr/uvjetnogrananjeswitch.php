<?php
// switch je višestruko grananje

$grad='Osijek';
$ocjena=0;
switch($grad){
    case 'Zagreb':
        $ocjena=1;
        break;
    case 'Split':
        $ocjena=2;
        break;
    case 'Osijek':
    case 'Valpovo':
        $ocjena=5;
        break;
    default: // nije niti jedan od prethodno navedenih case
       // $ocjena='Nedefiniran'; // loša strana PHP-a
       $ocjena=-1;
}

echo $ocjena;
