# Current Sectors R library:
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
### Dane dołączone (wbudowane)

#### Źródło danych
Dane dotyczące danych finansowych oraz klasyfikacji sektorowej i branżowej spółek pochodzą z portalu Yahoo Finance. Uzyskano je w dokumentowanym skrótowo (w prezentacji prototypu) procesie web-scrapingu w trakcie trwania projektu. Wykorzystywano zarówno model oparty o specjalistyczne API, jak też zapis i parsowanie stron internetowych.

Źródłem użytych nazw spółek są alternatywnie: 
- ponadnarodowa giełda Euronext (dla akcji europejskich z wyłączeniem niektórych niemieckich), 
- Dom Maklerski Alior Banku (dla akcji amerykańskich i większości niemieckich) 
- portal Yahoo Finance (dla około 20 pozaniemieckich walorów europejskich).

Źródłem klasyfikacji geograficznej spółek są znaki początkowe globalnie unikatowego dla każdej serii akcji spółki kodu ISIN (International Securities Identification Number) nadawanego przy uruchamianiu pierwszej oferty publicznej (ang. IPO - Initial Public Offer). Pierwsze dwa z dwunastu znaków tego kodu alfanumerycznego określają zapisaną skrótowo (wg standardu ISO 3106)
nazwę państwa. Źródłem danych o numerach ISIN wszystkich walorów w zbiorach danych są alternatywnie Euronext oraz DM Alior Banku. W zakresie geograficznym znajdują się firmy z USA, Niemiec, Francji, Hiszpanii, Włoch, Portugalii, Holandii oraz Belgii.

#### Klasyfikacja sektorowo-branżowa

Wszystkie występujące w zbiorach danych spółki sklasyfikowane są według zagnieżdżonego modelu `sector-industry` użytego przez Yahoo Finance. Poczynając od wersji 0.3.0 biblioteki przestajemy tę kategoryzację tłumaczyć na język polski jako "sektorowo-przemysłową" i przechodzimy do określenia "sektorowo-branżowa". Nie posiadamy **definicji** elementów tego modelu ponad to, że sektory (`sectors`) są nadrzędne do branż (`industries`). Model jest hierarchiczny, jak szeroko używana w statystyce publicznej klasyfikacja działalności gospodarczych **NACE**, ale poza tym jest kompletnie odmienny:
- nie jest usankcjonowany prawnie,
- nie udostępnia dokumentacji metodycznej,
- nie klasyfikuje rozłącznie typów wykonywanej pracy.

