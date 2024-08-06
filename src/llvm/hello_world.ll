; ModuleID = "./src/c/hello_world.c"

; This module prints the default greeting string to stdout 5 times.
; There was so much bloat before but we've managed to clean it up.
; These god-damned LLVM Devs! I fucking hate you bro!

; I mean...how is this language different from good old C?
; You try tobe different then you suck so hard. Lol

target triple = "armv7-unknown-linux-android24"

@.str = private unnamed_addr constant [15 x i8] c"Hello, World!\0A\00"

define i32 @main() {
  %y = alloca i32
  store i32 0, ptr %y
  br label %loop_condition

loop_condition:
  %y1 = load i32, ptr %y
  %is_less_than = icmp slt i32 %y1, 5
  br i1 %is_less_than, label %call_printf, label %finally

call_printf:
  call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %increment_counter

increment_counter:
  %y2 = load i32, ptr %y
  %y3 = add nsw i32 %y2, 1
  store i32 %y3, ptr %y
  br label %loop_condition

finally:
  ret i32 0
}

declare i32 @printf(ptr noundef, ...)
