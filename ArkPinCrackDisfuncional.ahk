/**
 * @Author: Julian Rodriguez
 * @Date:   2022-04-22 2:35:01
 * @Last Modified by: Jaro Rodriguez
 * @Last Modified time: 2023-08-22 2:11:15
 * @Repository: https://github.com/Jaro1112/CODECRACKERDISFUNSIONAL.git
 * @License: MIT
 * @Description: 
 */


; Keybinds estandar
+^R::Reload      ; Recarga el script: Control + Shift + R
+^P::Pause       ; Quita la pausa  Script: Control + Shift + P
Ins::Suspend     ; Suspende: Insert
Esc::ExitApp     ; Salir del script: Escape


; recomendado para actualizaciones del ahk.
#NoEnv
; Que no se inicien varias veces
#SingleInstance force
; mejor velocidad.
SendMode Input
; Directorio de inicio.
SetWorkingDir %A_ScriptDir%
; Acelera la ejecucion del script: http://ahkscript.org/docs/commands/SetBatchLines.htm
SetBatchLines -1


Log(value)
{
    FileAppend,
    (

    %value%
    ), attempts.log
}

; Intenta un codigo
Attempt(code)
{
    ; Para que se sepa que se pone
    ToolTip %code%
    ; Abre la ventana del codigo (del vault)
    SendInput, e
    ; Espera a que se abra la ventana del codigo (del vault)
    Sleep, 650
    ; Simular que se presionan teclas
    SendInput, %code%
    ; Log del codigo
    Log(code)
    ; Espera a que la ventana cierre
    Sleep, 600

    return
}

; Ctrl + Shift + click izquierdo
+^LButton::

    ; PREGUNTA DONDE INICIA, Y SI QUIERE INTENTAR LOS CODIGOS COMUNES
    InputBox, start, Pin donde incia
    InputBox, amount, Pin en donde termina
    MsgBox, 4, , Incluir codigos comunes?

    ; Pines comunes?
    IfMsgBox, Yes
    {
        Log("================================= Comunes ============================================")

        common := ["0000", "1111", "2222", "3333", "4444", "5555", "6666", "7777", "8888", "9999", "1010", "2020", "3030", "4040", "5050", "6060", "7070", "8080", "9090", "4321", "1000", "2000", "3000", "4000", "5000", "6000", "7000", "8000", "9000"]

        For key, code in common
        {
            Attempt(code)
        }
    }

    Log("================================= Todos ============================================")

    while start <= amount
    {
        ; Poner el pad con ceros si se necesita
        code = % SubStr("0000" start, -3)
        ; Intentar el codigo
        Attempt(code)
        ; El siguiente
        start++
    }
    ; Finalizado
    ToolTip


Return


