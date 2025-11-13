# GSH Prizma UAV — Runtime Hook (compat96k-runnerhf6)
**Описание.** Хук для PySide6 GUI: авто-добавляет панель «Предустановки» (Город/Равнина/Море), проставляет дефолты (freq/band/h_TX/h_RX), триггерит пересчёт. Работает без Qt qgetenv: только `os.environ`.  

**Функционал.**
- Патчит `QApplication.__init__` → «вооружает» сканер после создания приложения.
- Ищет первый `QFormLayout` в окне и вставляет панель **один раз** (guard).
- Дефолты: 868 / 0.125 / 30 / 2. Поддерживает `GSH_FORCE_DEFAULTS=1`.
- Runner запускает GUI с приоритетом локального хука, корректно ставит `PYTHONPATH`.

## Версия
- 2.0.1a6

## Build
- compat96k-runnerhf6

## Изменения
- Починены «пустые окна»: сканер не трогает `QApplication.layout()`, работает по `topLevelWidgets()`.
- Убран дубляж панелей: guard по `container.setProperty("gsh_presets_injected", True)`.
- Runner не зависит от переменной `HOOK` и не тащит старые пути; грузит модуль хука напрямую.
