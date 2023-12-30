
TAReport <- function(country, sector, path) {
  # Funkcja z obligatoryjnymi parametrami nazwy państwa (country)
  # oraz nazwy sektora (sector) i opcjonalnym parametrem path zwraca w formie tabeli
  # (struktury data.frame) raport analizy technicznej wszystkich spółek
  # wybranego przekroju sektorowo-geograficznego. Wiersze tabeli odpowiadają kolejnym spółkom.
  # Kolumny tabeli, to Name - nazwa spółki, Ticker - użyty symbol giełdowy,
  # Industry - branża spółki, MA - kategoria trendu notowań (bullish lub bearish)
  # ustalona na podstawie relacji aktualnej ceny do wartości 11-okresowej średniej ruchomej,
  # RSI - kategoria oscylatora Relative Strength Index (overbought, no signal lub oversold)
  # ustalona na podstawie 14-okresowej wartości wskaźnika RSI w jednym z przedziałów (<70-100>, [30-70], <0, 30>).
  # Domyślnie funkcja wykorzystuje dane dołączone
  # a w przypadku ustaleniu wartości parametru path ich wersje zapisane na dysku użytkownika (F.DB.1)
  return("TAReport")
}
