# AGENTS.md — C语言期末模拟卷讲评讲座

LaTeX beamer 幻灯片项目（95页），ctexbeamer + metropolis 主题，xelatex 编译。深蓝灰 + 亮蓝 accent + 暖琥珀色答案高亮配色。

## 编译命令

```bash
cd slide && latexmk -xelatex main.tex   # 编译幻灯片 → slide/build/main.pdf → products/展示.pdf
cd note && latexmk -xelatex main.tex    # 编译讲稿   → note/build/main.pdf  → products/讲稿.pdf
scripts\build-all.bat             # 一键构建 PPT + 讲稿，并输出到 products/
scripts\build-all.ps1             # PowerShell 一键构建
scripts\clean-all.bat             # 清理所有构建产物
```

- **必须 xelatex**，不可 pdflatex（中文支持）
- `.latexmkrc` 配置 `$out_dir = 'build'`，`-interaction=nonstopmode`
- 构建产物（aux/log/out/toc/nav/snm/vrb 等）、`build/`、`*.pdf`、`materials/`、`.idea/`、`.sisyphus/` 已加入 `.gitignore`

## 项目结构

```
slide/main.tex          — 入口：文档类 / 主题 / 配色 / \lstset / \input 所有章节
slide/.latexmkrc  — latexmk 编译配置（输出到 build/，即 slide/build/）
README.md         — 人类可读项目说明（幻灯片索引、知识点映射）
slide/chapters/   — 幻灯片 LaTeX 片段（不完整文档，由 slide/main.tex \input）
note/             — 讲稿 LaTeX 文件 (note/main.tex + note/chapters/)
note/.latexmkrc      — latexmk 编译配置（输出到 build/，即 note/build/）
scripts/          — build-all.bat / build.ps1 / clean-all.bat / gen_note.py
products/         — 最终输出 PDF（展示.pdf + 讲稿.pdf，gitignore）
.github/          — GitHub Actions CI（latex-build.yml）
materials/        — 原始试卷 PDF（gitignore）
images/           — 图片资源
```

## 配色方案

深蓝灰 + 亮蓝 accent + 暖琥珀色答案高亮，定义在 `slide/main.tex` 前言区：

| 色名 | RGB | 用途 |
|------|-----|------|
| primary | (30,41,59) | frametitle, block 标题, 进度条 |
| accent | (59,130,246) | 项目符号, 结构元素, 代码关键词 |
| highlight | (217,119,6) | 答案标注（`\color{highlight}`），暖琥珀色 |
| accentlight | (219,234,254) | block 背景 |
| bglight / bglighter | (241,245,249) / (248,250,252) | block body / code 背景 |

修改配色只需改 `slide/main.tex` 中 `\definecolor` 和 `\setbeamercolor` 块，不要散落到各 slide 文件。

## 幻灯片文件约定

各 slide 文件是**不完整文档** — 不含 `\documentclass` 和 `\begin{document}...\end{document}`，只含 `\section`、`\begin{frame}...\end{frame}` 等片段，通过 `\input` 引入。

### `[fragile]` 选项

含 `\begin{lstlisting}` 的 frame **必须** `[fragile]`：

```latex
\begin{frame}[fragile]{题号}{知识点}   % ← 正确
\begin{frame}{题号}{知识点}             % ← 含lstlisting时编译报错
```

### `lstlisting` 缩进约束

`\end{lstlisting}` **必须在行首**，前面不可有空格/缩进。

### 标准 frame 结构

```latex
% --- 题目页 ---
\begin{frame}{题号标题}{知识点 --- 题目}
    \begin{exampleblock}{题目}
        题目内容...
    \end{exampleblock}
\end{frame}

% --- 解析页 ---
\begin{frame}{题号标题}{知识点 --- 解析}
    \begin{alertblock}{解析}
        解析内容...
        {\color{highlight}答案：X}
    \end{alertblock}
\end{frame}
```

- 题目与解析已拆分为独立 frame，不再使用 `\pause`
- 答案用 `{\color{highlight}...}` 突出
- 代码块 `lstlisting` (language=C)

### 内容溢出处理

当解析内容过多导致底部溢出时，按优先级处理：

1. **全局** `slide/main.tex` 已设 `basicstyle=\footnotesize\ttfamily` + itemize `itemsep=0.08em`
2. **局部** 对溢出 block 添加 `\small` 或 `\footnotesize`
3. **拆分** 将一帧拆为「题目」+「解析」两帧，标题加 `--- 题目` / `--- 解析` 后缀（如 Q9、Q16、Q20）
4. **极限** 仅代码帧可将 lstlisting 局部设为 `\scriptsize\ttfamily` 或 `\tiny\ttfamily`

拆分后的帧**不加 `\pause`**（题目和解析已在不同帧）。
