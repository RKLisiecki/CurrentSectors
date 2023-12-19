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

# Dokumentacja projektowa  

## 1. Charakterystyka oprogramowania
### Nazwy skrócone:  
**cursecs** (w otoczeniu zewnętrznym) / **CS** (wewnątrz projektu).
### Nazwa pełna: 
Current Sectors.
### Krótki opis ze wskazaniem celów: 
biblioteka języka R wspomagająca analizę notowań spółek giełdowych w przekrojach sektorowych i geograficznych.

## 2. Prawa autorskie
### Członkowie zespołu:
**Ryszard Karol Lisiecki** – pomysłodawca, projektant, programista, tester - prawa autorskie do koncepcji oraz bazy kodu biblioteki włącznie z wykonanymi projektami testów, do wykonanych prezentacji, demonstracji i specyfikacji wymagań;

**Michał Bartkiewicz** – tester wdrożeniowy - prawa autorskie do części testów zaprojektowanych i wykonanych samodzielnie.

### Warunki licencyjne: 

**licencja MIT** - umożliwiająca użytkowanie, dystrybucję, modyfikację oraz czerpanie korzyści z kodu bez ograniczeń z wykluczeniami zdefiniowanymi w przepisach i/lub precedensach nadrzędnych;

**zastrzeżenie Fair Use** - dotyczące wykorzystania żródeł klasyfikacji spółek oraz danych giełdowych jedynie do celów edukacyjnych oraz ograniczające ich wykorzystanie w materiałach wtórnych bazujących na opisywanym oprogramowaniu.

## 3. Specyfikacja wymagań
Wykorzystane w nazewnictwie identyfikatorów wymagań skrótowce opierają się na angielskim brzmieniu słów:
- dotyczących kryteriów jakości oprogramowania (**system performance**; **security**: confidentiality, integrity; **functionality**: interoperability; **reliability**: availability, fault tolerance; **usability**: accessibility, learnability, ease of use; **portability**: adaptability, installability; **maintainability**: testability)
- określeń funkcjonalności (display datasets; display help; display lists; update time series; sector structure; sector time series; sector technical analysis). 

### Wymagania funkcjonalne

Opis wymagań jest adekwatny dla użytkowników, którzy zainstalowali oraz załadowali bibliotekę CurrentSectors do własnego środowiska R, po czym wywołują w konsoli odpowiednie polecenia i funkcje opisane w plikach pomocy.

#### **Grupa nr 1 (core data):** wyświetlanie i/lub zapis do zmiennej list zbiorczych

| Identyfikator | Nazwa | Opis | Priorytet | Kategoria |
| --- | --- | --- | :---: | --- |
| F.CD.1 | Wyświetlenie/przyłączenie do środowiska R danych dołączonych | Wywołanie danych dołączonych wraz z biblioteką po nazwie podzbioru powoduje ich wyświetlenie oraz umożliwia jawne włączenie do środowiska lokalnego. | 1 | Funkcjonalne |
| F.CD.2 | Wyświetlanie plików pomocy | Zapytanie za pośrednictwem funkcji `help(object)` o zbiór danych lub funkcję biblioteki powoduje wyświetlenie treści odpowiedniego pliku pomocy. | 1 | Funkcjonalne |
| F.CD.3 | Tworzenie tabel zawężonych list spółek - funkcja `listCompanies(country, sector, industry,...)` | Funkcja z opcjonalnymi parametrami tekstowymi nazwy kraju (`country`) i nazwy sektora (`sector`) lub nazwy prz3mysłu (`industry`)  zwraca w formacie tabeli (struktury `data.frame`) zbiór **nazw, symboli spółek, ich przemysłów, sektorów, krajów rejestracji** oraz **walut kwotowania** właściwej konkretnemu symbolowi w źródle notowań. Funkcja domyślnie zwraca pełną listę spółek. | 1 | Funkcjonalne |
| F.CD.3.1 | Tworzenie tabel bardziej zawężonych list spółek - funkcja `listCompanies(country, sector, industry, market_cap_thresh)` | Ta sama funkcyja, co w **F.CD.3** z dodatkowym, opcjonalnym parametrem liczbowym progowego **poziomu kapitalizacji rynkowej** (`market_cap_thresh`) ten sam rezultat zawęża do spółek przekraczających określony poziom kapitalizacji rynkowej.  | 1 | Funkcjonalne |
| F.CD.4 | Drukowanie zagnieżdżonej listy sektorów i przemysłów wraz z przykładami spółek - funkcja `printSectorStructure(company_database)` | Funkcja zwraca wydruk zagnieżdżonej listy przemysłow i sektorów dostępnych w bazie  wraz z przykładami firm i ich tickerów dla każdego z jej elementów. Lista wypisywana jest przez kilka sekund symulując wydruk. | 1 | Funkcjonalne |

