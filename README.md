# README.md

## Пример

## Версия
- 2.0.1a6
  
# GSH — Runtime Hook (compat96k-runnerhf6)
**Описание.** Хук для GUI: авто-добавляет панель «Предустановки» (Город/Равнина/Море), проставляет дефолты (freq/band/h_TX/h_RX), триггерит пересчёт. 
**Функционал.**
- Патчит `QApplication.__init__` → «вооружает» сканер после создания приложения.
- Ищет первый `QFormLayout` в окне и вставляет панель **один раз** (guard).

## Build
- compat96k-runnerhf6

## Изменения
- Починены «пустые окна»: сканер не трогает `QApplication.layout()`, работает по `topLevelWidgets()`.
- Убран дубляж панелей: guard по `container.setProperty("gsh_presets_injected", True)`.
- Runner не зависит от переменной `HOOK` и не тащит старые пути; грузит модуль хука напрямую.
