import sys
import re

file_path = r'd:\Flutterintership\aippt\ai-presentation-doc\lib\app\data\services\gemini_service.dart'
try:
    with open(file_path, 'r', encoding='utf-8') as f:
        text = f.read()

    match = re.search(r"systemInstruction:\s*Content\.text\(\s*\'\'\'(.*?)\'\'\',\s*\),", text, re.DOTALL)
    if match:
        sys_prompt = match.group(1)
        text = text.replace('(_model?.systemInstruction?.parts.first as TextPart).text', 'systemPromptText')
        text = text.replace('class GeminiService {', "class GeminiService {\n  static const String systemPromptText = '''" + sys_prompt + "''';")
        text = text.replace(match.group(0), 'systemInstruction: Content.text(systemPromptText),')
        
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(text)
        print("DONE")
    else:
        print("NO MATCH")
except Exception as e:
    print(f"Error: {e}")