#### **Grupa nr 2 (database):** zapis i aktualizacja szeregów czasowych

| Identyfikator | Nazwa | Opis | Priorytet | Kategoria |
| --- | --- | --- | :---: | --- |
| F.DB.1 | Zapis danych dołączonych biblioteki na dysku użytkownika - funkcja `saveData(path)` | Funkcja z obligatoryjnym parametrem ścieżki dyskowej w formacie tekstowym (właściwym środowiskom Linuxowym) zapisuje w tej lokalizacji dane dołączone biblioteki w plikach `.csv`. Umożliwia to ich późniejszą aktualizację. | 1 | funkcjonalne |
| F.DB.2 | Aktualizowanie baz szeregów czasowych `.csv` użytkownika - funkcja `updateData(path_to_local_data)` | Funkcja z obligatoryjnym parametrem ścieżki dyskowej (jak w F.DB.1) aktualizuje szeregi czasowe notowań uprzednio zapisanych przez użytkownika funkcją `saveData(path)`.  | 1 | funkcjonalne |


#### **Grupa nr 3 (sector structures):** analiza struktury sektorowej walorów w danym państwie

| Identyfikator | Nazwa | Opis | Priorytet | Kategoria |
| --- | --- | --- | :---: | --- |
| F.SS.1 | Tworzenie tabel struktury sektorowej - funkcja `sStructure(country, libdata=TRUE, path_to_data=NULL)` | Funkcja z obligatoryjnym parametrem nazwy państwa (`country`) oraz opcjonalnymi parametrami `libdata` oraz `path_to_data` zwraca w formacie tekstowym tabeli najbardziej aktualny zbiór wartości łącznych kapitalizacji (`Market cap total`) w Euro oraz udziałów  w kapitalizacji łącznej (`Total market cap share`) wszystkich spółek skategoryzowanych w tych sektorach i przemysłach. Funkcja przelicza odpowiednie wartości do Euro, jeżeli to konieczne. Domyślnie funkcja wykorzystuje dane dołączone a przy ustaleniu wartości parametru `libdata=FALSE` ich aktualizowane wersje zapisane w koniecznej wtedy do podania lokalizacji `path_to_data`, zapisanej jak w F.DB.1 | 1 | funkcjonalne |
| F.SS.2 | Tworzenie wykresu struktury sektorowej - funkcja `sStructureChart(country, libdata=TRUE, path_to_data=NULL)` | Funkcja z opcjonalnymi parametrami nazwy państwa (`country`) oraz `libdata` i `path_to_data` zwraca wykres powierzchniowy udziałów poszczególnych sektorów w kapitalizacji łącznej spółek skategoryzowanych tymi sektorami. Funkcja wykorzystuje przeliczenie odpowiednich wartości do Euro, gdy to konieczne. Domyślnie struktura prezentowana jest dla całego zbioru spółek a uzupełnienie parametru nazwy państwa zawęża rezultat geograficznie. Domyślnie funkcja wykorzystuje dane dołączone a przy ustaleniu wartości parametru `libdata=FALSE` ich aktualizowane wersje zapisane w koniecznej wtedy do podania lokalizacji `path_to_data`, zapisanej jak w F.DB.1. | 1 | funkcjonalne |


