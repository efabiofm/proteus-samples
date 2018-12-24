
; PICBASIC PRO(TM) Compiler 2.60, (c) 1998, 2009 microEngineering Labs, Inc. All Rights Reserved. 
_USED			EQU	1

	INCLUDE	"C:\PBP\16F870.INC"


; Define statements.
#define		CODE_SIZE		 2

RAM_START       		EQU	00020h
RAM_END         		EQU	000BFh
RAM_BANKS       		EQU	00002h
BANK0_START     		EQU	00020h
BANK0_END       		EQU	0007Fh
BANK1_START     		EQU	000A0h
BANK1_END       		EQU	000BFh
EEPROM_START    		EQU	02100h
EEPROM_END      		EQU	0213Fh

R0              		EQU	RAM_START + 000h
R1              		EQU	RAM_START + 002h
R2              		EQU	RAM_START + 004h
R3              		EQU	RAM_START + 006h
R4              		EQU	RAM_START + 008h
R5              		EQU	RAM_START + 00Ah
R6              		EQU	RAM_START + 00Ch
R7              		EQU	RAM_START + 00Eh
R8              		EQU	RAM_START + 010h
FLAGS           		EQU	RAM_START + 012h
GOP             		EQU	RAM_START + 013h
RM1             		EQU	RAM_START + 014h
RM2             		EQU	RAM_START + 015h
RR1             		EQU	RAM_START + 016h
RR2             		EQU	RAM_START + 017h
T1              		EQU	RAM_START + 018h
_tiempo          		EQU	RAM_START + 01Ah
_delay           		EQU	RAM_START + 01Ch
_num             		EQU	RAM_START + 01Dh
_repet           		EQU	RAM_START + 01Eh
_x               		EQU	RAM_START + 01Fh
_y               		EQU	RAM_START + 020h
_PORTL           		EQU	 PORTB
_PORTH           		EQU	 PORTC
_TRISL           		EQU	 TRISB
_TRISH           		EQU	 TRISC
_display         		EQU	 PORTA
#define _boton           	_PORTC??7
#define _PORTC??7        	 PORTC, 007h
	INCLUDE	"ANIMAC~1.MAC"
	INCLUDE	"C:\PBP\PBPPIC14.LIB"

	MOVE?CB	000h, TRISA
	MOVE?CB	000h, TRISB
	MOVE?CB	080h, TRISC
	MOVE?CW	000h, _tiempo
	MOVE?CB	00Ah, _repet
	MOVE?CB	005h, _delay
	MOVE?CB	000h, PORTB
	MOVE?CB	000h, PORTC
	MOVE?CB	009h, _num

	LABEL?L	_inicio	
	MOVE?CB	081h, PORTB
	MOVE?CB	07Bh, PORTC
	PAUSE?B	_delay
	MOVE?CB	082h, PORTB
	MOVE?CB	00Dh, PORTC
	PAUSE?B	_delay
	MOVE?CB	084h, PORTB
	MOVE?CB	060h, PORTC
	PAUSE?B	_delay
	MOVE?CB	088h, PORTB
	MOVE?CB	00Dh, PORTC
	PAUSE?B	_delay
	MOVE?CB	090h, PORTB
	MOVE?CB	07Bh, PORTC
	PAUSE?B	_delay
	CMPEQ?TCL	_boton, 000h, _semaforo
	GOTO?L	_inicio

	LABEL?L	_semaforo	
	MOVE?CB	001h, _x
	LABEL?L	L00001	
	MUL?BCW	_repet, 008h, T1
	CMPGT?BWL	_x, T1, L00002
	MOVE?CB	081h, PORTB
	MOVE?CB	07Bh, PORTC
	PAUSE?B	_delay
	MOVE?CB	082h, PORTB
	MOVE?CB	00Dh, PORTC
	PAUSE?B	_delay
	MOVE?CB	084h, PORTB
	MOVE?CB	060h, PORTC
	PAUSE?B	_delay
	MOVE?CB	088h, PORTB
	MOVE?CB	00Dh, PORTC
	PAUSE?B	_delay
	MOVE?CB	090h, PORTB
	MOVE?CB	07Bh, PORTC
	PAUSE?B	_delay
	NEXT?BCL	_x, 001h, L00001
	LABEL?L	L00002	
	MOVE?CB	001h, _x
	LABEL?L	L00003	
	CMPGT?BCL	_x, 002h, L00004
	MOVE?CB	001h, _y
	LABEL?L	L00005	
	CMPGT?BBL	_y, _repet, L00006
	MOVE?CB	001h, PORTB
	MOVE?CB	07Bh, PORTC
	PAUSE?B	_delay
	MOVE?CB	002h, PORTB
	MOVE?CB	00Dh, PORTC
	PAUSE?B	_delay
	MOVE?CB	004h, PORTB
	MOVE?CB	060h, PORTC
	PAUSE?B	_delay
	MOVE?CB	008h, PORTB
	MOVE?CB	00Dh, PORTC
	PAUSE?B	_delay
	MOVE?CB	010h, PORTB
	MOVE?CB	07Bh, PORTC
	PAUSE?B	_delay
	NEXT?BCL	_y, 001h, L00005
	LABEL?L	L00006	
	MOVE?CB	001h, _y
	LABEL?L	L00007	
	CMPGT?BBL	_y, _repet, L00008
	MOVE?CB	081h, PORTB
	MOVE?CB	07Bh, PORTC
	PAUSE?B	_delay
	MOVE?CB	082h, PORTB
	MOVE?CB	00Dh, PORTC
	PAUSE?B	_delay
	MOVE?CB	084h, PORTB
	MOVE?CB	060h, PORTC
	PAUSE?B	_delay
	MOVE?CB	088h, PORTB
	MOVE?CB	00Dh, PORTC
	PAUSE?B	_delay
	MOVE?CB	090h, PORTB
	MOVE?CB	07Bh, PORTC
	PAUSE?B	_delay
	NEXT?BCL	_y, 001h, L00007
	LABEL?L	L00008	
	NEXT?BCL	_x, 001h, L00003
	LABEL?L	L00004	
	MOVE?CB	001h, _y
	LABEL?L	L00009	
	CMPGT?BBL	_y, _repet, L00010
	MOVE?CB	001h, PORTB
	MOVE?CB	07Bh, PORTC
	PAUSE?B	_delay
	MOVE?CB	002h, PORTB
	MOVE?CB	00Dh, PORTC
	PAUSE?B	_delay
	MOVE?CB	004h, PORTB
	MOVE?CB	060h, PORTC
	PAUSE?B	_delay
	MOVE?CB	008h, PORTB
	MOVE?CB	00Dh, PORTC
	PAUSE?B	_delay
	MOVE?CB	010h, PORTB
	MOVE?CB	07Bh, PORTC
	PAUSE?B	_delay
	NEXT?BCL	_y, 001h, L00009
	LABEL?L	L00010	
	MOVE?CB	001h, _y
	LABEL?L	L00011	
	MUL?BCW	_repet, 003h, T1
	CMPGT?BWL	_y, T1, L00012
	MOVE?CB	041h, PORTB
	MOVE?CB	07Bh, PORTC
	PAUSE?B	_delay
	MOVE?CB	042h, PORTB
	MOVE?CB	00Dh, PORTC
	PAUSE?B	_delay
	MOVE?CB	044h, PORTB
	MOVE?CB	060h, PORTC
	PAUSE?B	_delay
	MOVE?CB	048h, PORTB
	MOVE?CB	00Dh, PORTC
	PAUSE?B	_delay
	MOVE?CB	050h, PORTB
	MOVE?CB	07Bh, PORTC
	PAUSE?B	_delay
	NEXT?BCL	_y, 001h, L00011
	LABEL?L	L00012	
	MOVE?BB	_num, _display

	LABEL?L	_animacion	
	MOVE?CB	001h, _x
	LABEL?L	L00013	
	CMPGT?BBL	_x, _repet, L00014
	MOVE?CB	021h, PORTB
	MOVE?CB	01Eh, PORTC
	PAUSE?B	_delay
	MOVE?CB	022h, PORTB
	MOVE?CB	06Dh, PORTC
	PAUSE?B	_delay
	MOVE?CB	024h, PORTB
	MOVE?CB	070h, PORTC
	PAUSE?B	_delay
	MOVE?CB	028h, PORTB
	MOVE?CB	06Dh, PORTC
	PAUSE?B	_delay
	MOVE?CB	030h, PORTB
	MOVE?CB	06Bh, PORTC
	PAUSE?B	_delay
	ADD?WCW	_tiempo, 019h, _tiempo
	GOSUB?L	_contador
	NEXT?BCL	_x, 001h, L00013
	LABEL?L	L00014	
	MOVE?CB	001h, _x
	LABEL?L	L00015	
	CMPGT?BBL	_x, _repet, L00016
	MOVE?CB	021h, PORTB
	MOVE?CB	07Dh, PORTC
	PAUSE?B	_delay
	MOVE?CB	022h, PORTB
	MOVE?CB	00Bh, PORTC
	PAUSE?B	_delay
	MOVE?CB	024h, PORTB
	MOVE?CB	060h, PORTC
	PAUSE?B	_delay
	MOVE?CB	028h, PORTB
	MOVE?CB	05Bh, PORTC
	PAUSE?B	_delay
	MOVE?CB	030h, PORTB
	MOVE?CB	057h, PORTC
	PAUSE?B	_delay
	ADD?WCW	_tiempo, 019h, _tiempo
	GOSUB?L	_contador
	NEXT?BCL	_x, 001h, L00015
	LABEL?L	L00016	
	MOVE?CB	001h, _x
	LABEL?L	L00017	
	CMPGT?BBL	_x, _repet, L00018
	MOVE?CB	021h, PORTB
	MOVE?CB	07Fh, PORTC
	PAUSE?B	_delay
	MOVE?CB	022h, PORTB
	MOVE?CB	057h, PORTC
	PAUSE?B	_delay
	MOVE?CB	024h, PORTB
	MOVE?CB	000h, PORTC
	PAUSE?B	_delay
	MOVE?CB	028h, PORTB
	MOVE?CB	077h, PORTC
	PAUSE?B	_delay
	MOVE?CB	030h, PORTB
	MOVE?CB	07Fh, PORTC
	PAUSE?B	_delay
	ADD?WCW	_tiempo, 019h, _tiempo
	GOSUB?L	_contador
	NEXT?BCL	_x, 001h, L00017
	LABEL?L	L00018	
	MOVE?CB	001h, _x
	LABEL?L	L00019	
	CMPGT?BBL	_x, _repet, L00020
	MOVE?CB	021h, PORTB
	MOVE?CB	07Dh, PORTC
	PAUSE?B	_delay
	MOVE?CB	022h, PORTB
	MOVE?CB	00Bh, PORTC
	PAUSE?B	_delay
	MOVE?CB	024h, PORTB
	MOVE?CB	060h, PORTC
	PAUSE?B	_delay
	MOVE?CB	028h, PORTB
	MOVE?CB	05Bh, PORTC
	PAUSE?B	_delay
	MOVE?CB	030h, PORTB
	MOVE?CB	057h, PORTC
	PAUSE?B	_delay
	ADD?WCW	_tiempo, 019h, _tiempo
	GOSUB?L	_contador
	NEXT?BCL	_x, 001h, L00019
	LABEL?L	L00020	
	GOTO?L	_animacion

	LABEL?L	_contador	
	CMPNE?WCL	_tiempo, 003E8h, L00021
	SUB?BCB	_num, 001h, _num
	SUB?BCB	_repet, 001h, _repet
	MOVE?BB	_num, _display
	MOVE?CW	000h, _tiempo
	LABEL?L	L00021	
	CMPNE?BCL	_num, 000h, L00023
	MOVE?CB	009h, _num
	MOVE?CB	00Ah, _repet
	GOTO?L	_inicio
	LABEL?L	L00023	
	RETURN?	
	END?	

	END