Model Yahoo Finance jest uproszczeniem systemów **GICS** (Global Industry Classification Standard) oraz **ICB** (Industry Classification Benchmark). Ma charakter produktowy. Występuje w nim 140 szczegółowych branż połączonych w 11 sektorów:
- Basic Materials (materiały podstawowe) - zarówno wydobycie różnych surowców, jak też produkcja materiałów budowlanych i półproduktów chemicznych; węgiel koksujący jest właśnie w tym sektorze; łącznie 13 branż,
- Communication Services (usługi komunikacyjne) - firmy związane z mediami tradycyjnymi, cyfrowymi, jak też telekomunikacyjne; łącznie 7 branż,
- Consumer Cyclical (cykliczne konsumenckie) - dostawcy prod. i usług, dla których popyt wysoce uzależniony jest od występujących cyklicznie nadwyżek dochodów konsumenckich: dóbr luksusowych, ubrań, sklepów internetowych, nieruchomości mieszkalnych, aut; łącznie 23 branże,
- Consumer Defensive (konsumenckie pierwszej potrzeby) - producenci i dystrybutorzy żywności, używek, jak też dostawcy usług edukacyjnych; łącznie 12 branż,
- Energy (surowce energetyczne) - firmy wydobywające, przetwarzającę oraz dystrybuujące ropę, gaz i węgiel; łącznie 7 branż,
- Financial Services (usługi finansowe) - spółki działające na rynku kapitałowym, ubezpieczeniowym i usług finansowych; łącznie 14 branż,
- Healthcare (ochrona zdrowia) - spółki dostarczające produkty i usługi medyczne lub farmaceutyczne; łącznie 11 branż,
- Industrials (przemysł ciężki) - firmy produkujące maszyny, urządzenia, infrastrukturę oraz świadczące związane z tym usługi; łącznie 25 branż,
- Real Estate (nieruchomości) - deweloperzy nieruchomości niemieszkalnych,  specjalistycznych, dostawcy usług towarzyszących oraz specjalistyczne fundusze powiernicze; łącznie 10 branż,
- Technology (technologie) - producenci i dystrybutorzy sprzętu elektronicznego, dostawcy oprogramowania i usług informatycznych, jak też spółki związane z energetyką solarną; łącznie 12 branż;
- Utilities (usługi komunalne) - producenci i dostawcy usług wodociągowych, gazowych i energetycznych; łącznie 6 branż.
 



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
| F.CD.1.2 | Zakres i jakość danych dołączonych | W zbiorach danych nie brakuje więcej niż 10 najważniejszych spółek notowanych na giełdzie i właściwych zakresowi geograficznemu (FR, US, IT, BE, PT, DE, ES, NL) W zbiorach danych wszystkie spółki są skategoryzowane klasyfikacją Yahoo Finance i nie ma spółek bez szeregów czasowych notowań. | 1 | F |
| F.CD.2 | Wyświetlanie plików pomocy | Zapytanie za pośrednictwem funkcji `help(object)` o zbiór danych lub funkcję biblioteki powoduje wyświetlenie treści odpowiedniego pliku pomocy. | 1 | F |
| F.CD.3 | Tworzenie tabel zawężonych list spółek - funkcja `listCompanies(country, sector, industry,...)` | Funkcja z obligatoryjnymi parametrami tekstowymi nazwy kraju (`country`) i nazwy sektora (`sector`) lub nazwy branży (`industry`)  zwraca w formacie tabeli (struktury `data.frame`) listę spółek w tak określonym przekroju wraz ze szczegółami: **nazwami, symbolami, ich sektorami, branżami, krajami rejestracji** oraz **walutami kwotowania**. | 1 | F |
| F.CD.3.1 | Tworzenie tabel bardziej zawężonych list spółek - funkcja `listCompanies(country, sector, industry, market_cap_thresh)` | Ta sama funkcyja, co w **F.CD.3** z dodatkowym, opcjonalnym parametrem liczbowym progowego **poziomu kapitalizacji rynkowej** (`market_cap_thresh`) ten sam rezultat zawęża do spółek przekraczających określony poziom kapitalizacji rynkowej w Euro.  | 1 | F |
| F.CD.4 | Drukowanie zagnieżdżonej listy sektorów i branż wraz z przykładami spółek - funkcja `printSectorStructure()` | Funkcja nieprzyjmująca parametrów zwraca wydruk zagnieżdżonej listy sektorów i branż dostępnych w bazie wraz z przykładami firm i ich tickerów dla każdego z jej elementów. Lista wypisywana jest przez kilka sekund symulując wydruk. | 1 | F |

#### **Grupa nr 2 (database):** zapis i aktualizacja szeregów czasowych

| Id | Nazwa | Opis | Priorytet | Typ |
| --- | --- | --- | :---: | :---: |
| F.DB.1 | Zapis danych dołączonych biblioteki na dysku użytkownika - funkcja `saveData(path)` | Funkcja z obligatoryjnym parametrem ścieżki dyskowej w formacie tekstowym  zapisuje w tej lokalizacji dane dołączone biblioteki w plikach `.Rda`. Umożliwia to ich późniejszą aktualizację. | 1 | F |
| F.DB.2 | Aktualizowanie baz szeregów czasowych użytkownika - funkcja `updateData(path)` | Funkcja z obligatoryjnym parametrem ścieżki dyskowej (jak w F.DB.1) aktualizuje szeregi czasowe notowań uprzednio zapisanych przez użytkownika funkcją `saveData(path)`.  | 1 | F |


