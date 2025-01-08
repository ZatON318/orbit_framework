# Quick Setup

## Popis
Resource na rýchle počiatočné nastavenie servera, vytvorí základné frakcie, interiéri a auta pre autoškolu

---

## Požiadavky

Zoznam požiadaviek pre tento resource:
- **MTA:SA server**: Verzia 1.5.9 alebo vyššia
- **Ďalšie resourcy**: mysql

---

## Inštalácia

Postup na inštaláciu resource-u:

1. Stiahnite tento resource a skopírujte ho do adresára `resources` na vašom serveri.
2. Pridajte resource do `mtaserver.conf`:
   ```xml
   <resource src="quick_setup" startup="1" protected="0" />
   ```
3. Reštartujte server alebo načítajte resource príkazom:
   ```
   refresh
   start quick_setup
   ```

---

## Použitie

### Príkazy
Zoznam dostupných príkazov:
- **/setup**: Vyvolá menu základneho nastavenia servera.


---

## Changelog

Prehľad zmien v jednotlivých verziách:

### Verzia 1.0.0
- Pridané základné funkcie
- Opravené chyby pri inicializácii


---

## Autorstvo

- **Autor**: ZatOFF
- **Kontakt**: Discord: zatoff

---

## Licencia
Tento resource je licencovaný pod [MIT licenciou](https://opensource.org/licenses/MIT).