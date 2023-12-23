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

# Dokumentacja oprogramowania

Dokumentacja biblioteki R Current Sectors przygotowana pod kątem zajęć z Inżynierii oprogramowania na NMSU ADBD na WZ UG.

## 1. Charakterystyka oprogramowania
### Nazwa skrócona:  
(nie dotyczy)
### Nazwa pełna: 
CurrentSectors
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
- określeń funkcjonalności (core data; database; sector structures; sector time series; sector technical analysis). 

### Wymagania funkcjonalne

Opis wymagań jest adekwatny dla użytkowników, którzy zainstalowali oraz załadowali bibliotekę CurrentSectors do własnego środowiska R, po czym wywołują w konsoli odpowiednie polecenia i funkcje opisane w plikach pomocy.

#### **Grupa nr 1 (core data):** wyświetlanie i/lub zapis do zmiennej list zbiorczych

| Id | Nazwa | Opis | Priorytet | Typ |
| --- | --- | --- | :---: | :---: |
| F.CD.1 | Wyświetlenie/przyłączenie do środowiska R danych dołączonych | Wywołanie danych dołączonych wraz z biblioteką po nazwie podzbioru powoduje ich wyświetlenie oraz umożliwia jawne włączenie do środowiska lokalnego. | 1 | F |
| F.CD.2 | Wyświetlanie plików pomocy | Zapytanie za pośrednictwem funkcji `help(object)` o zbiór danych lub funkcję biblioteki powoduje wyświetlenie treści odpowiedniego pliku pomocy. | 1 | F |
| F.CD.3 | Tworzenie tabel zawężonych list spółek - funkcja `listCompanies(country, sector, industry,...)` | Funkcja z obligatoryjnymi parametrami tekstowymi nazwy kraju (`country`) i nazwy sektora (`sector`) lub nazwy przemysłu (`industry`)  zwraca w formacie tabeli (struktury `data.frame`) listę spółek w tak określonym przekroju wraz ze szczegółami: **nazwami, symbolami, ich przemysłami, sektorami, krajami rejestracji** oraz **walutami kwotowania**. | 1 | F |
| F.CD.3.1 | Tworzenie tabel bardziej zawężonych list spółek - funkcja `listCompanies(country, sector, industry, market_cap_thresh)` | Ta sama funkcyja, co w **F.CD.3** z dodatkowym, opcjonalnym parametrem liczbowym progowego **poziomu kapitalizacji rynkowej** (`market_cap_thresh`) ten sam rezultat zawęża do spółek przekraczających określony poziom kapitalizacji rynkowej w Euro.  | 1 | F |
| F.CD.4 | Drukowanie zagnieżdżonej listy sektorów i przemysłów wraz z przykładami spółek - funkcja `printSectorStructure()` | Funkcja nieprzyjmująca parametrów zwraca wydruk zagnieżdżonej listy przemysłow i sektorów dostępnych w bazie wraz z przykładami firm i ich tickerów dla każdego z jej elementów. Lista wypisywana jest przez kilka sekund symulując wydruk. | 1 | F |

#### **Grupa nr 2 (database):** zapis i aktualizacja szeregów czasowych

| Id | Nazwa | Opis | Priorytet | Typ |
| --- | --- | --- | :---: | :---: |
| F.DB.1 | Zapis danych dołączonych biblioteki na dysku użytkownika - funkcja `saveData(path)` | Funkcja z obligatoryjnym parametrem ścieżki dyskowej w formacie tekstowym  zapisuje w tej lokalizacji dane dołączone biblioteki w plikach `.csv`. Umożliwia to ich późniejszą aktualizację. | 1 | F |
| F.DB.2 | Aktualizowanie baz szeregów czasowych użytkownika - funkcja `updateData(path)` | Funkcja z obligatoryjnym parametrem ścieżki dyskowej (jak w F.DB.1) aktualizuje szeregi czasowe notowań uprzednio zapisanych przez użytkownika funkcją `saveData(path)`.  | 1 | F |


#### **Grupa nr 3 (sector structure):** analiza struktury sektorowej walorów w danym państwie