#### **Grupa nr 3 (sector structure):** analiza struktury sektorowej walorów w danym państwie

| Id | Nazwa | Opis | Priorytet | Typ |
| --- | --- | --- | :---: | :---: |
| F.SS.1 | Tworzenie tabeli struktury sektorowej - funkcja `sStructure(country, path)` | Funkcja z obligatoryjnym parametrem nazwy państwa (`country`) oraz opcjonalnym parametrem `path` zwraca w formie jednokolumnowej tabeli z nagłówkiem (`data.frame`) aktualne udziały łączne spółek poszczególnych sektorów w kapitalizacji łącznej spółek w państwie, w procentach. Domyślnie funkcja wykorzystuje dane dołączone a przy ustaleniu wartości parametru `path` ich wersje zapisane na dysku użytkownika (F.DB.1). Wydruk tabeli poprzedzony jest wydrukiem z informacją o kapitalizacji łącznej (w mld EUR) spółek z tego państwa w zbiorze danych. | 1 | F |
| F.SS.2 | Tworzenie wykresu struktury sektorowej - funkcja `sStructureChart(country, path)` | Funkcja z obligatoryjnym parametrem nazwy państwa (`country`) oraz opcjonalnym `path` zwraca wykres powierzchniowy (pie-chart) udziałów poszczególnych sektorów w kapitalizacji łącznej spółek w państwie. Wykres zawiera informatywny tytuł. Domyślnie funkcja wykorzystuje dane dołączone a przy ustaleniu wartości parametru `path` ich wersje zapisane na dysku użytkownika (F.DB.1) | 1 | F |


#### **Grupa nr 4 (sector time series):** analiza szeregów czasowych sektorów

| Id | Nazwa | Opis | Priorytet | Typ |
| --- | --- | --- | :---: | :---: |
| F.STS.1 | Tworzenie tabeli kapitalizacji spółek w sektorach w państwie w czasie - funkcja `sIndices(country, path)` | Funkcja z opcjonalnymi parametrami nazwy państwa (`country`) oraz `path` zwraca w formie obiektu xts wartości łączne kapitalizacji spółek we wszystkich sektorach (kolumny), dla poszczególnych miesięcy. W przypadku braków notowań uzupełnia je w tył, potem wprzód. Wartości przeliczone są do miliardów Euro na podstawie wartości końcowej kapitalizacji, notowań poszczególnych spółek w zbiorze danych oraz notowań FX. Domyślnie prezentowane są wyliczenia dla całego zbioru spółek a uzupełnienie parametru wybranego państwa zawęża reultat geograficznie. Domyślnie funkcja wykorzystuje dane dołączone a przy ustaleniu wartości parametru `path` ich  wersje zapisane na dysku użytkowanika (F.DB.1) | 1 | F |
| F.STS.2 | Tworzenie wykresu wartości kapitalizacji spółek w sektorach w państwie w czasie - funkcja `sIndicesChart(country, path)` | Funkcja z opcjonalnymi parametrami nazwy państwa (`country`) oraz `path` zwraca w formie wykresu zbiorczego szeregów czasowych (po jeden szereg na sektor) wartości kapitalizacji łącznej w miliardach Euro wszystkich spółek dla każdego z sektorów w poszczególnych miesiącach. W przypadku braków notowań uzupełnia je w tył, potem wprzód. Wartości przeliczone są do miliardów Euro na podstawie wartości końcowej kapitalizacji, notowań poszczególnych spółek w zbiorze danych oraz notowań FX. Domyślnie prezentowane są wyliczenia dla całego zbioru spółek a uzupełnienie parametru wybranego państwa zawęża reultat geograficznie. Wykres zawiera informatywny tytuł oraz legendę. Domyślnie funkcja wykorzystuje dane dołączone a w przypadku ustaleniu wartości parametru `path` ich wersje zapisane na dysku użytkownika (F.DB.1) | 1 | F |
| F.STS.3 | Tworzenie wykresu porównawczego relatywnych wyników ekonomicznych sektorów w czasie - funkcja `sIndicesTRCompChart(country1, country2, sector1, sector2, path)` | Funkcja z obligatoryjnymi argumentami nazw dwóch państw (`country1`, `country2`), nazw dwóch sektorów (`sector1`, `sector2`) oraz opcjonalnym parametrem `path` zwraca w formie wykresu dwóch szeregów czasowych wartości indeksów jednopodstawowych kapitalizacji łącznej spółek w tych państwach oraz sektorach w poszczególnych miesiącach, dla których dostępne są notowania w bazie. Wartość w pierwszym okresie = 100. Bazą wycen są notowania w walutach macierzystych. Umożliwia również porównania w tym samym państwie lub tym samym sektorze. Wykres zawiera informatywny tytuł oraz legendę. Domyślnie funkcja wykorzystuje dane dołączone a w przypadku ustalenia wartości parametru `path` ich aktualizowane wersje zapisane na dysku użytkowanika (F.DB.1) | 1 | F |