#### **Grupa nr 4 (sector time series):** analiza szeregów czasowych sektorów
funkcje sIndices(country), sIndicesChart(...) - wartość kapitalizacji w czasie - tabela i wykres
funkcja sIndicesTRCompChart(country1, country2, sector1, sector2) - wykres porównawczy indeksów jednopodstawowych kapitalizacji t1=100
| Identyfikator | Nazwa | Opis | Priorytet | Kategoria |
| --- | --- | --- | :---: | --- |
| F.STS.1 | Tworzenie tabeli wartości łącznej kapitalizacji spółek w państwie względem sektorów - funkcja `sIndices(country, libdata=TRUE, path_to_data = NULL)` | Funkcja z opcjonalnymi parametrami nazwy państwa (`country`) oraz `libdata` i `path_to_data` zwraca w formie tabeli (struktury `data.frame`) wartości łączne kapitalizacji spółek we wszystkich sektorach (kolumny), dla poszczególnych miesięcy z notowaniami dostępnymi w bazie szeregów czasowych (wiersze). Wartości przeliczone są do waluty Euro, na podstawie notowań poszczególnych spółek w zbiorze danych. Domyślnie prezentowane są wyliczenia dla całego zbioru spółek a uzupełnienie parametru wybranego państwa zawęża reultat geograficznie. Domyślnie funkcja wykorzystuje dane dołączone a przy ustaleniu wartości parametru `libdata=FALSE` ich aktualizowane wersje zapisane w koniecznej wtedy do podania lokalizacji `path_to_data`, zapisanej jak w F.DB.1.| 1 | funkcjonalne |
| F.STS.2 | ...(funkcja `sIndicesChart(country)`) | ... | 1 | funkcjonalne |
| F.STS.3 | ...(funkcja `sIndicesTRCompChart(country)`) | ... | 1 | funkcjonalne |

#### **Grupa nr 5 (sector technical analysis):** - raport analizy technicznej grupy spółek sektora w państwie

| Identyfikator | Nazwa | Opis | Priorytet | Kategoria |
| --- | --- | --- | :---: | --- |
| F.TA.1 | Tworzenie tabeli raportu analizy technicznej przekroju sektorowo-geograficznego spółek - funkcja `TAReport(country, sector, libdata = TRUE, path_to_data = NULL)` | Funkcja z obligatoryjnymi parametrami nazwy państwa (`country`) oraz nazwy sektora (`sector`) i opcjonalnymi parametrami `libdata` oraz `path_to_data` zwraca w formie tabeli (struktury `data.frame`) raport analizy technicznej wszystkich spółek wybranego przekroju sektorowo-geograficznego. Wiersze tabeli odpowiadają kolejnym spółkom. Kolumny tabeli, to `Name` - nazwa spółki, `Ticker` - jej użyty symbol giełdowy, `Industry` - kategoria przemysłu spółki, `MA` - kategoria trendu notowań (`bullish` lub `bearish`) ustalona na podstawie relacji aktualnej ceny do wartości 11-okresowej średniej ruchomej, `RSI` - kategoria oscylatora Relative Strength Index (`overbought`, `no signal` lub `oversold`) ustalona na podstawie 14-okresowej wartości wskaźnika RSI w jednym z przedziałów (<70-100>, [30-70], <0, 30>). Domyślnie funkcja wykorzystuje dane dołączone a przy ustaleniu wartości parametru `libdata=FALSE` ich aktualizowane wersje zapisane w koniecznej wtedy do podania lokalizacji `path_to_data`, zapisanej jak w F.DB.1. | 1 | funkcjonalne |

### Wymagania pozfunkcjonalne

Klasyfikacji wymagań pozafunkcjonalnych dotyczących jakości dokonano inspirując się standardem **ISO/IEC 25010:2011**. Uwzględniono tylko subiektywnie najważniejsze kryteria.

