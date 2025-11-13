# BUILD.md

**Текущая версия:** 2.0.1a6  
**Build:** compat96k-runnerhf6

## SETUP / PREPARE
- Python 3.10+ (у тебя 3.13 ок)
- PySide6
- Проект: `$PRJ/src` должен содержать `gsh_prizma_cdsauav.ui.app` или `ui.app`

## INSTALL
```bash
unzip ~/work/GSH_Prizma_UAV-runtime-hook-compat96k-runnerhf6-2.0.1a6-src.zip -d ~/work/
cd ~/work/GSH_Prizma_UAV-runtime-hook-compat96k-runnerhf6-2.0.1a6-src
```

## Быстрый запуск
### Через пакетный раннер
```bash
export PRJ=/home/soltino/work/Bacup/GSH_Prizma_UAV-v2.X_templates-2.0.1a6-src
chmod +x tools/run_with_hook_autofind.sh
GSH_HOOK_DEBUG=1 GSH_FORCE_DEFAULTS=1 ./tools/run_with_hook_autofind.sh
```

### Через твой `run_gui.sh`
```bash
export PRJ=/home/soltino/work/Bacup/GSH_Prizma_UAV-v2.X_templates-2.0.1a6-src
export HOOK_FILE="$PWD/src/gsh_rt_hook/runtime_hook.py"
GSH_HOOK_DEBUG=1 GSH_FORCE_DEFAULTS=1 ~/work/run_gui.sh --with-hook
```