#### **Grupa nr 5 (sector technical analysis):** - raport analizy technicznej grupy spółek sektora w państwie

| Id | Nazwa | Opis | Priorytet | Typ |
| --- | --- | --- | :---: | :---: |
| F.STA.1 | Tworzenie tabeli raportu analizy technicznej przekroju sektorowo-geograficznego spółek - funkcja `TAReport(country, sector, path)` | Funkcja z obligatoryjnymi parametrami nazwy państwa (`country`) oraz nazwy sektora (`sector`) i opcjonalnym parametrem `path` zwraca w formie tabeli (struktury `data.frame`) raport analizy technicznej wszystkich spółek wybranego przekroju sektorowo-geograficznego. Wiersze tabeli odpowiadają kolejnym spółkom. Kolumny tabeli, to `Name` - nazwa spółki, `Ticker` - użyty symbol giełdowy, `Industry` - branża spółki, `MA` - kategoria trendu notowań (`bullish` lub `bearish`) ustalona na podstawie relacji aktualnej ceny do wartości 11-okresowej średniej ruchomej, `RSI` - kategoria oscylatora Relative Strength Index (`overbought`, `no signal` lub `oversold`) ustalona na podstawie 14-okresowej wartości wskaźnika RSI w jednym z przedziałów (<70-100>, [30-70], <0, 30>). Domyślnie funkcja wykorzystuje dane dołączone a w przypadku ustaleniu wartości parametru `path` ich wersje zapisane na dysku użytkownika (F.DB.1) | 1 | F |

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
| rtools | toolchain / pakiet kompilatorów i narzędzi | pakiety do budowania bibliotek R wprost za źródła | w wersji adekwatnej do posiadanej wersji R (np. 4.2 dla R 4.2.x) |
| devtools / remotes | pakiet / biblioteka R | pakiety do kompilacji bibliotek spoza CRAN |  alternatywne pakiety służące instalacji biblioteki, devtools: 2.4.5 wzwyż, remotes: 2.4.2 wzwyż |
| quantmod | pakiet / biblioteka R | pakiet zawierający klasy i funkcje służące modelowaniu finansowemu oraz komunikacji z Yahoo Finance API |  w wersji 0.4.24 lub wyższej, **nie wymaga samodzielnej instalacji przez użytkownika** - jest instalowany automatycznie przez bibliotekę CurrentSectors | 
| xts | pakiet / biblioteka R | pakiet zawierający klasy i funkcje do przetwarzania szeregów czasowych |  w wersji 0.13.1 lub wyższej, **nie wymaga samodzielnej instalacji przez użytkownika** - jest instalowany automatycznie przez bibliotekę CurrentSectors |
| zależności implicite | pakiety/biblioteki R | pakiety będące zagnieżdżonymi zależnościami xts i quantmod i innych bibliotek  | szereg **automatycznie** instalowanych pakietów w odpowiednich wersjach, m.in. zoo | 



