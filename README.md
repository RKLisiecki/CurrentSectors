# Current Sectors - Introduction
An upcoming R library, which: 
- empowers to drill down stock tickers from stock exchanges from within [Euronext](https://www.euronext.com/en) across industries, sectors and countries,
- facilitates comparative analysis of shares' market performance,
- streamlines the process of sector structure analysis of stock exchanges in various countries,
- simplifies the process of bulk stock quote data ingestion, organization and storage,
- provides useful tools all across the board of financial time series data analysts' workflows.

While there are a couple of industry and sector classifications (i.e. [GICS](https://www.msci.com/our-solutions/indexes/gics) and [ICB](https://www.lseg.com/en/ftse-russell/industry-classification-benchmark-icb)), Current Sectors relies on the widely adopted [Yahoo Finance company classification](https://finance.yahoo.com/sectors).
# Project documentation (PL)
<details>
  <summary> Click to expand or contract </summary>
  
## 1. Charakterystyka oprogramowania
### Nazwy skrócone:  
**cursecs** (w otoczeniu zewnętrznym) / **CS** (wewnątrz projektu).
### Nazwa pełna: 
Current Sectors.
### Krótki opis ze wskazaniem celów: 
biblioteka języka R wspomagająca analizę notowań spółek giełdowych w przekrojach sektorowych i geograficznych.

## 2. Prawa autorskie
### Autorzy:
**Ryszard Karol Lisiecki** – pomysłodawca, projektant, programista, tester;
**Michał Bartkiewicz** – kontroler jakości, programista, tester.

### Warunki licencyjne: 

**licencja MIT** - umożliwiająca użytkowanie, dystrybucję, modyfikację oraz czerpanie korzyści z kodu bez ograniczeń z wykluczeniami zdefiniowanymi w przepisach i/lub precedensach nadrzędnych;

**zastrzeżenie Fair Use** - dotyczące wykorzystania żródeł klasyfikacji spółek oraz danych giełdowych jedynie do celów edukacyjnych oraz ograniczające ich wykorzystanie w materiałach wtórnych bazujących na opisywanym oprogramowaniu.

## 3. Specyfikacja wymagań
Wykorzystane w nazewnictwie identyfikatorów wymagań skrótowce opierają się na angielskim brzmieniu słów. Klasyfikacji wymagań pozafunkcjonalnych dotyczących jakości dokonano w oparciu o standard **ISO/IEC 25010:2011**.


| Identyfikator | Nazwa | Opis | Priorytet | Kategoria |
| --- | --- | --- | --- | --- |
| NF.Q.SP.1 | Wydajność biblioteki | Operacje dotyczące przetwarzania matematycznego danych *offline* na komputerze bądź serwerze użytkownika funkcje biblioteki wykonują możliwie najszybciej, z wykorzystaniem przetwarzania równoległego | 1 | pozafunkcjonalne |
| NF.Q.SP.2 | Wydajność web-scrapingu | Operacje dotyczące zaciągania danych z API oraz stron znajdujących się w kontekście systemu funkcje biblioteki wykonują w dbałości o zachowanie norm powolności | 1 | pozafunkcjonalne |
| NF.Q.S.C.1 | Bezpieczeństwo - poufność | Biblioteka w żaden sposób nie monitoruje, nie archiwizuje ani nie przesyła informacji o działalności użytkownika ponad to, co jest konieczne do spowalniania web-scrapingu | 1 | pozafunkcjonalne |
| NF.Q.S.I.1 | Bezpieczeństwo - integralność danych zawartych | Dane giełdowe zawarte w bibliotece sprawdzone są pod kątem poprawności formalnej oraz zmodyfikowane w stosunku do źródłowych tylko w aspekcie organizacji i składowania danych | 1 | pozafunkcjonalne |
| NF.Q.S.I.1 | Bezpieczeństwo - integralność danych zaciąganych z internetu | W istniejącym zakresie biblioteka w żaden sposób nie może zagwarantować poprawności danych zaciąganych z Internetu innej niż formalna | 1 | pozafunkcjonalne |
| ... | ... | ... | ... | ... |

### Wstępny zakres wymagań funkcjonalnych

**Wyświetlanie dostępnych list zbiorczych i przekrojów**
- Wyświetl tabelę spółek, ich tickerów, ich przemysłów, sektorów, giełd, państw, najbardziej aktualnej kapitalizacji rynkowej i poziomu floatu.
- Wyświetl listę drzewa przemysłów, sektorów i podsektorów.
- Wyświetl listę spółek danego przemysłu/sektora w danym państwie.
   
**Wyszukiwanie z filtrem** 
- Wyświetl wybrany przekrój z ograniczeniem do spółek, które są w top n największych kapitalizacji rynkowych tego przekroju.
- Wyświetl wybrany przekrój z ograniczeniem do spółek, które mają float większy niż x % kapitalizacji rynkowej.

**Wyświetlanie wykresu dynamiki stóp zwrotu**
- Wyświetl wykres zbiorczy stóp zwrotu spółek z danego przekroju (zwykłych lub logarytmicznych).
        
**Wyświetlanie tabeli sktruktury sektorowej spółek wybranego przekroju**
- Przelicz wskaźnik struktury i wyświetl tabelę udziałów oraz kapitalizacji łącznej w podziale na przemysły i sektory.
  
**Wyświetlanie wykresu powierzchniowego struktury sektorowej spółek wybranego państwa**
- Na podstawie tabeli struktury sektorowej wyświetl wykres powierzchniowy.

**Wyświetlanie wykresu dynamiki sektorów wybranego państwa**
- Dla danego zakresu czasowego wyświetl wykres zbiorczy z wykresami liniowymi dynamiki kapitalizacji wszystkich sektorów (początek okresu=100).
  
**Ściąganie list notowań spółek z API**
- Zaktualizuj szeregi czasowe wybranego przekroju lub całego państwa.
  
**Sprawdzanie aktualności notowań w bazie**
- Wyświetl listę spółek danego przekroju uszeregowaną od tych z najstarszym notowaniem zapisanym w bazie.
  
**Imputacja notowań (np. świątecznych)**
- Zaimputuj (zsynchronizuj) puste wartości wybranego przekroju o tym samym początku i końcu notowań.

</details>
