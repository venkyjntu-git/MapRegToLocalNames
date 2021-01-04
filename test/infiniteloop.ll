; ModuleID = 'test/infiniteloop.ll'
source_filename = "test/infiniteloop.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@n = dso_local global i32 1, align 4, !dbg !0

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !11 {
bb:
  call void @llvm.dbg.value(metadata i32 0, metadata !14, metadata !DIExpression()), !dbg !15
  br label %bb1, !dbg !16

bb1:                                              ; preds = %bb3, %bb
  %.0 = phi i32 [ 0, %bb ], [ %tmp5, %bb3 ], !dbg !15
  call void @llvm.dbg.value(metadata i32 %.0, metadata !14, metadata !DIExpression()), !dbg !15
  %tmp = load i32, i32* @n, align 4, !dbg !17
  %tmp2 = icmp slt i32 %tmp, 100, !dbg !18
  br i1 %tmp2, label %bb3, label %bb8, !dbg !16

bb3:                                              ; preds = %bb1
  %tmp4 = load i32, i32* @n, align 4, !dbg !19
  %tmp5 = add nsw i32 %.0, %tmp4, !dbg !21
  call void @llvm.dbg.value(metadata i32 %tmp5, metadata !14, metadata !DIExpression()), !dbg !15
  %tmp6 = load i32, i32* @n, align 4, !dbg !22
  %tmp7 = add nsw i32 %tmp6, 1, !dbg !22
  store i32 %tmp7, i32* @n, align 4, !dbg !22
  br label %bb1, !dbg !16, !llvm.loop !23

bb8:                                              ; preds = %bb1
  ret i32 0, !dbg !25
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
!1 = distinct !DIGlobalVariable(name: "n", scope: !2, file: !3, line: 1, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 9.0.1-+20191211110317+c1a0a213378-1~exp1~20191211221711.104 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "test/infiniteloop.c", directory: "/home/research/GITHUB/Variables_In_instruction")
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
!14 = !DILocalVariable(name: "sum", scope: !11, file: !3, line: 3, type: !6)
!15 = !DILocation(line: 0, scope: !11)
!16 = !DILocation(line: 5, column: 3, scope: !11)
!17 = !DILocation(line: 5, column: 9, scope: !11)
!18 = !DILocation(line: 5, column: 10, scope: !11)
!19 = !DILocation(line: 6, column: 13, scope: !20)
!20 = distinct !DILexicalBlock(scope: !11, file: !3, line: 5, column: 16)
!21 = !DILocation(line: 6, column: 12, scope: !20)
!22 = !DILocation(line: 7, column: 6, scope: !20)
!23 = distinct !{!23, !16, !24}
!24 = !DILocation(line: 8, column: 3, scope: !11)
!25 = !DILocation(line: 10, column: 1, scope: !11)
