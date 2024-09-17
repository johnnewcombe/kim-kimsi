; ROM ROUTINES **

AK      =  $1EFE          ; Check for key depressed. A non-zero: no key down. A equal 0, key down.
SCAND   =  $1F19          ; Display address and contents.
SCANDS  =  $1F1F          ; Output six hex characters on display. Stored in $00F9, $00FA, $00FB.
CONVD   =  $1F48          ; Output HEX digit
OUTPUT  =  $1F4E          ; Output 7 segment code stored in A register (to lit up a custom segment)
KEYIN   =  $1F40          ; Open up keyboard channel. Call before using GETKEY (or call SCANDS).
INCPT   =  $1F63          ; Increment display address.
GETKEY  =  $1F6A          ; Return key from keyboard. Value 0-F, 10(AD), 11(DA), 12(+), 13(GO), 14(PC), 15 (no keypress).
TABLE   =  $1FE7          ; Table of 7-segment patterns.
SAVE    =  $1C00          ; Normal interrupt entry point.
RST     =  $1C22          ; Reset return to monitor.
START   =  $1C4F          ; Return to monitor entry

; IO

SAD     = $1740           ; 6530 A DATA
PADD    = $1741           ; 6530 A DATA DIRECTION
SBD     = $1742           ; 6530 B DATA
PBDD    = $1743           ; 6530 B DATA DIRECTION
CLK1T   = $1744           ; DIV BY 1 TIME
CLK8T   = $1745           ; DIV BY 8 TIME
CLK64T  = $1746           ; DIV BY 64 TIME
CLKKT   = $1747           ; DIV BY 1024 TIME
CLKRDI  = $1747           ; READ TIME OUT BIT
CLKRDT  = $1746           ; READ TIME

; MPU REG SAVX AREA IN PAGE 0

PCL     = $EF             ; PROGRAM CNT LOW
PCH     = $F0             ; PROGRAM CNT HI
PREG    = $F1             ; CURRENT STATUS REG
SPUSER  = $F2             ; CURRENT STACK POINTER
ACC     = $F3             ; ACCUMULATOR
YREG    = $F4             ; Y INDEX
XREG    = $F5             ; X INDEX

    ;       KIM FIXED AREA IN PAGE 0

CHKHI   = $F6
CHKSUM  = $F7
INL     = $F8             ; INPUT BUFFER
INH     = $F9             ; INPUT BUFFER
POINTL  = $FA             ; LSB OF OPEN CELL
POINTH  = $FB             ; MSB OF OPEN CELL
TEMP    = $FC
TMPX    = $FD
CHAR    = $FE
MODE    = $FF

    ;       KIM FIXED AREA IN PAGE 23

CHKL    = $17E7
CHKH    = $17E8           ; CHKSUM
SAVX    = $17E9
VEB     = $17EC           ; VOLATILE EXECUTION BLOCK
CNTL30  = $17F2           ; TTY DELAY
CNTH30  = $17F3           ; TTY DELAY
TIMH    = $7F4
SAL     = $17F5           ; LOW STARTING ADDRESS
SAH     = $17F6           ; HI STARTING ADDRESS
EAL     = $17F7           ; LOW ENDING ADDRESS;
EAH     = $17F8           ; HI ENDING ADDRESS
ID      = $17F9           ; TAPE PROGRAM ID NUMBER

    ;       INTERRUPT VECTORS

NMIV    = $17FA           ; STOP VECTOR (STOP=1C00)
RSTV    = $17FC           ; RST VECTOR
IRQV    = $17FE           ; IRQ VECTOR (BRK= 1C00)

    ;       SEVEN SEGMENT DISPLAYS

SEG1   = $09
SEG2   = $0B
SEG3   = $0D
SEG4   = $0F
SEG5   = $11
SEG6   = $13

    ;       SEGMENT LED LETTERS

    ; Relationship between bit and segment
    ;
    ;  | -0- |
    ;  5     1
    ;  | -6- |
    ;  4     2
    ;  | -3- |

; e.g. a lower case 'd' would include bits 1,2,3,4,6 = 1101 1110 = $5E

; Upper Case Letters

LA = $77
LB = $7F
LC = $39
LD = $3F
LE = $79
LF = $71
LG = $3D
LH = $76 ;01110110
LI = $06 ;00000110
LJ = $1E
; LK
LL = $38
; LM
LN = $37 ;00110111
LO = $3F ;00111111
LP = $73
; LQ
LR = $31  ;00110001
LS = $6D
LT = $78
LU = $3E
; LV
; LW
; LX
LY = $6E
; LZ

; Lower Case Letters

La = $5F  ;01011111
Lb = $7C
Lc = $58
Ld = $5E
Le = $7B  ;01111011
Lf = $71
Lg = $6F
Lh = $74
Li = $04
Lj = $1E  ;
; Lk
Ll = $06
; Lm
Ln = $54  ;01010100
Lo = $5C  ;01011100
Lp = $73
; Lq
Lr = $50  ;01010000
Ls = $6D
Lt = $78
Lu = $1C
; Lv
; Lw
; Lx
Ly = $6E
; Lz

L1 = $86
L2 = $DB
L3 = $CF
L4 = $E6
L5 = $ED
L6 = $FD
L7 = $87
L8 = $FF
L9 = $EF
L0 = $BF

LSPC = $00
LDASH = $40


