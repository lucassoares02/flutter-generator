#!/usr/bin/env python3
import os
import re
from pathlib import Path
from datetime import datetime

TEMPLATES_DIR = Path("templates")

# Mapeamento: template -> caminho de saída
OUTPUT_MAP = {
    "model.dart.tpl": "lib/features/{{base}}/{{base}}_model.dart",
    "entity.dart.tpl": "lib/features/{{base}}/{{base}}_entity.dart",
    "repository.dart.tpl": "lib/features/{{base}}/{{base}}_repository.dart",
    "usecase.dart.tpl": "lib/features/{{base}}/{{base}}_usecase.dart",
    "controller.dart.tpl": "lib/features/{{base}}/{{base}}_controller.dart",
    "page.dart.tpl": "lib/features/{{base}}/{{base}}_page.dart",
    "state_app.dart.tpl": "lib/core/state/app_state.dart",
    "base_controller.dart.tpl": "lib/core/state/base_controller.dart",
    "http_service.dart.tpl": "lib/core/services/http_service.dart",
    "response_model.dart.tpl": "lib/core/services/response_model.dart",
    "main.dart.tpl": "lib/main.dart",
}


# --------------------------
# Funções utilitárias
# --------------------------

def ensure_templates():
    TEMPLATES_DIR.mkdir(exist_ok=True)
    
def pascal_case(s: str) -> str:
    parts = re.split(r'[^0-9a-zA-Z]+', s)
    return ''.join(p.capitalize() for p in parts if p)

def render_template_text(text: str, base: str):
    class_name = pascal_case(base)
    today = datetime.now().strftime("%Y-%m-%d")
    return text.replace("{{base}}", base).replace("{{Class}}", class_name).replace("{{date}}", today)

def render_path(pattern: str, base: str) -> Path:
    return Path(pattern.replace("{{base}}", base))

def criar_estrutura(base_name: str):
    base = base_name.strip()
    if not base:
        raise ValueError("Nome base inválido")

    raiz = Path(base)
    raiz.mkdir(exist_ok=True)
    (raiz / "assets").mkdir(exist_ok=True)
    (raiz / "fonts").mkdir(exist_ok=True)

    ensure_templates()

    for tpl_filename, out_pattern in OUTPUT_MAP.items():
        tpl_path = TEMPLATES_DIR / tpl_filename
        if not tpl_path.exists():
            print(f"⚠️ Template ausente, pulando: {tpl_path}")
            continue

        tpl_text = tpl_path.read_text(encoding="utf-8")
        rendered_text = render_template_text(tpl_text, base)

        destino_rel = render_path(out_pattern, base)
        destino = raiz / destino_rel.relative_to(Path(destino_rel).parts[0]) if destino_rel.parts[0] == base else raiz / destino_rel

        destino.parent.mkdir(parents=True, exist_ok=True)

        if destino.exists():
            print(f"⏭️ Já existe, pulando (não sobrescreve): {destino}")
            continue

        destino.write_text(rendered_text, encoding="utf-8")
        print(f"✅ Criado: {destino}")

    print(f"\n📁 Estrutura para '{base}' gerada com sucesso!")


# --------------------------
# Execução principal
# --------------------------

if __name__ == "__main__":
    try:
        base_input = input("Digite o nome base (ex: user): ").strip()
        if base_input:
            criar_estrutura(base_input)
        else:
            print("Nome base inválido.")
    except Exception as e:
        print("Erro:", e)
