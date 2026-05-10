# AGENTS.md — C语言期末模拟卷讲评讲座

LaTeX beamer 幻灯片项目，使用 ctexbeamer + metropolis 主题，xelatex 编译。

## 编译命令

```bash
# 编译 (输出到 build/main.pdf)
latexmk -xelatex main.tex

# 或双击运行
scripts\build.bat        # 带暂停
pwsh scripts\build.ps1   # PowerShell
```

- 必须用 **xelatex**，不能用 pdflatex（中文支持）
- 编译配置文件是 `.latexmkrc`，指定了输出到 `build/`
- 清理：`scripts\clean.bat` 删除 `build/` 目录
- 编译产物（aux/log/out 等）已加入 `.gitignore`

## 项目结构

```
main.tex          — 入口文件，定义文档类/主题/包/\lstset，\input 所有 slide
.latexmkrc        — latexmk 编译配置
slides/           — 各章节幻灯片（10 个 .tex 文件）
scripts/          — 编译脚本
materials/        — 原始试卷 PDF
figures/          — 图片
code/             — 示例代码
```

## 幻灯片文件约定

**Slide 文件都是不完整的** `\begin{document}...\end{document}` 不在各 slide 文件中定义，而是由 `main.tex` 统一包装。各 slide 文件只包含 `\section`、`\begin{frame}...\end{frame}` 等片段，通过 `\input` 引入。

### `[fragile]` 选项

任何包含 `\begin{lstlisting}` 的 `\begin{frame}` **必须**加 `[fragile]` 选项，否则编译报错：

```latex
\begin{frame}[fragile]{题目}{子标题}    % ← 正确
\begin{frame}{题目}{子标题}              % ← 含lstlisting时错误
```

### `lstlisting` 缩进约束

`\end{lstlisting}` **必须在行首**，前面不能有任何空格/缩进，否则编译报错。修改含代码的 slide 时务必注意。

## 幻灯片内容结构

每题一个 frame，标准模式：

```latex
\begin{frame}{题号标题}{知识点}
    \begin{exampleblock}{题目}
        题目内容...
    \end{exampleblock}
    \pause
    \begin{alertblock}{解析}
        解析内容...
        {\color{highlight}答案：X}
    \end{alertblock}
\end{frame}
```

- 用 `\pause` 分离题目和解析，支持逐页揭示
- 答案用 `{\color{highlight}...}` 突出显示
- 代码块用 `lstlisting` (language=C)
