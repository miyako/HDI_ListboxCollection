//%attributes = {"invisible":true}
#DECLARE($item : Object)->$meta : Object

Case of 
	: (OB Get type:C1230($item; "attribute2")=Is boolean:K8:9)
		$meta:=New object:C1471("fill"; Form.metaBooleanFill)
		
	: (OB Get type:C1230($item; "attribute2")=Is text:K8:3)
		$meta:=New object:C1471("cell"; New object:C1471("colAttribute2"; New object:C1471("fill"; Form.metaTextFill)))
		
	Else 
		$meta:=New object:C1471()
		
End case 