### Stos technologiczny: 

| Nazwa | Typ |  Opis | Uwagi |
| --- | --- | --- |  --- |
| działające łącze internetowe | infrastruktura | działające połączenie SSH oraz protokół HTTP |  istotne w całym cyklu rozwoju oprogramowania |
| Windows / Linux / MacOS | system operacyjny | alternatywy umożliwiające działanie języka R | Windows 10 + / Linux kernel 2.4.6+ / MacOS Catalina +, bardzo prawdopodobne działanie również na starszych wersjach systemów, sytemach Windows Server oraz OpenBSD |
| interpreter R w wersji 4.2.x lub wyższej | interpreter | środowisko języka R |  w wersji 4.2.x lub wyższej |
| środowisko R Studio | zintegrowane środowisko wytwórcze | środowisko wspierające procesy kodowania, testowania, budowania oraz wersjonowania biblioteki | w wersji 2023.03.0 lub wyższej |
| klient Git | oprogramowanie | program obsługujący system kotroli wersji oraz operacje na lokalnym i zdalnym repozytorium | możliwy do wykorzystania jest klient git wbudowany w RStudio bądź dedykowana aplikacja, sugeruje się klient Github Desktop |
| rtools | toolchain / pakiet kompilatorów i narzędzi | pakiety do budowania bibliotek R wprost za źródła | w wersji adekwatnej do posiadanej wersji R (np. 4.2 dla R 4.2.x) |
| devtools | pakiet / biblioteka R | pakiet służący zarządzaniu kompilacją, instalacją oraz automatyzacji czynności przy budowaniu biblioteki | wersja 2.4.5 lub wyższa  |
| knitr | pakiety/biblioteki R | pakiet służący generowaniu plików html z notatników R Markdown | w wersji 1.4.5 lub wyższej | 
| quantmod | pakiet / biblioteka R | pakiet zawierający klasy i funkcje służące modelowaniu finansowemu oraz komunikacji z Yahoo Finance API |   w wersji 0.4.24 lub wyższej |
| roxygen2 | pakiet / biblioteka R | pakiet służący automatycznemu generowaniu plików pomocy z kodu wzbogaconego odpowiednimi dekoratorami |  wersja 7.2.3 lub wyższa |
| rvest | pakiet / biblioteka R | pakiet służący do web-scrapingu i parsowania ściągniętych stron internetowych |  wersja 1.0.3 lub wyższa |
| xts | pakiet / biblioteka R | pakiet zawierający klasy i funkcje do przetwarzania szeregów czasowych | w wersji 0.13.1 lub wyższej |
| zależności implicite | pakiety/biblioteki R | pakiety będące zagnieżdżonymi zależnościami | szereg **automatycznie** instalowanych pakietów, m.in. zoo | 


## 4. Testy

Pełne szczegóły scenariuszy testowych dostępne są w katalogu `/tests`, którego pliki `.Rmd` umożliwiają przeprowadzanie tzw. testów regresji.

Tester jest odpowiedzialny za poprawną konfigurację swojego środowiska testowego (uruchomieniowego) tak, aby biblioteka kompilowała się w nim oraz by był możliwy eksport plików `Rmd` do `html` za pośrednictwem `knittera`. Testy nieudane z powodu uchybień testera w konfiguracji własnego środowiska **nie mogą być wgrywane do repozytorium** ani dokumentowane w tabeli.

