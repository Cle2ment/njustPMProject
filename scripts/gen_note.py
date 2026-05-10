# 生成发言稿
# 从 PDF 提取每页文本作为讲稿参考
# 用法: python scripts/gen_note.py

import pdfplumber
import os

pdf_path = os.path.join(os.path.dirname(__file__), '..', 'build', 'main.pdf')
if not os.path.exists(pdf_path):
    print(f"PDF 不存在: {pdf_path}")
    print("请先运行 build.bat 编译生成 PDF")
    exit(1)

output_path = os.path.join(os.path.dirname(__file__), '..', 'speaker_notes.txt')
with open(output_path, 'w', encoding='utf-8') as out:
    with pdfplumber.open(pdf_path) as pdf:
        for i, page in enumerate(pdf.pages):
            text = page.extract_text()
            out.write(f"{'='*60}\n")
            out.write(f"第 {i+1} 页\n")
            out.write(f"{'='*60}\n")
            out.write((text or '(无文字)') + '\n\n')

print(f"发言稿已生成: {output_path}")