| Identyfikator | Nazwa | Opis | Priorytet | Kategoria |
| --- | --- | --- | :---: | --- |
| NF.Q.SP.1 | Wydajność biblioteki | Operacje dotyczące przetwarzania matematycznego danych *offline* na komputerze bądź serwerze użytkownika funkcje biblioteki wykonują możliwie najszybciej, z wykorzystaniem przetwarzania równoległego. | 1 | pozafunkcjonalne |
| NF.Q.SP.2 | Wydajność web-scrapingu | Operacje dotyczące zaciągania danych z API oraz stron znajdujących się w kontekście systemu funkcje biblioteki wykonują w dbałości o nieprzekracznie limitów API Yahoo Finance. | 1 | pozafunkcjonalne |
| NF.Q.S.C.1 | Bezpieczeństwo - poufność | Biblioteka w żaden sposób nie monitoruje, nie archiwizuje ani nie przesyła informacji o działalności użytkownika ponad to, co jest konieczne do spowalniania web-scrapingu. | 1 | pozafunkcjonalne |
| NF.Q.F.I.1 | Interoperacyjność | Biblioteka może współpracować z innymi bibliotekami środowiska R nawet w przypadków konfliktu nazw funkcji. Funkcje biblioteki dodawane są do ścieżki wyszukań po załadowaniu biblioteki. | 1 | pozafunkcjonalne |
| NF.Q.R.FT.1 | Odporność na błędy użytkowników | Działanie funkcji biblioteki jest uodpornione na większość najczęściej popełnianych błędów podczas wprowadzania danych przez użytkownik. | 1 | pozafunkcjonalne |
| NF.Q.U.A.1 | Przystępność | Biblioteka prezentuje pliki pomocy w języku angielskim - w tym dla użytkowników niedowidzących, korzystających z czytników ekranu. | 1 | pozafunkcjonalne |
| NF.Q.U.L.1 | Łatwość przyswojenia | Biblioteka zawiera niewielką liczbę funkcji, na wysokim poziomie abstrakcji oraz co najwyżej kilku parametrach. | 1 | pozafunkcjonalne |
| NF.Q.U.EoU.1 | Łatwość użytkowania | Funkcje biblioteki mają intuicyjne nazwy oraz dostępne pliki pomocy zawierające przykłady użycia | 1 | pozafunkcjonalne |
| NF.Q.P.A.1 | Przystosowawczość | Działanie biblioteki nie jest upośledzane poprzez zmiany sprzętu bądź systemu operacyjnego tak długo, jak wspierają one działanie środowiska R w odpowiedniej wersji. | 1 | pozafunkcjonalne |
| NF.Q.P.I.1 | Efektywność instalacji | Biblioteka może zostać zarówno zainstalowana, jak też odinstalowana poprzez uruchomienie jednej linijki kodu. | 1 | pozafunkcjonalne |
| NF.Q.M.T.1 | Testowalność | Funkcje bibilioteki posiadają niezawierające sprzeczności kryteria akceptowalności zwracanych rezultatów. | 1 | pozafunkcjonalne |


## 3. Architektura oprogramowania

### Stos uruchomieniowy: 
| Nazwa | Typ |  Opis | Uwagi |
| --- | --- | --- |  --- |
| Windows 10 / Windows 11 / Linux (kernel 2.4.6 i wyżej) / MacOS (Catalina i późniejsze) | system operacyjny | alternatywy umożliwiające działanie języka R | bardzo prawdopodobne działanie również na starszych wersjach systemów, sytemach Windows Server oraz OpenBSD |
| działające łącze internetowe | infrastruktura | działające połączenie SSH oraz protokół HTTP |  istotne tylko przy pierwszej instalacji oraz aktualizacjach danych |
| interpreter R w wersji 4.2.x lub wyższej | interpreter | środowisko języka R |  --- |
| devtools / remotes | pakiet / biblioteka R | ... |  alternatywne pakiety służące instalacji biblioteki |
| xts | pakiet / biblioteka R | ... |  --- |
| zoo | pakiet / biblioteka R | ... |  --- |
| quantmod | pakiet / biblioteka R | ... |  --- |
| ... | ... | ... | ... |

