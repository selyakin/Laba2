
extern printf, scanf
 
section .data
    fmt_scan:   db "%d", 0          ; Формат для чтения
    fmt_num:    db "%d", 0          ; Формат для вывода самого числа
    msg_yes:    db " - Yes", 10, 0  ; Строка для простого числа с переносом
    msg_no:     db " - No", 10, 0   ; Строка для составного числа с переносом
    msg_prompt_n: db "Введите N: ", 0
    msg_prompt_val: db "Введите число: ", 0
 
section .bss
    n:          resd 1
    current:    resd 1
 
section .text
    global main
 
main:
    push rbp
    mov rbp, rsp
 
    ; Читаем N
    lea rdi, [msg_prompt_n]
    xor eax, eax
    call printf
 
    lea rdi, [fmt_scan]
    lea rsi, [n]
    call scanf
    
    ; Если N <= 0, выходим
    mov eax, [n]
    cmp eax, 0
    jle .end
 
.loop_numbers:
    ; Выводим подсказку для ввода числа
    lea rdi, [msg_prompt_val]
    xor eax, eax
    call printf
 
    ; Читаем следующее число
    lea rdi, [fmt_scan]
    lea rsi, [current]
    call scanf
    
    mov ebx, [current] ; Сохраняем число в ebx
 
    ; Сначала печатаем само число (без переноса строки)
    lea rdi, [fmt_num]
    mov rsi, rbx
    xor eax, eax
    call printf
    
    ; Проверка на натуральность (1 и меньше — не простые)
    cmp ebx, 1
    jle .print_no
 
    ; Проверка на простоту (от 2 до корня из числа)
    mov ecx, 2
.check_prime:
    mov eax, ecx
    imul eax, eax      ; eax = ecx * ecx
    cmp eax, ebx       ; если ecx^2 > ebx, то делителей нет
    jg .print_yes
    
    mov eax, ebx
    xor edx, edx
    div ecx            ; ebx / ecx
    cmp edx, 0         ; если остаток 0 — число составное
    je .print_no
    
    inc ecx
    jmp .check_prime
 
.print_yes:
    lea rdi, [msg_yes]
    xor eax, eax
    call printf
    jmp .next_iter
 
.print_no:
    lea rdi, [msg_no]
    xor eax, eax
    call printf
 
.next_iter:
    dec dword [n]
    jnz .loop_numbers
 
.end:
    xor eax, eax
    pop rbp
    ret