| Id | Nazwa | Opis | Priorytet | Typ |
| --- | --- | --- | :---: | :---: |
| F.SS.1 | Tworzenie tabeli struktury sektorowej - funkcja `sStructure(country, path)` | Funkcja z obligatoryjnym parametrem nazwy państwa (`country`) oraz opcjonalnym parametrem `path` zwraca w formacie tabeli aktualny zbiór wartości łącznych kapitalizacji (`Market cap total`) w Euro oraz udziałów w kapitalizacji łącznej w państwie (`Total market cap share`) wszystkich spółek skategoryzowanych w tych sektorach i przemysłach. Funkcja przelicza odpowiednie wartości do Euro, jeżeli to konieczne. Domyślnie funkcja wykorzystuje dane dołączone a przy ustaleniu wartości parametru `path` ich  wersje zapisane na dysku użytkownika (F.DB.1) | 1 | F |
| F.SS.2 | Tworzenie wykresu struktury sektorowej - funkcja `sStructureChart(country, path)` | Funkcja z opcjonalnymi parametrami nazwy państwa (`country`) oraz `path` zwraca wykres powierzchniowy udziałów poszczególnych sektorów w kapitalizacji łącznej spółek. Funkcja wykorzystuje przeliczenie odpowiednich wartości do Euro, gdy to konieczne. Domyślnie struktura prezentowana jest dla całego zbioru spółek a uzupełnienie parametru nazwy państwa zawęża rezultat geograficznie. Wykres zawiera informatywny tytuł. Domyślnie funkcja wykorzystuje dane dołączone a przy ustaleniu wartości parametru `path` ich wersje zapisane na dysku użytkownika (F.DB.1) | 1 | F |


#### **Grupa nr 4 (sector time series):** analiza szeregów czasowych sektorów

| Id | Nazwa | Opis | Priorytet | Typ |
| --- | --- | --- | :---: | :---: |
| F.STS.1 | Tworzenie tabeli kapitalizacji spółek w sektorach w państwie w czasie - funkcja `sIndices(country, path)` | Funkcja z opcjonalnymi parametrami nazwy państwa (`country`) oraz `path` zwraca w formie tabeli (struktury `data.frame`) wartości łączne kapitalizacji spółek we wszystkich sektorach (kolumny), dla poszczególnych miesięcy z notowaniami dostępnymi w bazie szeregów czasowych (wiersze). Wartości przeliczone są do waluty Euro, na podstawie notowań poszczególnych spółek w zbiorze danych oraz notowań FX. Domyślnie prezentowane są wyliczenia dla całego zbioru spółek a uzupełnienie parametru wybranego państwa zawęża reultat geograficznie. Domyślnie funkcja wykorzystuje dane dołączone a przy ustaleniu wartości parametru `path` ich  wersje zapisane na dysku użytkowanika (F.DB.1) | 1 | F |
| F.STS.2 | Tworzenie wykresu wartości kapitalizacji spółek w sektorach w państwie w czasie - funkcja `sIndicesChart(country, path)` | Funkcja z opcjonalnymi parametrami nazwy państwa (`country`) oraz `path` zwraca w formie wykresu zbiorczego szeregów czasowych (po jeden szereg na sektor) wartości kapitalizacji łącznej w Euro wszystkich spółek dla każdego z sektorów w poszczególnych miesiącach, dla których dostępne są notowania w bazie. Wartości przeliczone są do waluty Euro na podstawie notowań poszczególnych spółek w zbiorze danych oraz notowań FX. Domyślnie prezentowane są wyliczenia dla całego zbioru spółek a uzupełnienie parametru wybranego państwa zawęża reultat geograficznie. Wykres zawiera informatywny tytuł oraz legendę. Domyślnie funkcja wykorzystuje dane dołączone a w przypadku ustaleniu wartości parametru `path` ich wersje zapisane na dysku użytkownika (F.DB.1) | 1 | F |
| F.STS.3 | Tworzenie wykresu porównawczego relatywnych wyników ekonomicznych sektorów w czasie - funkcja `sIndicesTRCompChart(country1, country2, sector1, sector2, path)` | Funkcja z obligatoryjnymi argumentami nazw dwóch państw (`country1`, `country2`), nazw dwóch sektorów (`sector1`, `sector2`) oraz opcjonalnym parametrem `path` zwraca w fromie wykresu dwóch szeregów czasowych wartości indeksów jednopodstawowych kapitalizacji łącznej spółek w tych państwach oraz sektorach w poszczególnych miesiącach, dla których dostępne są notowania w bazie. Wartość w pierwszym okresie = 100. Funkcja nie dokonuje konwersji walutowej kwotowań. Umożliwia również porównania w tym samym państwie lub tym samym sektorze. Wykres zawiera informatywny tytuł oraz legendę. Domyślnie funkcja wykorzystuje dane dołączone a w przypadku ustalenia wartości parametru `path` ich aktualizowane wersje zapisane na dysku użytkowanika (F.DB.1) | 1 | F |

#### **Grupa nr 5 (sector technical analysis):** - raport analizy technicznej grupy spółek sektora w państwie

