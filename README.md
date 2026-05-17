# C语言期末模拟卷讲评 — 朋辈学业导师讲座

> 🎓 南京理工大学 C 语言期末模拟卷讲评幻灯片 — LaTeX Beamer (XeLaTeX)，96 页逐题精讲（幻灯片 96 页 + 讲稿 47 页），覆盖选择题、填空题、阅读程序题、编程题，含 SCAN 电梯调度算法演示。

**幻灯片数量**: 96 页 | **讲稿页数**: 47 页  
**编译引擎**: XeLaTeX  
**主题**: Metropolis + 深蓝灰 + 亮蓝 accent + 暖琥珀色答案高亮

---

## 项目结构

```
.
├── slide/
│   ├── main.tex              ← 入口：文档类 / 主题 / 配色 / \lstset / \input 所有章节
│   ├── chapters/             ← 幻灯片片段文件（由 slide/main.tex \input 引入）
│   ├── .latexmkrc            ← latexmk 编译配置（xelatex，输出到 build/）
│   └── build/                ← 编译输出（PDF 等）
├── .gitignore                ← 忽略构建产物（*.aux, *.log, build/, *.pdf, materials/）
├── AGENTS.md                 ← AI Agent 项目说明
├── README.md
├── slide/chapters/
│   ├── 01-title.tex         ← 标题页
│   ├── 02-outline.tex       ← 目录 / 讲座大纲
│   ├── 10-choice-1.tex      ← 选择题 第 1—10 题
│   ├── 11-choice-2.tex      ← 选择题 第 11—20 题
│   ├── 20-basic-blank.tex   ← 基本概念填空题
│   ├── 30-reading-1.tex     ← 阅读程序填空题 第 1—5 题
│   ├── 31-reading-2.tex     ← 阅读程序填空题 第 6—10 题
│   ├── 40-complete.tex      ← 程序完善题
│   ├── 50-programming.tex   ← 编程题：电梯调度系统
│   └── 99-end.tex           ← 结束页（含开源地址 + Agentic Coding）
├── scripts/                 ← 编译与辅助脚本
│   ├── build.bat            ← Windows 批处理编译幻灯片
│   ├── build.ps1            ← PowerShell 编译幻灯片
│   ├── build-all.bat        ← 一键构建 PPT + 讲稿
│   ├── clean.bat            ← 清理幻灯片构建产物
│   ├── clean-all.bat        ← 清理所有构建产物
│   └── gen_note.py          ← 从 PDF 提取文本生成发言稿
├── materials/               ← 原始试卷 PDF（不纳入版本控制）
├── images/                  ← 图片资源（Logo 等）
├── products/                ← 最终输出 PDF（展示.pdf + 讲稿.pdf，gitignore）
├── .github/                 ← GitHub Actions CI
│   └── workflows/
│       └── latex-build.yml  ← LaTeX 编译验证
├── note/                    ← 讲稿 LaTeX 文件
│   ├── main.tex             ← 讲稿入口
│   ├── .latexmkrc           ← 讲稿编译配置
│   └── chapters/            ← 讲稿章节文件
```

## 幻灯片内容索引

### 选择题（一）— `slide/chapters/10-choice-1.tex`

| 题号 | 知识点 |
|------|--------|
| 1    | 合法标识符 |
| 2    | 运算符优先级 |
| 3    | 合法字面量 |
| 4    | ASCII 码计算 |
| 5    | while 条件等价 |
| 6    | break 与 continue |
| 7    | 逻辑表达式求值（短路求值） |
| 8    | printf 格式化输出 |
| 9    | 字符数组声明（拆分为题目 + 解析两帧） |
| 10   | 二维数组下标越界 |

### 选择题（二）— `slide/chapters/11-choice-2.tex`

| 题号 | 知识点 |
|------|--------|
| 11   | 函数形参 |
| 12   | 宏定义展开陷阱 |
| 13   | 函数的定义与调用嵌套 |
| 14   | 指针下标运算 |
| 15   | 联合体（union）大小 |
| 16   | 结构体指针成员访问（拆分为题目 + 解析两帧） |
| 17   | for 循环条件分析 |
| 18   | 存储类别 static |
| 19   | 字符串指针数组 — 类型判断 |
| 20   | 字符串指针输出（拆分为题目 + 解析两帧） |

### 基本概念填空题 — `slide/chapters/20-basic-blank.tex`

| 空号 | 知识点 |
|------|--------|
| 1—3  | 函数声明 / 数据类型 / 运算符（拆分为两帧） |
| 4—5  | 控制结构 / 指针 |
| 6—7  | 宏定义 / 文件包含 |
| 8    | 结构体初始化 |
| 9—10 | 逗号表达式 |

