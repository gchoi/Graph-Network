# Justfile

VENV := ".venv"
PYTHON_VER := "3.12"

# list all tasks
default:
  @just --list

# Install uv
install-uv:
	curl -LsSf https://astral.sh/uv/install.sh | sh

# Set up Python virtual environment
venv: install-uv
    #!/usr/bin/env sh
    if [ "$(uname)" = "Darwin" ] || [ "$(uname)" = "Linux" ]; then
        echo "Installing virtual env on Darwin or Linux..."
        uv venv {{ VENV }} --python {{ PYTHON_VER }}
        . {{ VENV }}/bin/activate && uv sync
    else
        echo "Installing virtual env on Windows..."
        uv venv {{ VENV }} --python {{ PYTHON_VER }}
        . {{ VENV }}/Scripts/activate && uv sync
    fi