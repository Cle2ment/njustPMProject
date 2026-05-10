# AGENTS.md — C语言期末模拟卷讲评讲座

LaTeX beamer 幻灯片项目（96页），ctexbeamer + metropolis 主题，xelatex 编译。克莱因蓝 (IKB) 配色。

## 编译命令

```bash
latexmk -xelatex main.tex         # 编译到 build/main.pdf
scripts\build.bat                 # 双击运行（带暂停）
pwsh scripts\build.ps1            # PowerShell 编译
scripts\clean.bat                 # 清理 build/
python scripts\gen_note.py        # 从 PDF 生成发言稿 speaker_notes.txt
```

- **必须 xelatex**，不可 pdflatex（中文支持）
- `.latexmkrc` 配置 `$out_dir = 'build'`，`-interaction=nonstopmode`
- 构建产物（aux/log/out/toc/nav/snm/vrb 等）、`build/`、`*.pdf`、`materials/` 已加入 `.gitignore`

## 项目结构

```
main.tex          — 入口：文档类 / 主题 / 配色 / \lstset / \input 所有 slide
.latexmkrc        — latexmk 编译配置
README.md         — 人类可读项目说明（幻灯片索引、知识点映射）
slides/           — 10 个 .tex 片段（不完整文档，由 main.tex \input）
scripts/          — build.bat / build.ps1 / clean.bat / gen_note.py
materials/        — 原始试卷 PDF（gitignore）
figures/          — 图片资源
code/             — 示例 C 代码
```

## 配色方案

克莱因蓝 (International Klein Blue, RGB 0,47,167) 全蓝色系，定义在 `main.tex` 前言区：

| 色名 | RGB | 用途 |
|------|-----|------|
| primary | (0,38,150) | frametitle, block 标题, 进度条 |
| accent | (0,55,180) | 项目符号, 结构元素, 代码关键词 |
| highlight | (0,90,210) | 答案标注（`\color{highlight}`） |
| accentlight | (222,234,254) | block 背景 |
| bglight / bglighter | (244,247,254) / (250,251,255) | block body / code 背景 |

修改配色只需改 `main.tex` 中 `\definecolor` 和 `\setbeamercolor` 块，不要散落到各 slide 文件。

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

- `\pause` 分离题目/解析，逐页揭晓
- 答案用 `{\color{highlight}...}` 突出
- 代码块 `lstlisting` (language=C)

### 内容溢出处理

当解析内容过多导致底部溢出时，按优先级处理：

1. **全局** `main.tex` 已设 `basicstyle=\footnotesize\ttfamily` + itemize `itemsep=0.08em`
2. **局部** 对溢出 block 添加 `\small` 或 `\footnotesize`
3. **拆分** 将一帧拆为「题目」+「解析」两帧，标题加 `--- 题目` / `--- 解析` 后缀（如 Q9、Q16、Q20）
4. **极限** 仅代码帧可将 lstlisting 局部设为 `\scriptsize\ttfamily` 或 `\tiny\ttfamily`

拆分后的帧**不加 `\pause`**（题目和解析已在不同帧）。
