

sIndicesChart <- function(country, path){
  # Funkcja z opcjonalnymi parametrami nazwy państwa (country) oraz path
  # zwraca w formie wykresu zbiorczego szeregów czasowych
  # (po jeden szereg na sektor) wartości kapitalizacji łącznej w Euro
  # wszystkich spółek dla każdego z sektorów w poszczególnych miesiącach,
  # dla których dostępne są notowania w bazie.
  # Wartości przeliczone są do waluty Euro na podstawie notowań poszczególnych
  # spółek w zbiorze danych oraz notowań FX.
  # Domyślnie prezentowane są wyliczenia dla całego zbioru spółek
  # a uzupełnienie parametru wybranego państwa zawęża reultat geograficznie.
  # Wykres zawiera informatywny tytuł oraz legendę.
  # Domyślnie funkcja wykorzystuje dane dołączone a w przypadku ustaleniu
  # wartości parametru path ich wersje zapisane na dysku użytkownika (F.DB.1)
  return("INDICES CHART")
}
