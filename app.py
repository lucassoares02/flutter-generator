import os
import re
from pathlib import Path

TEMPLATES_DIR = "templates"

TEMPLATE_MAP = {
    "model.dart.tpl": "model.dart",
    "entity.dart.tpl": "entity.dart",
    "repository.dart.tpl": "repository.dart",
    "usecase.dart.tpl": "usecase.dart",
    "controller.dart.tpl": "controller.dart",
    "page.dart.tpl": "page.dart",
    
}


def ensure_templates():
    Path(TEMPLATES_DIR).mkdir(exist_ok=True)

def pascal_case(s: str) -> str:
    # Converte algo como "user", "user_profile", "user-profile" ou "user profile" -> "UserProfile"
    parts = re.split(r'[^0-9a-zA-Z]+', s)
    return ''.join(p.capitalize() for p in parts if p)

def render_template(text: str, base: str):
    class_name = pascal_case(base)
    # substituições simples
    return text.replace("{{base}}", base).replace("{{Class}}", class_name)

def criar_arquivos(base_name: str):
    base = base_name.strip()
    if not base:
        raise ValueError("Nome base inválido")

    pasta = Path(base)
    pasta.mkdir(parents=True, exist_ok=True)

    for tpl_filename, out_suffix in TEMPLATE_MAP.items():
        tpl_path = Path(TEMPLATES_DIR) / tpl_filename
        if not tpl_path.exists():
            raise FileNotFoundError(f"Template inexistente: {tpl_path}. Rode com templates criados automaticamente ou crie manualmente.")
        tpl_text = tpl_path.read_text(encoding="utf-8")
        rendered = render_template(tpl_text, base)
        out_filename = f"{base}_{out_suffix}"
        out_path = pasta / out_filename
        out_path.write_text(rendered, encoding="utf-8")
        print(f"✅ Criado: {out_path}")

    print(f"\n📁 Pasta '{base}' e arquivos gerados com sucesso!")

if __name__ == "__main__":
    try:
        # garante templates padrão se estiverem ausentes
        ensure_templates()

        base = input("Digite o nome base (ex: user): ").strip()
        if base:
            criar_arquivos(base)
        else:
            print("❌ Nome base inválido.")
    except Exception as e:
        print("Erro:", e)