| Id | Nazwa | Opis | Priorytet | Typ |
| --- | --- | --- | :---: | :---: |
| F.STA.1 | Tworzenie tabeli raportu analizy technicznej przekroju sektorowo-geograficznego spółek - funkcja `TAReport(country, sector, path)` | Funkcja z obligatoryjnymi parametrami nazwy państwa (`country`) oraz nazwy sektora (`sector`) i opcjonalnym parametrem `path` zwraca w formie tabeli (struktury `data.frame`) raport analizy technicznej wszystkich spółek wybranego przekroju sektorowo-geograficznego. Wiersze tabeli odpowiadają kolejnym spółkom. Kolumny tabeli, to `Name` - nazwa spółki, `Ticker` - użyty symbol giełdowy, `Industry` - kategoria przemysłu spółki, `MA` - kategoria trendu notowań (`bullish` lub `bearish`) ustalona na podstawie relacji aktualnej ceny do wartości 11-okresowej średniej ruchomej, `RSI` - kategoria oscylatora Relative Strength Index (`overbought`, `no signal` lub `oversold`) ustalona na podstawie 14-okresowej wartości wskaźnika RSI w jednym z przedziałów (<70-100>, [30-70], <0, 30>). Domyślnie funkcja wykorzystuje dane dołączone a w przypadku ustaleniu wartości parametru `path` ich wersje zapisane na dysku użytkownika (F.DB.1) | 1 | F |

### Wymagania pozfunkcjonalne

Klasyfikacji wymagań pozafunkcjonalnych dotyczących jakości dokonano inspirując się standardem **ISO/IEC 25010:2011**. Uwzględniono tylko subiektywnie najważniejsze kryteria.

| Id | Nazwa | Opis | Priorytet | Typ |
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
| działające łącze internetowe | infrastruktura | działające połączenie SSH oraz protokół HTTP |  istotne tylko przy pierwszej instalacji oraz aktualizacjach danych |
| Windows / Linux / MacOS  | system operacyjny | alternatywy umożliwiające działanie języka R | Windows 10 + / Linux kernel 2.4.6+ / MacOS Catalina +, bardzo prawdopodobne działanie również na starszych wersjach systemów, sytemach Windows Server oraz OpenBSD |
| interpreter R  | interpreter | środowisko języka R |  w wersji 4.2.x lub wyższej |
| devtools / remotes | pakiet / biblioteka R | pakiety do kompilacji bibliotek spoza CRAN |  alternatywne pakiety służące instalacji biblioteki |
| (ggplot2) | pakiety/biblioteki R | pakiet służący tworzeniu wykresów zgodnie z regułami Grammar of Graphics | w wersji (x.y.z) | 
| quantmod | pakiet / biblioteka R | pakiet zawierający klasy i funkcje służące modelowaniu finansowemu oraz komunikacji z Yahoo Finance API |  w wersji 0.4.24 lub wyższej, **nie wymaga samodzielnej instalacji przez użytkownika** - jest instalowany automatycznie przez bibliotekę CurrentSectors | 
| xts | pakiet / biblioteka R | pakiet zawierający klasy i funkcje do przetwarzania szeregów czasowych |  w wersji 0.13.1 lub wyższej, **nie wymaga samodzielnej instalacji przez użytkownika** - jest instalowany automatycznie przez bibliotekę CurrentSectors |
| zależności implicite | pakiety/biblioteki R | pakiety będące zagnieżdżonymi zależnościami xts, quantmod (i ggplot2) | **szereg automatycznie instalowanych pakietów**, m.in. zoo | 



### Stos technologiczny: 

| Nazwa | Typ |  Opis | Uwagi |
| --- | --- | --- |  --- |
| działające łącze internetowe | infrastruktura | działające połączenie SSH oraz protokół HTTP |  istotne w całym cyklu rozwoju oprogramowania |
| Windows / Linux / MacOS | system operacyjny | alternatywy umożliwiające działanie języka R | Windows 10 + / Linux kernel 2.4.6+ / MacOS Catalina +, bardzo prawdopodobne działanie również na starszych wersjach systemów, sytemach Windows Server oraz OpenBSD |
| interpreter R w wersji 4.2.x lub wyższej | interpreter | środowisko języka R |  w wersji 4.2.x lub wyższej |
| środowisko R Studio | zintegrowane środowisko wytwórcze | środowisko wspierające procesy kodowania, testowania, budowania oraz wersjonowania biblioteki | w wersji 2023.03.0 lub wyższej |
| klient Git | oprogramowanie | program obsługujący system kotroli wersji oraz operacje na lokalnym i zdalnym repozytorium | możliwy do wykorzystania jest klient git wbudowany w RStudio bądź dedykowana aplikacja, sugeruje się klient Github Desktop |
| devtools | pakiet / biblioteka R | pakiet służący kompilacji, instalacji oraz automatyzacji czynności przy budowaniu biblioteki | wersja 2.4.5 lub wyższa  |
| (ggplot2) | pakiety/biblioteki R | pakiet służący tworzeniu wykresów zgodnie z regułami Grammar of Graphics | w wersji (x.y.z) | 
| knitr | pakiety/biblioteki R | pakiet służący generowaniu plików html z notatników R Markdown | w wersji 1.4.5 lub wyższej | 
| quantmod | pakiet / biblioteka R | pakiet zawierający klasy i funkcje służące modelowaniu finansowemu oraz komunikacji z Yahoo Finance API |   w wersji 0.4.24 lub wyższej |
| roxygen2 | pakiet / biblioteka R | pakiet służący automatycznemu generowaniu plików pomocy z kodu wzbogaconego odpowiednimi dekoratorami |  wersja 7.2.3 lub wyższa |
| rvest | pakiet / biblioteka R | pakiet służący do web-scrapingu i parsowania ściągniętych stron internetowych |  wersja 1.0.3 lub wyższa |
| xts | pakiet / biblioteka R | pakiet zawierający klasy i funkcje do przetwarzania szeregów czasowych | w wersji 0.13.1 lub wyższej |
| zależności implicite | pakiety/biblioteki R | pakiety będące zagnieżdżonymi zależnościami | **szereg automatycznie instalowanych pakietów**, m.in. zoo | 