Każdy test musi być wykonywany w środowisku uruchomieniowym spełniającym odpowiednie kryteria, wprost z IDE RStudio, 
w nowo zapoczątkowanym projekcie - tak jakby tester próbował używać bibliotekę do celów analitycznych.
Każdy test musi być wykonywany w notatniku R Markdown a scenariusz musi zostać poprzedzony:
1. Restartem środowiska R [ctrl + Shift + F10].
2. Wywołaniem funkcji wbudowanej `sessionInfo()`.
3. Załadowaniem pakietu `devtools` (w wersji 2.4.5. wzwyż).
4. Instalacją najnowszej wersji biblioteki CurrentSectors z repozytorium zdalnego (`install_github("RKLisiecki/CurrentSectors", force = TRUE)`).
5. Załadowaniem biblioteki (`library(CurrentSectors)`).
6. Ponownym wywołaniem `sessionInfo()`.

Dalej tester wykonuje scenariusz testowy, po wykonaniu którego powinien:
1. Odłączyć bibliotekę (`detach(package:CurrentSectors)`).
2. Odinstalować bibliotekę (`remove.packages("CurrentSectors")`) - **to powinno być ostatnie polecenie w pliku testu**.
3. Wyeksportować notatnik `Rmd` do pliku `html` (poleceniem `knit`; plik ulegnie zapisaniu, cały kod wykonana się ponownie a wyjścia komend zostaną zapisane).
4. Przenieść **kopie** plików `Rmd` oraz `html` do dowolnego odrębnego katalogu na swoim dysku.
5. Zmienić nazwy plików według schematu:
**[Identyfikator].[WersjaBiblioteki].[RRRR-MM-DD].[RozszerzeniePliku]**
(zachowując poprzednie rozszerzenia plików oraz zgodność Identyfikatorów z tymi w tabeli testów u dołu tego dokumentu).
6. Umieścić plik `Rmd` w katalogu `tests` tego repozytorium, w gałęzi `master` a plik `html` zachować na potrzeby własnych analiz.
7. Uzupełnić wpis wykonywanego scenariusza w tabeli testów (testy z tym samym Id w jednym rzędzie, chronologicznie, podpis inicjałami).

