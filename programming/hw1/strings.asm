.orig x3000
JSR TOUPPER
JSR TOUPPER ;Yes call it twice.
PUTS
HALT

FINDLAST ; Finds the last char of a string, points to an index 
	ST R1, FL_R1;store registers, think only r1 in this case
FL_TOP	LDR R1, R0, #0 ;load r0 in r1
	BRZ FL_END
	ADD R0, R0, #1
	BRNZP FL_TOP ;Increment r0 by 1 so we can check if the next char is last char
FL_END	ADD R0, R0, #-1 ;Point R0 at the char before the null terminator
	LD R1, FL_R1
	RET
FL_R1 .fill 0

FINDCHAR ;Finds whether a character in R0 exists within a String pointed to by R1
	ST	R1,FC_R1;Store registers!
	ST R2, FC_R2
	ST R3, FC_R3
	LD R3, FC_R3Z ;This is our counter so we can return index where char was found in string
	NOT R0, R0 ; Make R0 negative for comparison's sake
	ADD R0, R0, #1
FC_TOP	LDR R2, R1, #0 ;Ld R2 with char that R1 points at
	BRZ NOTFOUND ;If R1 is null, or reaches null, then should terminate and return -1
	ADD R2, R2, R0	;Compare R2 and R0
	BRZ FOUND
	ADD R3, R3, #1	;Increment the counter
	ADD R1, R1, #1
	BRNZP FC_TOP
NOTFOUND LD R0, NEG_1
	BRNZP FC_END
FOUND	ADD R0, R3, #0 ;Set R0 to equal the index value of string where char was found
FC_END ;Restore registers
	LD R1, FC_R1
	LD R2, FC_R2
	LD R3, FC_R3
	RET
FC_R3Z .fill 0
FC_R1 .fill 0
FC_R2 .fill 0
FC_R3 .fill 0
NEG_1 .fill -1

STRCAT	
	;Store registers
	ST R0, SC_R0
	ST R1, SC_R1
	ST R2, SC_R2
	ST R7, SC_R7
	JSR FINDLAST ;This should store the last index of string R0 is pointing at in R0.
	;IF GETTING ERRORS IT MIGHT BE BECAUSE R0 FIRST INDEX IS A NULL AS I'M ADDING ONE IN LINE BELOW.
SC_TOP	ADD R0,R0, #1 ;Now should be pointing at null terminator. UNLESS R0 IS NULL
	LDR R2, R1, #0 ; R2 should be the char stored at start of String in R1
	STR R2, R0, #0 ; Save R2 at R0 location
	BRZ SC_END		; If R1 string is null then should just finish up.
	ADD R1, R1, #1
	;BRZ SC_FINAL_CHAR ;If R1 pointing at null, then save null and end.
	BRNZP SC_TOP
;SC_FINAL_CHAR 
SC_END 	;LD registers
	
	;LD Registers
	LD R0, SC_R0
	LD R1, SC_R1
	LD R2, SC_R2
	LD R7, SC_R7
	RET

SC_R0 .fill 0
SC_R1 .fill 0
SC_R2 .fill 0
SC_R7 .fill 0

TOUPPER
	;Store registers
	ST R0, TU_R0
	ST R1, TU_R1
	ST R2, TU_R2
	ST R3, TU_R3
	ST R4, TU_R4
	LD R2, TU_a 
	LD R3, TU_z
TU_TOP	
	LDR R1, R0, #0 ;Load R1 with first char of string
	BRZ TU_END	;If empty string terminate the prog
	ADD R4, R1, R2
	BRN TU_INC ;If lower than a, move onto next char
	ADD R4, R1, R3 
	BRP TU_INC ;If greater than z, move onto next char
	ADD R1, R1, #-16
	ADD R1, R1, #-16 ;Should make R1 lowercase
	STR R1, R0, #0
TU_INC
	ADD R0, R0, #1
	BRNZP TU_TOP
TU_END 
	LD R0, TU_R0
	LD R1, TU_R1
	LD R2, TU_R2
	LD R3, TU_R3
	LD R4, TU_R4
	RET
TU_R0 .fill 0
TU_R1 .fill 0
TU_R2 .fill 0
TU_R3 .fill 0
TU_R4 .fill 0
TU_a .fill -97
TU_z .fill -122