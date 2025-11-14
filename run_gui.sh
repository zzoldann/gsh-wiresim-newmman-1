# Пример запуска GUI

# run_gui.sh

#!/usr/bin/env bash
set -euo pipefail
: "${PRJ:?Set PRJ to your project root, e.g. /home/soltino/work/Bacup/GSH_Prizma_UAV-v2.X_templates-2.0.1a6-src}"
PY="$PRJ/.venv/bin/python"
[[ -x "$PY" ]] || PY="python3"
export PYTHONPATH="$PRJ/src:${PYTHONPATH:-}"

use_hook=0
if [[ "${1-}" == "--with-hook" ]]; then
  use_hook=1
  shift || true
fi

if (( use_hook )); then
  HOOK="${HOOK_FILE:-}"
  if [[ -z "$HOOK" ]]; then
    HOOK=$(ls -1t "$HOME"/work/GSH_Prizma_UAV-runtime-hook-*/src/gsh_rt_hook/runtime_hook.py 2>/dev/null | head -n1 || true)
  fi
  if [[ -n "$HOOK" ]]; then
    echo "[HOOK] using: $HOOK"
    exec "$PY" - <<PY
import importlib.util, os, sys
hook_path = os.environ.get("HOOK_FILE") or r"%s"
spec = importlib.util.spec_from_file_location("gsh_rt_hook.runtime_hook", hook_path)
mod  = importlib.util.module_from_spec(spec); spec.loader.exec_module(mod)
main = getattr(mod, "main_autofind", None) or getattr(mod, "main", None)
if not main:
    print("[ERR] Hook has no main_autofind()/main()", file=sys.stderr); sys.exit(1)
main()
PY
  else
    echo "[WARN] runtime hook not found; running plain."
  fi
fi

# plain run
if [[ -x "$PRJ/.venv/bin/prizma-cdsa" ]]; then
  if "$PRJ/.venv/bin/prizma-cdsa" 2>/dev/null; then
    exit 0
  fi
  echo "[WARN] Broken entrypoint (no gsh_prizma_cdsauav.cli). Using -m ui.app."
fi
exec "$PY" -m gsh_prizma_cdsauav.ui.app
