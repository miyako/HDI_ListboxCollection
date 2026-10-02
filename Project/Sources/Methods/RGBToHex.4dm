//%attributes = {"invisible":true}
#DECLARE($rgb : Integer)->$result : Text

var $digits : Text
$digits:="0123456789ABCDEF"

var $i; $value : Integer
$result:="#"
For ($i; 16; 0; -8)
	$value:=($rgb >> $i) & 0x00FF
	$result:=$result+$digits[[($value\16)+1]]+$digits[[($value%16)+1]]
End for 
