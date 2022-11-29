			.orig x3000
			LEA R0, PROMPT
			PUTS
			JSR GETALPHA ; EACH CALL TO GETALPHA GETS ONE CHARACTER
			JSR GETALPHA ;Calling it again gets a second character.
			HALT
PROMPT 	.stringz "Enter two letters: " ; Note there MUST be a single space after the :
;Your GETALPHA routine should follow.
GETALPHA	ST R7, GA_R7 ; Storing registers
			ST R6, GA_R6
			ST R5, GA_R5
			ST R4, GA_R4
			ST R3, GA_R3
			ST R1, GA_R1
TOP			GETC ; Get char from user
			Add R1, R0, #-10 ; Checking for new line
			BRZ END ; If newline found, then skip to end
			LD R1, GA_US ; Load r1 with underscore value
			Add R1, R0, R1
			BRZ PRINT ; Check if underscore, print if is. Ignore if not
			LD R3, GA_A ; Load registers with values for letters
			LD R4, GA_Z
			LD R5, GA_a
			LD R6, GA_z
			Add R1, R0, R3 ; Check if less than A
			BRN TOP ; Ask for new char if less than A
			Add R1, R0, R4
			BRNZ PRINT
			Add R1, R0, R5
			BRN TOP
			Add R1, R0, R6
			BRNZ PRINT
			BRNZP TOP
PRINT		OUT
END			LD R7, GA_R7
			LD R6, GA_R6
			LD R5, GA_R5
			LD R4, GA_R4
			LD R3, GA_R3
			LD R1, GA_R1
			RET
GA_R7		.fill 0
GA_R6		.fill 0
GA_R5		.fill 0
GA_R4		.fill 0
GA_R3		.fill 0
GA_R1		.fill 0
GA_US		.fill -95
GA_A		.fill -65
GA_Z		.fill -90
GA_a		.fill -97
GA_z		.fill -122