## 4. Testy

Każdy test musi zostać poprzedzony restartem środowiska R, instalacją CurrentSectors z repozytorium zdalnego oraz załadowaniem biblioteki. Test musi rozpoczynać się wywołaniami funkcji `sessionInfo()`. Wszystkie wykonywane testy (z wyjątkiem tych "wyklikanych") powinny zostać zapisane w formie notatników `Rmd` ORAZ następnie wygenerowanych (`knitter`em) z nich plików `html` (wraz z zapisanym wyjściem komend) do katalogu `tests` w repozytorium.
Format nazewnictwa powinien być zgodny ze strukturą:

**[Identyfikator].[WersjaBiblioteki].[RRRR-MM-DD].[RozszerzeniePliku]**

(wersja biblioteki sprawdzana jest w pliku DESCRIPTION w katalogu głównym)

Następnie rezultat testu należy wpisać do tabeli poniżej, podpisując się inicjałami. Testy tej samej funkcji powinny znajdować się w jednym rzędzie, chronologicznie.

| Identyfikator | Nazwa | Scenariusz | Wynik | Wersja biblioteki | Data | Uwagi | Tester |
| --- | --- | --- | --- | --- | --- | --- | --- |
| TF.CD.1 | Test działania danych wbudowanych | Zbiory testowe zostają wywołane po nazwach, po czym zostają przypisane do zmiennych w środowisku lokalnym. Tester sprawdza, czy wywołanie zmiennych w środowisku powoduje ich wyświetlenie. Potem dokonuje inspekcji rozmiarów danych, aby potwierdzić, czy jest zgodna z opisem w pliku pomocy.  | ... | ... | --- | --- | --- |
| TF.CD.2 | Test działania plików pomocy | Pliki pomocy zostają wywołane dla samej biblioteki (`?CurrentSectors`), wszystkich funkcji oraz zbiorów danych z użyciem operatora `?` oraz funkcji `help()`. Tester sprawdza, czy pliki wyświetlają się w zakładce `Help` RStudio oraz czy ich treść nie jest sprzeczna z wymaganiami funkcjonalnymi. Dla funkcji weryfikuje działanie elementu `Run_examples`. | ... | ... | --- | --- | --- |
| TF.CD.3 | Test tworzenia tabel list spółek | ... | ... | ... | --- | --- | --- |
| TF.CD.4 | Test drukowania zagnieżdżonej listy sektorów i przemysłów z przykładami spółek | ... | ... | ... | --- | --- | --- |
| TF.DB.1 | Test zapisu danych dołączonych na dysk | ... | ... | ... | --- | --- | --- |
| TF.DB.1 | Test aktualizacji bazy plików na dysku użytkownika | ... | ... | ... | --- | --- | --- |
| TF.SS.1 | Test tworzenia tabel struktury sektorowej | ... | ... | ... | --- | --- | --- |
| F.SS.2 | Test tworzenia wykresów struktury sektorowej | ... | ... | ... | --- | --- | --- |
| TF.STS.1 | Test tworzenia tabel wartości kapitalizacji w sektorach | ... | ... | ... | --- | --- | --- |
| TF.STS.2 | Test tworzenia wykresów wartości kapitalizacji w sektorach | ... | ... | ... | --- | --- | --- |
| TF.STS.2 | Test tworzenia wykresów porównawczych relatywnych wyników ekonomicznych | ... | ... | ... | --- | --- | --- |
| TF.STA.1 | Test tworzenia tabel raportów analizy technicznej przekrojów sektorowo-geograficznych | ... | ... | ... | --- | --- | --- |
</details>