### 阅读程序填空题（一）— `slide/chapters/30-reading-1.tex`

| 题号 | 知识点 |
|------|--------|
| 1    | for + continue + break |
| 2    | 指针参数 |
| 3    | 数组反转（拆分为代码 + 解析两帧） |
| 4    | 字符处理 |
| 5    | 递归函数（拆分为代码 + 解析两帧） |

### 阅读程序填空题（二）— `slide/chapters/31-reading-2.tex`

| 题号 | 知识点 |
|------|--------|
| 6    | static 局部变量（拆分为代码 + 解析两帧） |
| 7    | 结构体指针传参（拆分为代码 + 解析两帧） |
| 8    | 幂运算（拆分为代码 + 解析两帧） |
| 9    | 数组奇偶处理（拆分为代码 + 解析两帧） |
| 10   | 异或交换（拆分为代码 + 解析两帧） |

### 程序完善题 — `slide/chapters/40-complete.tex`

| 题号 | 知识点 |
|------|--------|
| 1    | 字符类型判断（拆分为代码 + 答案两帧） |
| 2    | 数组查找（拆分为代码 + 答案两帧） |
| 3    | 统计非负数（拆分为代码 + 答案两帧） |

### 编程题 — `slide/chapters/50-programming.tex`

| 内容 | 说明 |
|------|------|
| 题目背景 | 电梯调度系统问题描述 |
| my_sort — 排序函数 | 按目标楼层冒泡排序（拆分为代码 + 解析两帧） |
| find_larger — 查找函数 | 查找大于当前楼层的第一个请求（拆分为代码 + 解析两帧） |
| 调度逻辑图解 | SCAN 电梯调度算法可视化 |

---

## 编译方法

### 前置条件

- **TeX Live 2024+**（需包含 xelatex、ctex、beamer、metropolis、latexmk）
- Windows 环境下推荐完整安装 [TeX Live](https://tug.org/texlive/)

### 快速编译

```bash
# 完整构建 — 幻灯片 + 讲稿（推荐）
scripts\build-all.bat        # Windows 批处理
pwsh scripts\build-all.ps1   # PowerShell

# 仅幻灯片
scripts\build.bat            # Windows 批处理
pwsh scripts\build.ps1       # PowerShell

# 命令行（单独编译）
cd slide && latexmk -xelatex main.tex   # 仅幻灯片
cd note && latexmk -xelatex main.tex    # 仅讲稿
```

编译成功后：
- `slide/build/main.pdf` → 复制到 `products/展示.pdf`
- `note/build/main.pdf` → 复制到 `products/讲稿.pdf`

### 清理

```bash
# 清理所有构建产物
scripts\clean-all.bat

# 仅清理幻灯片
scripts\clean.bat
```

### 生成发言稿

```bash
# 从 PDF 提取每页文本，生成 speaker_notes.txt
python scripts/gen_note.py
```

---

## 技术细节

### 技术要求

- **必须使用 XeLaTeX**，不可用 pdfLaTeX（中文支持需要）
- 幻灯片文件通过 `\input` 引入，不可独立编译
- 含 `\begin{lstlisting}` 的 `\begin{frame}` **必须**添加 `[fragile]` 选项
- `\end{lstlisting}` **必须在行首**，前面不可有缩进

### 幻灯片编写约定

题目与解析**拆分**为独立 frame，不使用 `\pause`：

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

- 题目与解析分帧展示，标题加 `--- 题目` / `--- 解析` 后缀
- 答案用 `{\color{highlight}...}` 突出显示（暖琥珀色）
- 代码块使用 `lstlisting` 环境（`language=C`），所在 frame 须加 `[fragile]`

### 配色方案

深蓝灰 + 亮蓝 accent + 暖琥珀色答案高亮：

| 颜色 | 用途 | RGB |
|------|------|-----|
| primary | 框架标题、块标题、进度条 | (30, 41, 59) |
| accent | 项目符号、结构元素、代码关键词 | (59, 130, 246) |
| highlight | 答案标注 | (217, 119, 6) |
| accentlight | 块背景 | (219, 234, 254) |
| bglight | 块体背景 | (241, 245, 249) |
| bglighter | 代码背景 | (248, 250, 252) |

### 编译统计

```
幻灯片：96 页  |  讲稿：47 页
编译错误：0
编译警告：0
```

---

## 许可证

GNU Affero General Public License v3.0 — 详见 [LICENSE](LICENSE) 文件。

Copyright (C) 2026 Yikun CHEN, Nanjing University of Science and Technology, NJUST.