# 🚀 FiveM SFTP Sync & Manager

<p align="center">
  <b>Kompletní řešení pro vývojáře FiveM přímo ve VS Code!</b><br>
  <i>Už žádné zdlouhavé přetahování souborů a manuální psaní příkazů do txAdminu.</i>
</p>

---

## ✨ Hlavní funkce

*   **⚡ Real-Time Synchronizace:** Upravíte soubor, stisknete `Ctrl+S` a změny jsou do sekundy na serveru!
*   **📂 Remote Explorer:** Kompletní správa vzdálených souborů přímo v bočním panelu VS Code (Otevřít, Stáhnout, Smazat, Přejmenovat, Vytvořit novou složku/soubor).
*   **🔄 Quick Actions (Start/Stop/Restart):** Klikněte pravým tlačítkem na složku v Exploreru a rovnou script restartujte.
*   **🛡️ Multi-Host Support:** Podporuje klasické VPS servery (přes SSH/RCON) i **Herní Hostingy / Shared Hosts** (Fakaheda, Hicoria, Lunashield atd.) přes unikátní `HTTP Helper`, který obchází zablokované SSH/RCON porty.
*   **🔒 Bezpečné ukládání hesel:** Hesla nejsou uložena v čistém textu, ale využívají integrovaný systém `VS Code SecretStorage`.

---

## 🛠️ Instalace

### 1. Nainstalujte rozšíření
Nainstalujte zkompilovaný soubor `.vsix` přímo do vašeho VS Code:
1. Otevřete Command Palette (`Ctrl+Shift+P`).
2. Vyhledejte `Extensions: Install from VSIX...`
3. Vyberte soubor `fivem-sftp-sync-1.1.0.vsix`.

### 2. Přidejte `vscode-rcon` na váš server (DŮLEŽITÉ)
Aby mohl VS Code úspěšně odesílat příkazy na server (i u hosterů blokujících RCON), obsahuje toto rozšíření malý pomocný script.
1. Složku `vscode-rcon` (najdete ji u sebe v projektu) zkopírujte na váš FiveM server do složky `resources`.
2. Otevřete soubor `server.cfg` a přidejte do něj:
   ```cfg
   ensure vscode-rcon

   # Nastavení práv pro příkazy
   add_ace resource.vscode-rcon command.restart allow
   add_ace resource.vscode-rcon command.start allow
   add_ace resource.vscode-rcon command.stop allow
   ```
3. Otevřete soubor `vscode-rcon/server.lua` a změňte v něm heslo na první řádce (např. `Heslicko`).
4. Restartujte FiveM server.

---

## ⚙️ Konfigurace

Stiskněte `Ctrl+Shift+P` a spusťte příkaz **`FiveM: Connect to Server`**. Tím se vám v projektu vytvoří soubor `.fivem-sftp.json`.

### A) Jsem na herním hostingu (txAdmin, blokované SSH)
Tato konfigurace používá **HTTP Helper**, který spolehlivě projde přes všechny firewally.

```json
{
    "host": "host.lunashield.cc",
    "port": 2022,
    "username": "muj_login",
    "remotePath": "/txData/server.base/resources",
    "autoUpload": true,
    "useHttpHelper": true,
    "httpHelperPassword": "Heslicko",
    "rconPort": 25576,
    "useRcon": false
}
```

### B) Jsem na vlastním VPS (Linux/Windows)
Zde můžete použít klasický **FiveM RCON**.

```json
{
    "host": "123.45.67.89",
    "port": 22,
    "username": "root",
    "remotePath": "/home/fivem/server-data/resources",
    "autoUpload": true,
    "useHttpHelper": false,
    "useRcon": true,
    "rconPort": 30120,
    "rconPassword": "MojeRconHesloZeServerCfg"
}
```

---

## 💻 Použití
*   **Otevření vzdáleného souboru:** Klikněte na něj v postranním panelu. Stáhne se a otevře se vám v novém panelu. Jakmile jej upravíte a uložíte (`Ctrl+S`), automaticky se nahraje zpět!
*   **Správa složek:** Pravým tlačítkem myši na jakýkoliv resource můžete vytvořit novou složku, soubor, nebo smazat/přejmenovat existující.
*   **Restart Scriptu:** Pravým kliknutím na složku scriptu a volbou `FiveM: Restart Resource`. V konzoli serveru uvidíte barevný výpis `[VSCode Sync] restart <nazev>`.

---

## 📝 O projektu
Tento nástroj byl vytvořen pro maximalizaci efektivity při vývoji FiveM serverů a eliminaci nudných manuálních činností.
