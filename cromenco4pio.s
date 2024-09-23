;=============================================================================
; Cromenco 4PIO Relay Example (c) J.L.Newcombe 2024
;
; The relays are latching and one byte determines the state of all relays.
; Therefor to turn a relay(s) on, simply OR a mask value with the
; current relay state. For example to turn on relay 0 the following mask
; could be used.
;
;     ONMASK      = %00000010
;
; To turn relays off simply AND a mask. For example to turn off relay 1 the following mask
; could be used.
;
;     OFMASK      = %11111110
;
; See example below
;
;-----------------------------------------------------------------------------
; Date          Comment
;-----------------------------------------------------------------------------
;
;
;-----------------------------------------------------------------------------
            .org $0200       ;

IOBASE      = $80           ; base I/O port used by the card
KIMSIPORT   = $FA00         ; address used by KIMSI to access 8080/Z80 ports
RELAYS      = $00           ; address that stores the state of the relays

;-----------------------------------------------------------------------------
; Example of using masks
;-----------------------------------------------------------------------------
; OFFMASK     = %11111110     ; AND this with the current state, to turn off relay 0
; ONMASK      = %00000010     ; OR this with the current state to turn on relay 1
;             lda RELAYS      ; ZP address holds current state of relays
;             and OFFMASK     ; turn relays off by applying the off mask
;             ora ONMASK      ; turn relays on by applying the on mask
;             sta RELAYS      ; store the new state in ZP
;-----------------------------------------------------------------------------


;-----------------------------------------------------------------------------
; Initialise
;-----------------------------------------------------------------------------
            lda #$FF
            sta $1707           ; set timer division

            lda #0              ; all relays off
            sta RELAYS
;-----------------------------------------------------------------------------

LOOP:       ldx IOBASE          ; send new state to the card
            STA KIMSIPORT,x     ;

;-----------------------------------------------------------------------------
; Check the Timer
;-----------------------------------------------------------------------------
; If the counter has passed the count of zero, bit 7 will be set to 1,
; otherwise, bit 7 (and all other bits in location 170?) will be zero.
;-----------------------------------------------------------------------------
WAIT:       LDA $1707           ; check the timer
            BEQ WAIT
            LDA $1706           ; restore divider etc (a read will accomplish this)

;-----------------------------------------------------------------------------
; Toggle all of the relays
;-----------------------------------------------------------------------------
            lda RELAYS          ; toggle all of the relays
            eor #$FF
            sta RELAYS
            jmp LOOP


