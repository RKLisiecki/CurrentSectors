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
### Autorzy:
**Ryszard Karol Lisiecki** – pomysłodawca, projektant, programista, tester;
**Michał Bartkiewicz** – kontroler jakości, programista, tester.

### Warunki licencyjne: 

**licencja MIT** - umożliwiająca użytkowanie, dystrybucję, modyfikację oraz czerpanie korzyści z kodu bez ograniczeń z wykluczeniami zdefiniowanymi w przepisach i/lub precedensach nadrzędnych;

**zastrzeżenie Fair Use** - dotyczące wykorzystania żródeł klasyfikacji spółek oraz danych giełdowych jedynie do celów edukacyjnych oraz ograniczające ich wykorzystanie w materiałach wtórnych bazujących na opisywanym oprogramowaniu.

## 3. Specyfikacja wymagań
Wykorzystane w nazewnictwie identyfikatorów wymagań skrótowce opierają się na angielskim brzmieniu słów:
- dotyczących kryteriów jakości oprogramowania (**system performance**; **security**: confidentiality, integrity; **functionality**: interoperability; **reliability**: availability, fault tolerance; **usability**: accessibility, learnability, ease of use; **portability**: adaptability, installability; **maintainability**: testability)
- określeń funkcjonalności (display datasets; display help; display lists; update time series; sector structure; sector time series; sector technical analysis). 

### Wymagania pozfunkcjonalne

Klasyfikacji wymagań pozafunkcjonalnych dotyczących jakości dokonano w oparciu o standard **ISO/IEC 25010:2011**. Uwzględniono tylko subiektywnie najważniejsze kryteria.

| Identyfikator | Nazwa | Opis | Priorytet | Kategoria |
| --- | --- | --- | :---: | --- |
| NF.Q.SP.1 | Wydajność biblioteki | Operacje dotyczące przetwarzania matematycznego danych *offline* na komputerze bądź serwerze użytkownika funkcje biblioteki wykonują możliwie najszybciej, z wykorzystaniem przetwarzania równoległego. | 1 | pozafunkcjonalne |
| NF.Q.SP.2 | Wydajność web-scrapingu | Operacje dotyczące zaciągania danych z API oraz stron znajdujących się w kontekście systemu funkcje biblioteki wykonują w dbałości o nieprzekracznie limitów API Yahoo Finance. | 1 | pozafunkcjonalne |
| NF.Q.S.C.1 | Bezpieczeństwo - poufność | Biblioteka w żaden sposób nie monitoruje, nie archiwizuje ani nie przesyła informacji o działalności użytkownika ponad to, co jest konieczne do spowalniania web-scrapingu. | 1 | pozafunkcjonalne |
| NF.Q.S.I.1 | Bezpieczeństwo - integralność danych zawartych | Dane giełdowe zawarte w bibliotece sprawdzone są pod kątem poprawności formalnej oraz zmodyfikowane w stosunku do źródłowych tylko w aspekcie organizacji i składowania danych. | 1 | pozafunkcjonalne |
| NF.Q.F.I.1 | Interoperacyjność | Biblioteka może współpracować z innymi bibliotekami środowiska R nawet w przypadków konfliktu nazw funkcji. Funkcje biblioteki dodawane są do ścieżki wyszukań po załadowaniu biblioteki. | 1 | pozafunkcjonalne |
| NF.Q.R.A.1 | Dostępność | Dostępność zdalnego repozytorium biblioteki uwarunkowana jest uwarunkowana dostępnością usług Github (powyżej 99,7% czasu w roku) a skompilowana przez użytkownika biblioteka dostępna jest zawsze. | 1 | pozafunkcjonalne |
| NF.Q.R.FT.1 | Odporność na błędy użytkowników | Działanie funkcji biblioteki jest uodpornione na większość najczęściej popełnianych błędów podczas wprowadzania danych przez użytkownik. | 1 | pozafunkcjonalne |
| NF.Q.R.FT.1 | Odporność na błędy bibliiotek skojarzonych i usług API | Funkcje obliczeniowe i graficzne biblioteki są odporne na nieprawidłowe działanie usług związanych z pozyskiwaniem danych z Internetu. | 1 | pozafunkcjonalne |
| NF.Q.U.A.1 | Przystępność | Biblioteka jest przystosowana do prezentowania pomocy w języku angielskim - w tym dla użytkowników niedowidzących, korzystających z czytników ekranu. | 1 | pozafunkcjonalne |
| NF.Q.U.L.1 | Łatwość przyswojenia | Biblioteka zawiera niewielką liczbę funkcji, na wysokim poziomie abstrakcji oraz co najwyżej kilku parametrach. | 1 | pozafunkcjonalne |
| NF.Q.U.EoU.1 | Łatwość użytkowania | Funkcje biblioteki mają intuicyjne nazwy oraz dostępne pliki pomocy zawierające przykłady użycia | 1 | pozafunkcjonalne |
| NF.Q.P.A.1 | Przystosowawczość | Działanie biblioteki nie jest upośledzane poprzez zmieny sprzętu bądź systemu operacyjnego tak długo, jak wspierają one działanie środowiska R w odpowiedniej wersji. | 1 | pozafunkcjonalne |
| NF.Q.P.I.1 | Efektywność instalacji | Biblioteka może zostać zarówno zainstalowana, jak też odinstalowana poprzez uruchomienie jednej linijki kodu. | 1 | pozafunkcjonalne |
| NF.Q.M.T.1 | Testowalność | Funkcje bibilioteki posiadają niezawierające sprzeczności kryteria akceptowalności zwracanych rezultatów. | 1 | pozafunkcjonalne |


