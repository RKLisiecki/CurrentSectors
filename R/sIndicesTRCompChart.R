

sIndicesTRCompChart <- function(country1, country2, sector1, sector2, path) {
  # Funkcja z obligatoryjnymi argumentami nazw dwóch państw (country1, country2),
  # nazw dwóch sektorów (sector1, sector2) oraz opcjonalnym parametrem path
  # zwraca w fromie wykresu dwóch szeregów czasowych wartości indeksów
  # jednopodstawowych kapitalizacji łącznej spółek w tych państwach
  # oraz sektorach w poszczególnych miesiącach, dla których dostępne są notowania w bazie.
  # Wartość w pierwszym okresie = 100. Funkcja nie dokonuje konwersji walutowej kwotowań.
  # Umożliwia również porównania w tym samym państwie lub tym samym sektorze.
  # Wykres zawiera informatywny tytuł oraz legendę.
  # Domyślnie funkcja wykorzystuje dane dołączone a w przypadku ustalenia wartości
  # parametru path ich aktualizowane wersje zapisane na dysku użytkowanika (F.DB.1)
  return("INIDICES COMPARISON CHART")
}
