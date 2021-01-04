; ModuleID = 'test/x.ll'
source_filename = "test/x.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = dso_local global i32 20, align 4, !dbg !0

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !11 {
bb:
  call void @llvm.dbg.declare(metadata !4, metadata !14, metadata !DIExpression()), !dbg !15
  %tmp = load i32, i32* @a, align 4, !dbg !16
  %tmp1 = add nsw i32 %tmp, 2, !dbg !17
  call void @llvm.dbg.value(metadata i32 %tmp1, metadata !18, metadata !DIExpression()), !dbg !19
  %tmp2 = add nsw i32 %tmp1, 50, !dbg !20
  call void @llvm.dbg.value(metadata i32 %tmp2, metadata !21, metadata !DIExpression()), !dbg !19
  %tmp3 = add nsw i32 %tmp2, 40, !dbg !22
  call void @llvm.dbg.value(metadata i32 %tmp3, metadata !23, metadata !DIExpression()), !dbg !19
  store i32 25, i32* @a, align 4, !dbg !24
  %tmp4 = load i32, i32* @a, align 4, !dbg !25
  %tmp5 = sdiv i32 %tmp4, 2, !dbg !26
  call void @llvm.dbg.value(metadata i32 %tmp5, metadata !27, metadata !DIExpression()), !dbg !19
  %tmp6 = load i32, i32* @a, align 4, !dbg !28
  %tmp7 = mul nsw i32 %tmp6, 5, !dbg !29
  call void @llvm.dbg.value(metadata i32 %tmp7, metadata !30, metadata !DIExpression()), !dbg !19
  %tmp8 = mul nsw i32 %tmp7, %tmp1, !dbg !31
  call void @llvm.dbg.value(metadata i32 %tmp8, metadata !32, metadata !DIExpression()), !dbg !19
  ret i32 0, !dbg !33
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!7, !8, !9}
!llvm.ident = !{!10}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "a", scope: !2, file: !3, line: 1, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 9.0.1-+20191211110317+c1a0a213378-1~exp1~20191211221711.104 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "test/x.c", directory: "/home/research/GITHUB/Variables_In_instruction")
!4 = !{}
!5 = !{!0}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 2, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{!"clang version 9.0.1-+20191211110317+c1a0a213378-1~exp1~20191211221711.104 "}
!11 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 2, type: !12, scopeLine: 2, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!12 = !DISubroutineType(types: !13)
!13 = !{!6}
!14 = !DILocalVariable(name: "c", scope: !11, file: !3, line: 4, type: !6)
!15 = !DILocation(line: 4, column: 7, scope: !11)
!16 = !DILocation(line: 5, column: 6, scope: !11)
!17 = !DILocation(line: 5, column: 7, scope: !11)
!18 = !DILocalVariable(name: "b", scope: !11, file: !3, line: 4, type: !6)
!19 = !DILocation(line: 0, scope: !11)
!20 = !DILocation(line: 6, column: 8, scope: !11)
!21 = !DILocalVariable(name: "d", scope: !11, file: !3, line: 4, type: !6)
!22 = !DILocation(line: 7, column: 7, scope: !11)
!23 = !DILocalVariable(name: "e", scope: !11, file: !3, line: 4, type: !6)
!24 = !DILocation(line: 8, column: 3, scope: !11)
!25 = !DILocation(line: 9, column: 4, scope: !11)
!26 = !DILocation(line: 9, column: 5, scope: !11)
!27 = !DILocalVariable(name: "f", scope: !11, file: !3, line: 4, type: !6)
!28 = !DILocation(line: 10, column: 3, scope: !11)
!29 = !DILocation(line: 10, column: 4, scope: !11)
!30 = !DILocalVariable(name: "g", scope: !11, file: !3, line: 4, type: !6)
!31 = !DILocation(line: 11, column: 4, scope: !11)
!32 = !DILocalVariable(name: "h", scope: !11, file: !3, line: 4, type: !6)
!33 = !DILocation(line: 13, column: 3, scope: !11)
