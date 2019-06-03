; ModuleID = 'mystrcmp.bc'
source_filename = "mystrcmp.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.14.0"

%struct.string_struct = type { i8*, i64, i64 }

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @my_cmp(%struct.string_struct* byval align 8 %ls, %struct.string_struct* byval align 8 %rs) #0 {
entry:
  %retval = alloca i32, align 4
  %foo = alloca [8 x i8], align 1
  %bar = alloca [8 x i8], align 1
  %l = alloca i8*, align 8
  %r = alloca i8*, align 8
  %0 = bitcast [8 x i8]* %foo to i8*
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 8, i1 false)
  %1 = bitcast [8 x i8]* %bar to i8*
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 8, i1 false)
  %ptr = getelementptr inbounds %struct.string_struct, %struct.string_struct* %ls, i32 0, i32 0
  %2 = load i8*, i8** %ptr, align 8
  store i8* %2, i8** %l, align 8
  %ptr1 = getelementptr inbounds %struct.string_struct, %struct.string_struct* %rs, i32 0, i32 0
  %3 = load i8*, i8** %ptr1, align 8
  store i8* %3, i8** %r, align 8
  %4 = load i8*, i8** %l, align 8
  %tobool = icmp ne i8* %4, null
  br i1 %tobool, label %if.end, label %land.lhs.true

land.lhs.true:                                    ; preds = %entry
  %5 = load i8*, i8** %r, align 8
  %tobool2 = icmp ne i8* %5, null
  br i1 %tobool2, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %entry
  %6 = load i8*, i8** %l, align 8
  %tobool3 = icmp ne i8* %6, null
  br i1 %tobool3, label %if.end5, label %if.then4

if.then4:                                         ; preds = %if.end
  store i32 -1, i32* %retval, align 4
  br label %return

if.end5:                                          ; preds = %if.end
  %7 = load i8*, i8** %r, align 8
  %tobool6 = icmp ne i8* %7, null
  br i1 %tobool6, label %if.end8, label %if.then7

if.then7:                                         ; preds = %if.end5
  store i32 1, i32* %retval, align 4
  br label %return

if.end8:                                          ; preds = %if.end5
  %8 = load i8*, i8** %l, align 8
  %9 = load i8*, i8** %r, align 8
  %call = call i32 @strcmp(i8* %8, i8* %9)
  store i32 %call, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end8, %if.then7, %if.then4, %if.then
  %10 = load i32, i32* %retval, align 4
  ret i32 %10
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #1

declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @cmp(i8* %l, i8* %r) #0 {
entry:
  %retval = alloca i32, align 4
  %l.addr = alloca i8*, align 8
  %r.addr = alloca i8*, align 8
  store i8* %l, i8** %l.addr, align 8
  store i8* %r, i8** %r.addr, align 8
  %0 = load i8*, i8** %l.addr, align 8
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.end, label %land.lhs.true

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %r.addr, align 8
  %tobool1 = icmp ne i8* %1, null
  br i1 %tobool1, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %entry
  %2 = load i8*, i8** %l.addr, align 8
  %tobool2 = icmp ne i8* %2, null
  br i1 %tobool2, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end
  store i32 -1, i32* %retval, align 4
  br label %return

if.end4:                                          ; preds = %if.end
  %3 = load i8*, i8** %r.addr, align 8
  %tobool5 = icmp ne i8* %3, null
  br i1 %tobool5, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.end4
  store i32 1, i32* %retval, align 4
  br label %return

if.end7:                                          ; preds = %if.end4
  %4 = load i8*, i8** %l.addr, align 8
  %5 = load i8*, i8** %r.addr, align 8
  %call = call i32 @strcmp(i8* %4, i8* %5)
  store i32 %call, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end7, %if.then6, %if.then3, %if.then
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i64 @my_strlen(i8* %l) #0 {
entry:
  %retval = alloca i64, align 8
  %l.addr = alloca i8*, align 8
  store i8* %l, i8** %l.addr, align 8
  %0 = load i8*, i8** %l.addr, align 8
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i64 -1, i64* %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %l.addr, align 8
  %call = call i64 @strlen(i8* %1)
  store i64 %call, i64* %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %2 = load i64, i64* %retval, align 8
  ret i64 %2
}

declare i64 @strlen(i8*) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 7.1.0 "}
