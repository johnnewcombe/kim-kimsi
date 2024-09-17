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

OFFMASK     = %11111110     ; example mask to turn off relay 0
ONMASK      = %00000010     ;

            lda RELAYS      ; ZP address holds current state of relays
            and OFFMASK     ; turn relays off by applying the off mask
            ora ONMASK      ; turn relays on by applying the on mask
            sta RELAYS      ; store the new state in ZP

            ldx IOBASE      ; send new state to the card
            STA KIMSIPORT,x ;

