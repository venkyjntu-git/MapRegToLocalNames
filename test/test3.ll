; ModuleID = 'test/test3.ll'
source_filename = "test/test3.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = dso_local global i32 20, align 4, !dbg !0
@g = dso_local global i32 30, align 4, !dbg !6

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !13 {
bb:
  call void @llvm.dbg.declare(metadata !4, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata !4, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata !4, metadata !20, metadata !DIExpression()), !dbg !21
  %tmp = load i32, i32* @a, align 4, !dbg !22
  %tmp1 = load i32, i32* @g, align 4, !dbg !23
  %tmp2 = mul nsw i32 2, %tmp1, !dbg !24
  %tmp3 = add nsw i32 %tmp, %tmp2, !dbg !25
  call void @llvm.dbg.value(metadata i32 %tmp3, metadata !26, metadata !DIExpression()), !dbg !27
  %tmp4 = icmp sgt i32 %tmp3, 20, !dbg !28
  br i1 %tmp4, label %bb5, label %bb7, !dbg !30

bb5:                                              ; preds = %bb
  %tmp6 = load i32, i32* @a, align 4, !dbg !31
  call void @llvm.dbg.value(metadata i32 %tmp6, metadata !32, metadata !DIExpression()), !dbg !27
  br label %bb9, !dbg !33

bb7:                                              ; preds = %bb
  %tmp8 = load i32, i32* @g, align 4, !dbg !34
  call void @llvm.dbg.value(metadata i32 %tmp8, metadata !32, metadata !DIExpression()), !dbg !27
  br label %bb9

bb9:                                              ; preds = %bb7, %bb5
  %.0 = phi i32 [ %tmp6, %bb5 ], [ %tmp8, %bb7 ], !dbg !35
  call void @llvm.dbg.value(metadata i32 %.0, metadata !32, metadata !DIExpression()), !dbg !27
  %tmp10 = add nsw i32 %.0, 30, !dbg !36
  call void @llvm.dbg.value(metadata i32 %tmp10, metadata !37, metadata !DIExpression()), !dbg !27
  ret i32 0, !dbg !38
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
!3 = !DIFile(filename: "test/test3.c", directory: "/home/research/GITHUB/Variables_In_instruction")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "g", scope: !2, file: !3, line: 1, type: !8, isLocal: false, isDefinition: true)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 2, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{!"clang version 9.0.1-+20191211110317+c1a0a213378-1~exp1~20191211221711.104 "}
!13 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 2, type: !14, scopeLine: 2, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!14 = !DISubroutineType(types: !15)
!15 = !{!8}
!16 = !DILocalVariable(name: "d", scope: !13, file: !3, line: 4, type: !8)
!17 = !DILocation(line: 4, column: 9, scope: !13)
!18 = !DILocalVariable(name: "e", scope: !13, file: !3, line: 4, type: !8)
!19 = !DILocation(line: 4, column: 11, scope: !13)
!20 = !DILocalVariable(name: "h", scope: !13, file: !3, line: 4, type: !8)
!21 = !DILocation(line: 4, column: 15, scope: !13)
!22 = !DILocation(line: 6, column: 6, scope: !13)
!23 = !DILocation(line: 6, column: 10, scope: !13)
!24 = !DILocation(line: 6, column: 9, scope: !13)
!25 = !DILocation(line: 6, column: 7, scope: !13)
!26 = !DILocalVariable(name: "b", scope: !13, file: !3, line: 4, type: !8)
!27 = !DILocation(line: 0, scope: !13)
!28 = !DILocation(line: 8, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !13, file: !3, line: 8, column: 7)
!30 = !DILocation(line: 8, column: 7, scope: !13)
!31 = !DILocation(line: 9, column: 7, scope: !29)
!32 = !DILocalVariable(name: "c", scope: !13, file: !3, line: 4, type: !8)
!33 = !DILocation(line: 9, column: 5, scope: !29)
!34 = !DILocation(line: 11, column: 7, scope: !29)
!35 = !DILocation(line: 0, scope: !29)
!36 = !DILocation(line: 13, column: 7, scope: !13)
!37 = !DILocalVariable(name: "f", scope: !13, file: !3, line: 4, type: !8)
!38 = !DILocation(line: 15, column: 3, scope: !13)
