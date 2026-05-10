# C语言期末模拟卷讲评 — 朋辈学业导师讲座

基于 LaTeX Beamer 的 C 语言期末模拟试卷讲评幻灯片，面向南京理工大学本科新生。

**幻灯片数量**: 96 页（含逐页揭晓动画）  
**编译引擎**: XeLaTeX  
**主题**: Metropolis + 克莱因蓝 (IKB) 配色

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
│   ├── 01-title.tex         ← 标题页
│   ├── 02-outline.tex       ← 目录 / 讲座大纲
│   ├── 10-choice-1.tex      ← 选择题 第 1—10 题
│   ├── 11-choice-2.tex      ← 选择题 第 11—20 题
│   ├── 20-basic-blank.tex   ← 基本概念填空题
│   ├── 30-reading-1.tex     ← 阅读程序填空题 第 1—5 题
│   ├── 31-reading-2.tex     ← 阅读程序填空题 第 6—10 题
│   ├── 40-complete.tex      ← 程序完善题
│   ├── 50-programming.tex   ← 编程题：电梯调度系统
│   └── 99-end.tex           ← 结束页
├── scripts/                 ← 编译与辅助脚本
│   ├── build.bat            ← Windows 批处理编译幻灯片
│   ├── build.ps1            ← PowerShell 编译幻灯片
│   ├── build-all.bat        ← 一键构建 PPT + 讲稿
│   ├── clean.bat            ← 清理幻灯片构建产物
│   ├── clean-all.bat        ← 清理所有构建产物
│   └── gen_note.py          ← 从 PDF 提取文本生成发言稿
├── materials/               ← 原始试卷 PDF（不纳入版本控制）
├── figures/                 ← 图片资源
├── code/                    ← 示例代码
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
# 方式一：latexmk（推荐）— 仅幻灯片
cd slide && latexmk -xelatex main.tex

# 方式二：完整构建 — 幻灯片 + 讲稿
scripts\build-all.bat

# 方式三：仅幻灯片
scripts\build.bat        # 批处理
pwsh scripts\build.ps1   # PowerShell
```

编译成功后：
- 幻灯片 PDF 输出至 `slide/build/main.pdf`
- 讲稿 PDF 输出至 `note/build/main.pdf`

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

- 使用 `\pause` 分离题目与解析，支持逐页揭晓
- 答案用 `{\color{highlight}...}` 突出显示（电光蓝）
- 代码块使用 `lstlisting` 环境（`language=C`）

### 配色方案

基于 **International Klein Blue (IKB, RGB 0,47,167)** 构建的全蓝色系：

| 颜色 | 用途 | RGB |
|------|------|-----|
| primary | 框架标题、块标题、进度条 | (0, 38, 150) |
| accent | 项目符号、结构元素、代码关键词 | (0, 55, 180) |
| accentlight | 示例块背景、提示块背景 | (222, 234, 254) |
| highlight | 答案高亮 | (0, 90, 210) |
| bglight | 块体背景 | (244, 247, 254) |
| bglighter | 代码背景 | (250, 251, 255) |

### 编译统计

```
PDF 页数：96
文件大小：~390 KB
编译错误：0
Overfull vbox 警告：35（均为 beamer 常见中间态溢出，不影响最终显示）
```

---

## 许可证

GNU Affero General Public License v3.0 — 详见 [LICENSE](LICENSE) 文件。

Copyright (C) 2026 Yikun CHEN, Nanjing University of Science and Technology, NJUST.