R 4.2.x + wraz z zainstalowaną biblioteką devtools lub remotes ORAZ zależnościami biblioteki - innymi bibliotekami R: xts, zoo, quantmod (być może też dplyr i ggplot2);

### Stos technologiczny: 

| Nazwa | Typ |  Opis | Uwagi |
| --- | --- | --- |  --- |
| Windows 10 / Windows 11 / Linux (kernel 2.4.6 i wyżej) / MacOS (Catalina i późniejsze) | system operacyjny | alternatywy umożliwiające działanie języka R | bardzo prawdopodobne działanie również na starszych wersjach systemów, sytemach Windows Server oraz OpenBSD |
| działające łącze internetowe | infrastruktura | działające połączenie SSH oraz protokół HTTP |  istotne w całym cyklu rozwoju oprogramowania |
| interpreter R w wersji 4.2.x lub wyższej | interpreter | środowisko języka R |  --- |
| środowisko R Studio | zintegrowane środowisko wytwórcze | ... | ... |
| klient GitHub | ... | ... | ... |
| devtools | pakiet / biblioteka R | ... |  pakiet służący kompilacji i instalacji biblioteki |
| httr2 | pakiet / biblioteka R | ... |  --- |
| rvest | pakiet / biblioteka R | ... |  --- |
| roxygen2 | pakiet / biblioteka R | ... |  --- |
| xts | pakiet / biblioteka R | ... |  --- |
| zoo | pakiet / biblioteka R | ... |  --- |
| quantmod | pakiet / biblioteka R | ... |  --- |
| ... | ... | ... | ... |


## 4. Testy

Każdy test musi zostać poprzedzony wywołaniami funkcji `sessionInfo()`.Wszystkie wykonywane testy (z wyjątkiem tych "wyklikanych") powinny zostać zapisane w formie notatników `Rmd` ORAZ następnie wygenerowanych (knitterem) z nich plików `html` (wraz z wyjściem komend) do katalogu `tests` w repozytorium.
Format nazewnictwa powinien być zgodny ze strukturą:

**[Identyfikator].[Wersja].[RRRR-MM-DD].**


Następnie rezultat testu należy wpisać do tabeli poniżej, podpisując się inicjałami.

| Identyfikator | Nazwa | Scenariusz | Wynik | Wersja biblioteki | Data | Uwagi | Tester |
| --- | --- | --- | --- | --- | --- | --- | --- |
| TF.DD.1 | Test wyświetlania i działania danych wbudowanych | Zbiory testowe zostają zapisane do luźnych zmiennych oraz zostają explicite utworzone odpowiednie struktury danych zawierające zbiory testowe. Tester sprawdza, czy wywołanie zmiennych w środowisku powoduje ich wyświetlenie. Potem dokonuje inspekcji rozmiarów danych, aby potwierdzić, czy jest zgodna z opisem w pliku pomocy. Następnie weryfikuje zgodność operacji uśredniania kolumn liczbowych w zmiennych luźno typowanych oraz silnie typowanych. | ... | ... | --- | --- | --- |
| TF.DH.1 | ... | ... | ... | ... | --- | --- | --- |
| TFDD.1 | ... | ... | ... | ... | --- | --- | --- |
| TFDD.1 | ... | ... | ... | ... | --- | --- | --- |
| TFDD.1 | ... | ... | ... | ... | --- | --- | --- |
| TFDD.1 | ... | ... | ... | ... | --- | --- | --- |
| TFDD.1 | ... | ... | ... | ... | --- | --- | --- |
| TFDD.1 | ... | ... | ... | ... | --- | --- | --- |
| TFDD.1 | ... | ... | ... | ... | --- | --- | --- |
| TFDD.1 | ... | ... | ... | ... | --- | --- | --- |
| TFDD.1 | ... | ... | ... | ... | --- | --- | --- |
</details>
