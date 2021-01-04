; ModuleID = 'test/test2.ll'
source_filename = "test/test2.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = dso_local global i32 20, align 4, !dbg !0
@g = dso_local global i32 30, align 4, !dbg !6

; Function Attrs: noinline nounwind uwtable
define dso_local void @fun(i32* %arg) #0 !dbg !13 {
bb:
  call void @llvm.dbg.value(metadata i32* %arg, metadata !17, metadata !DIExpression()), !dbg !18
  ret void, !dbg !19
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !20 {
bb:
  %tmp = alloca i32, align 4
  call void @llvm.dbg.value(metadata i32 50, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i32* %tmp, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata !4, metadata !27, metadata !DIExpression()), !dbg !28
  %tmp1 = load i32, i32* @a, align 4, !dbg !29
  %tmp2 = load i32, i32* @g, align 4, !dbg !30
  %tmp3 = mul nsw i32 2, %tmp2, !dbg !31
  %tmp4 = add nsw i32 %tmp1, %tmp3, !dbg !32
  call void @llvm.dbg.value(metadata i32 %tmp4, metadata !33, metadata !DIExpression()), !dbg !24
  %tmp5 = icmp sgt i32 %tmp4, 20, !dbg !34
  br i1 %tmp5, label %bb6, label %bb8, !dbg !36

bb6:                                              ; preds = %bb
  %tmp7 = load i32, i32* @a, align 4, !dbg !37
  call void @llvm.dbg.value(metadata i32 %tmp7, metadata !38, metadata !DIExpression()), !dbg !24
  br label %bb10, !dbg !39

bb8:                                              ; preds = %bb
  %tmp9 = load i32, i32* @g, align 4, !dbg !40
  call void @llvm.dbg.value(metadata i32 %tmp9, metadata !38, metadata !DIExpression()), !dbg !24
  br label %bb10

bb10:                                             ; preds = %bb8, %bb6
  %.0 = phi i32 [ %tmp7, %bb6 ], [ %tmp9, %bb8 ], !dbg !41
  call void @llvm.dbg.value(metadata i32 %.0, metadata !38, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.value(metadata !4, metadata !42, metadata !DIExpression()), !dbg !24
  %tmp11 = add nsw i32 %.0, 30, !dbg !43
  store i32 %tmp11, i32* %tmp, align 4, !dbg !44
  %tmp12 = add nsw i32 50, 20, !dbg !45
  call void @llvm.dbg.value(metadata i32 %tmp12, metadata !46, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.value(metadata i32* %tmp, metadata !47, metadata !DIExpression()), !dbg !24
  call void @fun(i32* %tmp), !dbg !48
  ret i32 0, !dbg !49
}

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
!3 = !DIFile(filename: "test/test2.c", directory: "/home/research/GITHUB/Variables_In_instruction")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "g", scope: !2, file: !3, line: 1, type: !8, isLocal: false, isDefinition: true)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 2, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{!"clang version 9.0.1-+20191211110317+c1a0a213378-1~exp1~20191211221711.104 "}
!13 = distinct !DISubprogram(name: "fun", scope: !3, file: !3, line: 3, type: !14, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!14 = !DISubroutineType(types: !15)
!15 = !{null, !16}
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!17 = !DILocalVariable(name: "v", arg: 1, scope: !13, file: !3, line: 3, type: !16)
!18 = !DILocation(line: 0, scope: !13)
!19 = !DILocation(line: 5, column: 1, scope: !13)
!20 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 7, type: !21, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{!8}
!23 = !DILocalVariable(name: "d", scope: !20, file: !3, line: 9, type: !8)
!24 = !DILocation(line: 0, scope: !20)
!25 = !DILocalVariable(name: "e", scope: !20, file: !3, line: 9, type: !8)
!26 = !DILocation(line: 9, column: 14, scope: !20)
!27 = !DILocalVariable(name: "h", scope: !20, file: !3, line: 9, type: !8)
!28 = !DILocation(line: 9, column: 18, scope: !20)
!29 = !DILocation(line: 12, column: 6, scope: !20)
!30 = !DILocation(line: 12, column: 10, scope: !20)
!31 = !DILocation(line: 12, column: 9, scope: !20)
!32 = !DILocation(line: 12, column: 7, scope: !20)
!33 = !DILocalVariable(name: "b", scope: !20, file: !3, line: 9, type: !8)
!34 = !DILocation(line: 14, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !20, file: !3, line: 14, column: 7)
!36 = !DILocation(line: 14, column: 7, scope: !20)
!37 = !DILocation(line: 15, column: 7, scope: !35)
!38 = !DILocalVariable(name: "c", scope: !20, file: !3, line: 9, type: !8)
!39 = !DILocation(line: 15, column: 5, scope: !35)
!40 = !DILocation(line: 17, column: 7, scope: !35)
!41 = !DILocation(line: 0, scope: !35)
!42 = !DILocalVariable(name: "p", scope: !20, file: !3, line: 10, type: !16)
!43 = !DILocation(line: 20, column: 7, scope: !20)
!44 = !DILocation(line: 20, column: 5, scope: !20)
!45 = !DILocation(line: 22, column: 9, scope: !20)
!46 = !DILocalVariable(name: "f", scope: !20, file: !3, line: 9, type: !8)
!47 = !DILocalVariable(name: "q", scope: !20, file: !3, line: 10, type: !16)
!48 = !DILocation(line: 24, column: 4, scope: !20)
!49 = !DILocation(line: 26, column: 3, scope: !20)
