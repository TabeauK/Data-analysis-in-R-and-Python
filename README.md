# Analiza danych w R i Python (Data analysis in R-and Python)
Poniżej znajdują się projekty przygotowujące i analizujące pewien zbiór danych oraz raporty z wnioskami wynikającymi z analiz. Zdecydowanie najciekawszym projektem z poniższych jest "Analiza danych (Bikes)"

## Zarządzanie danymi (Data managment)
Praca ma za zadanie przyblirzyć zarządzanie danymi w R za pomocą popularnych bibliotek.
Żródło danych: http://www.gagolewski.com/resources/data/

W każdym paragrafie znajdują się 4 funkcje zwracające te same wyniki, ale wykonane za pomocą różnych bibliotek.
1. SQLDF
2. Funkcje Bazowe
3. DPLYR
4. Data.table
Do tego funkcje 2,3,4 są porównywane do pierwszej za pomocą dplyr::all_equal(), która zwraca czy obiekty zawierają takie sam dane. Mogą byc w różnych permutacjach.
Następnie funkcje są porownywane od strony działania czasowego za pomocą microbenchmark::microbenchmark().
Pełny opis zadania znajduje się w pliku Task.html   

## Algorytmy klasyfikacji (Classification algorythms)
Praca ma na celu zbadać następujące algorytmy klasyfikacji:
1. k-najbliższych sąsiadów z metryką L1, L2 oraz L∞ dla wszystkich kombinacji różnych k, np. 1, 3, 5, 7, 9, 11, 13, 15, 17, 19, oraz funkcji agregujących;

W raporcie testy.pdf:
Dla każdej funkcji agregującej, dla jednej z 3 metryk (1,2,INF) dla jednego z trzech zbiorów danych (affairs, auto_ord, glass) jest oblicznana ramka
danych w postaci błędów dla różnych k (1,3,5,7,9,11,13,15,17,19). Do tego jest wykres obrazujący dane.
Dodatkowo jest obliczana próba 1-nn, gdzie dla k=1 próba ucząca i testowa są te same. Wnioski znajdują
się na końcu.

2. algorytm lasów losowych (randomForest::randomForest());
3. regresję logistyczną dla danych porządkowych (ordinal logistic regression lub proportional odds model,
MASS::polr());
4. co najmniej jedną inną metodę klasyfikacji dostępną w R

W raport.pdf są umieszczone porównania błędów funkcji agregujących dla różnych k dla różnych przestrzeni L oraz wyniki błędów funkcji klasyfikujących RandomForest, Mass::polr (tam gdzie wynik był zbieżny) oraz class::knn dla każdej ramki danych oraz podsumowanie i wnioski. 

Pełny opis zadania znajduje się w pliku Task.html

## Analiza danych (Bikes)
Naszym celem badawczym było sprawdzenie jak oddziaływują różne pory roku na użycie publicznych rowerów w Nowym Yorku. 
Braliśmy pod uwagę zimę i lato na przestrzeni lat 2015-2020. Wybraliśmy do tego miesiące grudzień-luty oraz  czerwiec-sierpień.
W naszych badaniach porównywaliśmy wiek oraz przebyty dystans i czas wypożyczenia w zależności od płci oraz popularność stacji rowerowych w rożnych miesiącach.
Wszystkie dane użyte w badaniu zostały udostepnione przez NYC Bike Share, LLC.

Wyniki znajdują się w raport.html
Pełny opis zadania znajduje się w pliku Task.html

## Zarządzanie danymi NUMPY i PANDAS (Data managment NUMPY and PANDAS)
W raporcie Raport.html są zamieszczone wyniki 3 zapytań
rozwiązanych na dwa sposoby. Pierwszym z nich jest skorzystanie z funkcji pandas.read_sql_query(),
która interpretuje zapytanie napisane w SQL, a drugą użycie funkcji bazowych, funkcji z biblioteki numpy oraz pandas do przetwarzania danych.
Następnie będzie pokazany typ wyników za pomocą funkcji oraz sprawdzenie równoważności rozwiązania funkcją equals().

Pełny opis zadania znajduje się w pliku Task.html