### Wymagania funkcjonalne

Opis wymagań jest adekwatny dla użytkowników, którzy zainstalowali oraz załadowali bibliotekę CurrentSectors do własnego środowiska R, po czym wywołują w konsoli odpowiednie polecenia i funkcje opisane w plikach pomocy.

#### **Grupa nr 1 (display):** wyświetlanie i/lub zapis do zmiennej list zbiorczych

| Identyfikator | Nazwa | Opis | Priorytet | Kategoria |
| --- | --- | --- | :---: | --- |
| F.DD.1 | Wyświetlanie i/lub zapis danych dołączonych | ... | 1 | Funkcjonalne |
| F.DH.1 | Wyświetlanie plików pomocy | ... | 1 | Funkcjonalne |
| F.DL.1 | Wyświetlanie i/lub zapis list spółek o zadanych atrybutach (funkcja `listCompanies(country, sector, industry,...)`) | Po wywołaniu funkcji z opcjonalnymi parametrami tekstowymi nazwy kraju lub/i nazwy przemysłu (lub nazwy sektora) w konsoli prezentowany jest wierszami zbiór **nazw, symboli spółek, ich przemysłów, sektorów, krajów rejestracji** oraz **waluty kwotowania**. Wynik w postaci tabeli może być jednocześnie przez przypisanie przekierowywany do zmiennej o typie `list` i klasie `data.frame`. W przypadku niewłaściwej parametryzacji przez użytkownika lub braku rezultatów, do konsoli zostanie zwrócony monit. | 1 | Funkcjonalne |
| F.DL.1.2 | Wyświetlanie i/lub zapis list spółek o zadanych atrybutach oraz filtrze liczbowym najniższej progowej kapitalizacji rynkowej (funkcja `listCompanies(country, sector, industry, market_cap_thresh)`) | Po wywołaniu tej samej funkcji, co w **F.DL.1.1** z dodatkowym, opcjonalnym parametrem liczbowym progowego **poziomu kapitalizacji rynkowej**  ten sam rezultat zostanie zawężony do spółek przekraczających określony poziom kapitalizacji rynkowej.  | 1 | Funkcjonalne |

#### **Grupa nr 2 (database):** zapis i aktualizacja szeregów czasowych

| Identyfikator | Nazwa | Opis | Priorytet | Kategoria |
| --- | --- | --- | :---: | --- |
| F.DB.SD.1 | Zapis danych biblioteki na dysku użytkownika (funkcja `saveData(path)`) | Po zapisaniu przez użytkownika w zmiennej tekstowej `path` ścieżki dyskowej katalogu oraz wywołaniu funkcji z tym parametrem, dane zapisane w bibliotece zostaną zapisane w plikach .csv w wybranym miejscu na dysku, co umożliwi ich późniejszą aktualizację. W przypadku Niewłaściwej parametryzacji lub niedostępność lokalizacji, do konsoli zostanie zwrócony monit. | 1 | funkcjonalne |
| F.DB.UD.1 | Aktualizowanie bazy plików csv użytkownika (funkcja `updateData(path_to_local_data)`) | Po zapisaniu przez użytkownika w zmiennej tekstowej `path_to_local_data` lokalizacji katalogu zawierającego zapisane uprzednio pliki danych z biblioteki oraz wywołaniu funkcji z tym parametrem, dane szeregów czasowych oraz ich metadane zostaną zaktualizowane, jeżeli tylko istnieją już nowsze obserwacje. W przypadku niewłaściwej parametryzacji, niedostępności lokalizacji lub braku potrzeby aktualizacji, do konsoli zostanie zwrócony monit. | 1 | funkcjonalne |


#### **Grupa nr 3 (sector structures):** analiza struktury sektorowej walorów w danym państwie

| Identyfikator | Nazwa | Opis | Priorytet | Kategoria |
| --- | --- | --- | :---: | --- |
| ... | ... (funkcja `sStructure(country, libdata=TRUE)`) | ... | 1 | funkcjonalne |
| ... | ... (funkcja `sStructureChart(country, libdata=TRUE)`) | ... | 1 | funkcjonalne |


#### **Grupa nr 4 (sector time series):** analiza szeregów czasowych sektorów
funkcje sIndices(country), sIndicesChart(...) - wartość kapitalizacji w czasie - tabela i wykres
funkcja sIndicesTRCompChart(country1, country2, sector1, sector2) - wykres porównawczy indeksów jednopodstawowych kapitalizacji t1=100
| Identyfikator | Nazwa | Opis | Priorytet | Kategoria |
| --- | --- | --- | :---: | --- |
| ... | ...(funkcja `sIndices(country)`) | ... | 1 | funkcjonalne |
| ... | ...(funkcja `sIndicesChart(country)`) | ... | 1 | funkcjonalne |
| ... | ...(funkcja `sIndicesTRCompChart(country)`) | ... | 1 | funkcjonalne |

#### **Grupa nr 5 (sector technical analysis):** - raport analizy technicznej grupy spółek sektora w państwie

| Identyfikator | Nazwa | Opis | Priorytet | Kategoria |
| --- | --- | --- | :---: | --- |
| ... | ...(funkcja `TAReport(country, sector)`) | ... | 1 | funkcjonalne |

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
