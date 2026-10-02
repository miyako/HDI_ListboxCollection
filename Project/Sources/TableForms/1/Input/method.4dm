Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		If (Read only state:C362([INFO:1]))
			READ WRITE:C146([INFO:1])
			LOAD RECORD:C52([INFO:1])
		End if 
		
End case 