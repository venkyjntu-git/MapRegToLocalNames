; ModuleID = 'test/test4.ll'
source_filename = "test/test4.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = dso_local global i32 0, align 4, !dbg !0
@b = dso_local global i32 1, align 4, !dbg !6

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !13 {
bb:
  call void @llvm.dbg.value(metadata i32 0, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata i32 1, metadata !18, metadata !DIExpression()), !dbg !17
  br label %bb1, !dbg !19

bb1:                                              ; preds = %bb2, %bb
  %.02 = phi i32 [ 0, %bb ], [ %.0, %bb2 ], !dbg !17
  %.01 = phi i32 [ undef, %bb ], [ %tmp3, %bb2 ]
  %.0 = phi i32 [ 1, %bb ], [ %tmp3, %bb2 ], !dbg !17
  call void @llvm.dbg.value(metadata i32 %.0, metadata !18, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata i32 %.01, metadata !20, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata i32 %.02, metadata !16, metadata !DIExpression()), !dbg !17
  %tmp = icmp slt i32 %.01, 100, !dbg !21
  br i1 %tmp, label %bb2, label %bb4, !dbg !19

bb2:                                              ; preds = %bb1
  %tmp3 = add nsw i32 %.02, %.0, !dbg !22
  call void @llvm.dbg.value(metadata i32 %tmp3, metadata !20, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata i32 %.0, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata i32 %tmp3, metadata !18, metadata !DIExpression()), !dbg !17
  br label %bb1, !dbg !19, !llvm.loop !24

bb4:                                              ; preds = %bb1
  ret i32 0, !dbg !26
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!9, !10, !11}
!llvm.ident = !{!12}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "a", scope: !2, file: !3, line: 1, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 9.0.1-+20191211110317+c1a0a213378-1~exp1~20191211221711.104 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "test/test4.c", directory: "/home/research/GITHUB/Variables_In_instruction")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "b", scope: !2, file: !3, line: 1, type: !8, isLocal: false, isDefinition: true)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 2, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{!"clang version 9.0.1-+20191211110317+c1a0a213378-1~exp1~20191211221711.104 "}
!13 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 2, type: !14, scopeLine: 2, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!14 = !DISubroutineType(types: !15)
!15 = !{!8}
!16 = !DILocalVariable(name: "a", scope: !13, file: !3, line: 3, type: !8)
!17 = !DILocation(line: 0, scope: !13)
!18 = !DILocalVariable(name: "b", scope: !13, file: !3, line: 3, type: !8)
!19 = !DILocation(line: 5, column: 3, scope: !13)
!20 = !DILocalVariable(name: "c", scope: !13, file: !3, line: 3, type: !8)
!21 = !DILocation(line: 5, column: 10, scope: !13)
!22 = !DILocation(line: 6, column: 8, scope: !23)
!23 = distinct !DILexicalBlock(scope: !13, file: !3, line: 5, column: 16)
!24 = distinct !{!24, !19, !25}
!25 = !DILocation(line: 10, column: 3, scope: !13)
!26 = !DILocation(line: 11, column: 2, scope: !13)
