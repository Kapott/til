Capslock is the epitome of uselessness. A homerow key which sits idle is a waste. Let's steal one of the genious ideas from the `colemak` keyboard layout and remap `CapsLock` to what probably is the third- or fourth-most used key on the keyboard: `Backspace`.

Windows 10: Copy and paste this into a `.reg`file, and execute it.

```
REGEDIT4 

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout] 
; The next line maps the CapsLock key (003a) to a Backspace (000e)
"Scancode Map"=hex:00,00,00,00,00,00,00,00,02,00,00,00,0e,00,3a,00,00,00,00,00
; The next line removes all scancode remappings
;"Scancode Map"=-

[HKEY_CURRENT_USER\Keyboard Layout]
"Scancode Map"=-

; Numbers are LittleEndian (0x12345678 -> 78,56,34,12)
; ---------------------------------------------------------------------
; Bytes          Meaning
; ---------------------------------------------------------------------
; 00 00 00 00    Version info (usually zero)
; 00 00 00 00    Flags (usually zero)
; 02 00 00 00    # of entries (# of mappings +1 for the terminator)
; 5c e0 1d e0    The RCtrl(e01d) key now sends a RWin(e05c) code (Lwin=e05b)
; 00 00 00 00    Null terminator (always zero)
```

Undo the capslock-to-backspace mapping:

```
REGEDIT4 

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout] 
; The next lines remove any registry scancode remappings present
"Scancode Map"=-

[HKEY_CURRENT_USER\Keyboard Layout]
"Scancode Map"=-
```
