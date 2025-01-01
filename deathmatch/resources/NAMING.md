# 📁Pravidlá pre pomenovanie súborov a organizáciu priečinkov v projekte

Tento dokument stanovuje pravidlá pre organizáciu a pomenovanie priečinkov a súborov v projekte. Dodržiavanie týchto pravidiel pomôže udržať poriadok a konzistenciu v štruktúre projektu.

---

## Vysvetlenie hlavných priečinkov

- **[owl]**: Priečinok obsahuje skripty zo základného modu Owl Gaming.
- **[orbit]**: Priečinok obsahuje súbory z nadstavby Orbit Framework.
- **[models]**: Priečinok obsahuje modely, skiny a ostatné súbory, ktoré súvisia so zmenou textúr alebo modelov v hre.

---

## Vkladanie skriptov do projektu

- Ak skripter vytvorí svoje vlastné skripty, musia byť vložené do priečinka s názvom:
  ```
  [meno_skripter]/meno_resourcu
  ```
  - **[meno_skripter]**: Používateľské meno alebo identifikátor autora skriptov.
  - **[meno_resourcu]**: Názov funkčného modulu alebo zdroja, ktorý skripty implementujú.

### Príklad štruktúry priečinkov:
```
resources
├── [orbit]
├── [owl]
├── [models]
|
├── [janko]
|   ├── trucker
│   |   ├── s_main.lua
│   |   ├── c_main.lua
|   ├── admin_menu
│       ├── s_main.lua
│       ├── c_main.lua
|
├── [ferko]/pomocne_skripty
│   ├── s_server.lua
|   ├── s_commands.lua
│   ├── c_ui.lua
```

---

## Pomenovanie skriptov

- **Serverové skripty**: Musia byť pomenované podľa formátu:
  ```
  s_meno_skriptu.lua
  ```
  - **"s"** označuje serverovú časť.
  - **[meno_skriptu]** by malo stručne a jasne opisovať funkciu skriptu.

- **Clientské skripty**: Musia byť pomenované podľa formátu:
  ```
  c_meno_skriptu.lua
  ```
  - **"c"** označuje klientskú časť.
  - **[meno_skriptu]** by malo byť podobne stručné a popisné.

### Príklady pomenovania skriptov:
- `s_databaza.lua`: Skript na prácu so serverovou databázou.
- `c_ui.lua`: Skript na správu užívateľského rozhrania na strane klienta.
- `s_validacia.lua`: Serverová validácia dát.
- `c_frontend.lua`: Klientská logika frontendu.

---

## Doplnkové odporúčania na udržanie poriadku

1. **Dokumentácia ku každému priečinku**:
   - V každom priečinku pridajte krátky súbor `README.md`, ktorý vysvetľuje účel priečinka a skriptov v ňom.

2. **Modularita**:
   - Skripty by mali byť navrhnuté ako samostatné moduly, ktoré je možné opakovane použiť.

3. **Konzistentné používanie názvov**:
   - Používajte len malé písmená a podčiarkovníky (napr. `s_pripojenie_db.lua` a nie `sPripojenieDB.lua`).

4. **Verzia a zmeny**:
   - Ak aktualizujete skript, pridajte komentáre s vysvetlením zmien.

---

Dodržiavaním týchto pravidiel zaistíte, že projekt bude prehľadný a ľahko udržiavateľný. Ak máte otázky alebo návrhy na zlepšenie týchto pravidiel, pridajte ich do sekcie `PRAVIDLA.md`. Ďakujeme za spoluprácu!
