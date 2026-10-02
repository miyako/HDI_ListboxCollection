//%attributes = {}

C_OBJECT:C1216($oTmp)
$oTmp:=$1

Case of 
	: (OB Get type:C1230($oTmp; "attribute2")=Is boolean:K8:9)
		$0:=New object:C1471("fill"; "#e6ffff")
		
	: (OB Get type:C1230($oTmp; "attribute2")=Is text:K8:3)
		$0:=New object:C1471("cell"; New object:C1471("colAttribute2"; New object:C1471("fill"; "#ffffcc")))
		
	Else 
		$0:=New object:C1471()
		
End case 

