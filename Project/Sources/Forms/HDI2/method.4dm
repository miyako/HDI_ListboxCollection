Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		ARRAY TEXT:C222(_TabTitles; 0)
		ARRAY TEXT:C222(_Descriptions; 0)
		
		READ ONLY:C145([INFO:1])
		ALL RECORDS:C47([INFO:1])
		ORDER BY:C49([INFO:1]; [INFO:1]PageNumber:4; >)
		
		SELECTION TO ARRAY:C260([INFO:1]TabTitle:3; _TabTitles; [INFO:1]Description:2; _Descriptions)
		
		If (Is Windows:C1573)
			ST SET ATTRIBUTES:C1093(_Descriptions{1}; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 18)
		Else 
			ST SET ATTRIBUTES:C1093(_Descriptions{1}; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 20)
		End if 
		OBJECT Get pointer:C1124(Object named:K67:5; "information")->:=_Descriptions{1}
		
		UNLOAD RECORD:C212([INFO:1])
		
		C_COLLECTION:C1488(colName)
		colName:=New collection:C1472()
		colName.push("John")
		colName.push("Quinn")
		colName.push("Andi")
		colName.push("Emmerich")
		colName.push("Merrile")
		colName.push("Ferguson")
		colName.push("Emlynne")
		colName.push("Onfre")
		colName.push("Estele")
		colName.push("Kale")
		colName.push("Gail")
		colName.push("James")
		colName.push("Dale")
		colName.push("Emilia")
		colName.push("Yvon")
		colName.push("Catlin")
		colName.push("Lindsay")
		colName.push("Gretal")
		
		C_COLLECTION:C1488(myCollection)
		myCollection:=New collection:C1472
		For ($i; 1; 50; 4)
			myCollection.push(New object:C1471("attribute1"; $i; "attribute2"; Random:C100))
			
			myCollection.push(New object:C1471("attribute1"; $i+1; "attribute2"; colName[Random:C100%(colName.length-1)]))
			
			$tmpDate:=String:C10((Random:C100%28)+1)+"/"+String:C10((Random:C100%12)+1)+"/"+String:C10((Random:C100%20)+2010)
			myCollection.push(New object:C1471("attribute1"; $i+2; "attribute2"; Date:C102($tmpDate)))
			
			myCollection.push(New object:C1471("attribute1"; $i+3; "attribute2"; ((Random:C100%2) ?? 0)))
		End for 
		
		
	: (Form event code:C388=On Timer:K2:25)
		
		
		Case of 
			: (FORM Get current page:C276=2)
				C_BOOLEAN:C305($bVisible)
				$bVisible:=OBJECT Get visible:C1075(*; "@Listbox")
				
				OBJECT SET VISIBLE:C603(*; "@Listbox"; Not:C34($bVisible))
				OBJECT SET VISIBLE:C603(*; "@Column"; $bVisible)
				
			: (FORM Get current page:C276=3)
				C_BOOLEAN:C305($bVisible)
				$bVisible:=OBJECT Get visible:C1075(*; "@Multi")
				
				OBJECT SET VISIBLE:C603(*; "@Multi"; Not:C34($bVisible))
				OBJECT SET VISIBLE:C603(*; "@Single"; $bVisible)
				
		End case 
		
		
	: (Form event code:C388=On Page Change:K2:54)
		
		If (Is Windows:C1573)
			ST SET ATTRIBUTES:C1093(_Descriptions{_TabTitles}; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 14)
		Else 
			ST SET ATTRIBUTES:C1093(_Descriptions{_TabTitles}; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 16)
		End if 
		
		If (FORM Get current page:C276=6)
			OBJECT SET VISIBLE:C603(*; "information1"; True:C214)
			OBJECT SET VISIBLE:C603(*; "information"; False:C215)
			OBJECT Get pointer:C1124(Object named:K67:5; "information1")->:=_Descriptions{_TabTitles}
		Else 
			OBJECT SET VISIBLE:C603(*; "information"; True:C214)
			OBJECT SET VISIBLE:C603(*; "information1"; False:C215)
			OBJECT Get pointer:C1124(Object named:K67:5; "information")->:=_Descriptions{_TabTitles}
		End if 
		
		If ((FORM Get current page:C276=2) | (FORM Get current page:C276=3))
			SET TIMER:C645(180)
			
		Else 
			SET TIMER:C645(0)
		End if 
		
		If (FORM Get current page:C276=4)
			
			LISTBOX SELECT ROW:C912(*; "List box"; 6; lk replace selection:K53:1)
			LISTBOX SELECT ROW:C912(*; "List box"; 7; lk add to selection:K53:2)
			LISTBOX SELECT ROW:C912(*; "List box"; 8; lk add to selection:K53:2)
			LISTBOX SELECT ROW:C912(*; "List box"; 9; lk add to selection:K53:2)
			LISTBOX SELECT ROW:C912(*; "List box"; 11; lk add to selection:K53:2)
			LISTBOX SELECT ROW:C912(*; "List box"; 4; lk add to selection:K53:2)
		End if 
		
		
End case 