| Identyfikator | Nazwa | Scenariusz | Wynik | Wersja biblioteki | Data | Uwagi | Tester |
| --- | --- | --- | --- | --- | --- | --- | --- |
| TF.CD.1 | Test działania danych wbudowanych | Zbiory testowe zostają wywołane po nazwach, po czym zostają przypisane do zmiennych w środowisku lokalnym. Tester sprawdza, czy wywołanie zmiennych w środowisku powoduje ich wyświetlenie. Potem dokonuje inspekcji rozmiarów danych, aby potwierdzić, czy jest zgodna z opisem w pliku pomocy.  | Pozytywny | 0.3.0 | 2023-12-27 | --- | MB |
| TF.CD.2 | Test działania plików pomocy | Pliki pomocy zostają wywołane dla samej biblioteki (`?CurrentSectors`), wszystkich funkcji oraz zbiorów danych z użyciem operatora `?` oraz funkcji `help()`. Tester sprawdza, czy pliki wyświetlają się w zakładce `Help` RStudio oraz czy ich treść nie jest sprzeczna z wymaganiami funkcjonalnymi. Dla funkcji weryfikuje działanie elementu `Run_examples`. | Pozytywny | 0.3.0 | 2023-27-12 | --- | MB |
| TF.CD.3 | Test tworzenia tabel list spółek | Za pomocą funkcji listCompanies(), tester wywołuję dane w formacie tabeli 'data.frame'. Należy sprawdzić czy dane są zgodne z opisem zawartym w wymaganiach funkcjonalnych. Osoba testująca wykonuje kilka scenariuszy. Test case 1: Poprawne zapytanie dla kraju i sektora. Wejście: country: `listCompanies("USA", "Technology")` Oczekiwane wyjście: Zwrócenie tabeli (struktury data.frame) z informacjami o spółkach technologicznych zarejestrowanych w USA. Test case 2: Poprawne zapytanie dla kraju i branży. Wejście: `listCompanies("Belgium", industry = "Building Materials")` Oczekiwane wyjście: Zwrócenie tabeli (struktury data.frame) z informacjami o spółkach z branży materiałów budowlanych zarejestrowanych w Belgii. Test case 3: Brak spółek dla określonych kryteriów. Wejście:   `listCompanies("Canada", "Healthcare")` Oczekiwane wyjście: Zwrócenie informacji "Nothing here.". Test case 4: Nieprawidłowe wejście (brak obowiązkowego parametru). Wejście: `listCompanies("USA")` Oczekiwane wyjście: Zwrócenie żądania o podanie jednego z niezbędnych parametrów. "Please provide sector OR industry parameter." Test case 5: Prawidłowe zapytanie z dodatkowym parametrem liczbowym. Wejście: `listCompanies("Spain", "Technology", market_cap_thresh = 1000000000)` Oczekiwane wyjście: Zwrócenie tabeli (struktury data.frame) z informacjami o spółkach technologicznych zarejestrowanych w Hiszpanii, przekraczających miliard Euro kapitalizacji rynkowej. Test case 6: Brak spółek dla określonych kryteriów liczbowych. Wejście: `listCompanies("USA",  industry = "Aerospace & Defense", market_cap_thresh = 100000000000000)` Oczekiwane wyjście: Zwrócenie informacji "Nothing here.". | Pozytywny | 0.3.0 | 2023-12-27 | --- | MB |
| TF.CD.4 | Test drukowania zagnieżdżonej listy sektorów i branż z przykładami spółek | Testujący wywołuję funkcję `printSectorStructure()`, a następnie ocenia czy zawartosc wydruku jest zgodna z informacjami zawartymi w wymaganich funkcjonalnych. | Pozytywny | 0.3.0 | 2023-12-27 | --- | MB |
| TF.DB.1 | Test zapisu danych dołączonych na dysk | Po wywołaniu funkcji `saveData(path)`, tester sprawdza czy we wskazanym miejscu na dysku powstają pliki z rozszerzeniem `.rda`. Testujący sprawdza czy zapisane dane są zgodne pod względem ilościowym i jakościowym z wymaganiami funkcjonalnymi biblioteki. | Pozytywny | 0.4.0 | 2023-12-30 | --- | MB | 
| TF.DB.2 | Test aktualizacji bazy plików na dysku użytkownika | Tester sprawdza adekwatność plików pomocy. Zapisuje dane w katalogu bieżącym z użyciem f-cji `saveData()`. Skraca zapisane pliki danych do 200 spółek oraz o 5 ostatnich obserwacji. Zapisuje pliki (aby update trwał krócej). Sprawdza stan danych, zapisuje pierwsze wartości kapitalizacji. Wywołuje f-cję z niepoprawnymi parametrami ścieżki dyskowej (NA, NULL, "C#V#TR!"). Oczekiwany prompt "User data update unsuccesful.". Następnie wywołuje funkcję ze ścieżką katalogu bieżącego, w którym znajdują się zapisane pliki. Oczekiwany rezultat: prompty informacyjne oraz efekt aktualizacji w zapisanych plikach. Rezultaty zostają zweryfikowane poprzez inspekcję zapisanych plików. Następnie wywołuje funkcję (poprawnie), ale dla plików nie wymagających aktualizacji. Oczekiwany rezultat - brak aktualizacji oraz informatywny prompt: "Data can't be updated yet". | Pozytywny | 0.6.0 | 2023-12-31 | Update 200 spółek - około 30-60 sekund; całego zbioru - poniżej 10 minut | RKL |
| TF.SS.1 | Test tworzenia tabel struktury sektorowej | Tester sprawdza adekwatność plików pomocy. Następnie wywołuje kilkukrotnie f-cję z niepoprawnymi parametrami (`NA`, "Bezludna wyspa" itp.). Oczekuje zwrócenia wiadomości "Calculation was unsuccesful". Następnie wywołuje funkcję z poprawnymi parametrami dla wszystkich państw w zbiorze danych, na danych dołączonych i weryfikuje poprawność obliczeń. Dalej wywołuje f-cję na danych zapisanych o identycznej zawartości oraz weryfikuje, że zwracane wartości są jednakowe. | Pozytywny | 0.9.0 | 2024-01-01 | Wszelkie rozbieżnośći z powszechnie wiadomymi faktami wynikają z ograniczenia zakresu spółek. | RKL |
| TF.SS.2 | Test tworzenia wykresów struktury sektorowej | Tester sprawdza adekwatność plików pomocy. Następnie wywołuje kilkukrotnie f-cję z niepoprawnymi parametrami (`NA`, "Bezludna wyspa" itp.). Oczekuje zwrócenia wiadomości "Calculation was unsuccesful" oraz "Plot creation was unsuccesful". Następnie dla wszystkich państw w zbiorze danych, z wykorzystaniem danych dołączonych, wywołuje funkcję i dokonuje inspekcji poprawności i czytelności wykresów. W końcu dokonuje wywołania na danych zapisanych funkcją `saveData()` oraz weryfikuje zbieżność rezultatów. | Pozytywny | 0.9.0 | 2024-01-01 | Etykiety czasami nachodzą na siebie, jeżeli wykres nie jest powiększony, np. dla Włoch. | RKL |
| TF.STS.1 | Test tworzenia tabel wartości kapitalizacji w sektorach w czasie | Tester sprawdza, czy wywołanie funkcji bez parametrów nie wywołuje błędu. Tester sprawdza, czy wywołanie funkcji z poprawnym parametrem państwa oraz pustym parametrem ścieżki zwraca rezultat. Tester zapisuje zbiory danych na dysku i sprawdza, czy wywołanie wraz z parametrem ścieżki zwraca ten sam rezultat, co bez. Tester wywołuje funkcję dla ośmiu państw, następnie sumuje pierwsze kolumny (Basic Materials). Następnie sprawdza, czy rezultat jest w przybliżeniu równy pierwszej kolumnie wywołania bez parametrów. | Pozytywny | 0.5.0 | 2023-12-31 | --- | RKL |
| TF.STS.2 | Test tworzenia wykresów wartości kapitalizacji w sektorach w czasie | Tester sprawdza adekwatność plików pomocy. Wywołuje funkcję z różnymi zestawami niepoprawnych parametrów. Sprawdza, czy jest prezentowana oczekiwana informacja. Następnie wywołuje funkcję z poprawnymi parametrami, dla danych wbudowanych. Dokonuje inspekcji czytelności wykresów i poprawności wyświetlanych informacji. Następnie zapisuje zbiory danych w katalogu bieżącym i weryfikuje dalszą poprawność działania wywołań.  | Pozytywny | 0.8.0 | 2024-01-01 | --- | RKL |
| TF.STS.3 | Test tworzenia wykresów porównawczych relatywnych wyników ekonomicznych | Tester sprawdza adekwatność plików pomocy. Wywołuje funkcję z różnymi zestawami niepoprawnych parametrów. Sprawdza, czy jest prezentowana oczekiwana informacja. Następnie wywołuje funkcję z poprawnymi parametrami, dla danych wbudowanych. Dokonuje inspekcji czytelności wykresów i poprawności wyświetlanych informacji. Następnie zapisuje zbiory danych w katalogu bieżącym i weryfikuje dalszą poprawność działania wywołań. | Pozytywny | 0.8.0 | 2024-01-01 | Wywołanie dla tego samego państwa i sektora jest obsługiwane - wtedy krzywe pokrywają się. | RKL |
| TF.STA.1 | Test tworzenia tabel raportów analizy technicznej przekrojów sektorowo-geograficznych | ... | ... | ... | --- | --- | --- |
</details>
