# OpenKNX Homematic-Gateway 

KNX-Anbindung für Homematic-Thermostate über CCU(2) mit Konfiguration über die ETS.

Von Cornelius Köpp 2024-2026


# Beschreibung

Das Gateway ermöglicht einen rudimentären lesenden und schreibenden Zugriff auf ausgewählte Homematic-Geräte (Funkschnittstelle),
über eine Zentrale mit XML-RPC-Schnittstelle wie z.B. der Homematic CCU2.
Weitere Module sind zur funktionalen Ergänzung erhalten, z.B. zur Aggregation von Ist- und Status-Werten.


> ## Achtung ALPHA-STATUS!
>
> **Ein produktiver Einsatz wird zum aktuellen Zeitpunkt *nicht* empfohlen**!
>
> Der vorliegende Stand dient zur technischen Evaluation.
> Mehrere der enthaltenen Module mit Netzwerkzugriff nutzen blockierende HTTP(S)-Requests
> und können bzw. werden durch die auftretenden Verzögerungen die Bus-Kommunikation 
> und die Verarbeitung in anderen Modulen stören.
> Mögliche Folgen sind eine fehlende Reaktion auf Telegramme, fehlendes Update von KOs, unerwartetes Zeitverhalten, 
> sowie ggf. weitere nicht aufgeführte Effekte.
> Die Steuerung und Wertabruf der Homematic-Thermostate sind grundsätzlich möglich, 
> Logikkanäle und Funktionsblöcke sollten jedoch ausschließlich ohne externe Abhängigkeiten
> und Zeitabhängigem Verhalten eingesetzt werden.     
>
> Inkompatible Änderungen können ohne Vorankündigung erfolgen


## Funktionen / Module
 
| OpenKNX-Modul                                                                     | Beschreibung                                                                                                     |
|-----------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------|
| [OFM-ConfigTransfer](https://github.com/OpenKNX/OFM-ConfigTransfer)               | **Konfigurationstransfer:** Übertragung von Einstellungen                                                        |
| [OFM-Homematic](https://github.com/OpenKNX/OFM-Homematic)                         | **HomeMatic:** Anbindung von Thermostaten über eine Homematic CCU2 (oder andere kompatible Zentrale) via XML-RPC |   
| [OFM-InternetWeatherModule](https://github.com/OpenKNX/OFM-InternetWeatherModule) | **Internet Wetter:** Bereitstellung von Wetterdaten aus dem Internet                                             |
| [OFM-LogicModule](https://github.com/OpenKNX/OFM-LogicModule)                     | **Logiken:** Flexible Universallogiken und Zeitschaltuhren mit Feiertagsberechnung                               |
| [OFM-FunctionBlocks](https://github.com/OpenKNX/OFM-FunctionBlocks)               | **Funktionsblöcke:** Vordefinierte Funktionsbausteine, u.A. zur Aggregation mehrerer Werte                       |


# Test-Status

| Architektur / Hardware                                                        | Status     | Anmerkung |
|-------------------------------------------------------------------------------|------------|-----------|
| RP2040 / [OpenKNX Reg1-ETH](https://github.com/OpenKNX/OpenKNX/wiki/REG1-Eth) | Alpha      |           |
| ESP32                                                                         | ungetestet |           |


# Fremdbibliotheken

* OFM-Homematic nutzt [TinyXML2](https://github.com/leethomason/tinyxml2) von Lee Thomason et al. (Zlib license)