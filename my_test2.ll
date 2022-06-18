; === prologue ====
declare dso_local i32 @printf(i8*, ...)

define dso_local i32 @main()
{
%t0 = alloca i32, align 4
%t1 = alloca i32, align 4
store i32 0, i32* %t1
%t2= load i32, i32* %t1
%t3 = icmp sgt i32 %t2, 0
br i1 %t3, label %Ltrue, label %Lfalse
Ltrue:
store i32 0, i32* %t0
br label %Lend
Lfalse:
%t4= load i32, i32* %t1
%t5 = add nsw i32 %t4, 2
store i32 %t5, i32* %t0
br label %Lend
Lend:

; === epilogue ===
ret i32 0
}
