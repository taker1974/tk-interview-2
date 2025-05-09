# Enum

## 1. Краткая характеристика Enum  

- Тип данных для фиксированного набора констант (безопасная замена `int`/`String` констант).  
- Может содержать поля, методы, конструкторы.  
- Неявно наследуется от `java.lang.Enum`.  

## 2. Реализация интерфейса  

Да. Пример:  

  ```java
  interface Loggable { void log(); }  
  enum Status implements Loggable {  
    ACTIVE { public void log() { ... } },  
    INACTIVE { public void log() { ... } }  
  }  
  ```  

## 3. Наследование (extends)  

Нет. Enum не может наследовать классы (кроме неявного наследования от `java.lang.Enum`).  

## 4. Enum без экземпляров  

Нет. Должен содержать минимум одну константу.  

## 5. Переопределение `toString()`  

Да. Пример:  

  ```java
  enum Color { RED { public String toString() { return "Красный"; } }  
  ```  

## 6. Поведение `toString()` по умолчанию  

Возвращает имя константы (например, `RED` для `Color.RED`).  

## 7. Конструктор в Enum  

Да. Конструктор должен быть `private`:  

  ```java
  enum Size { SMALL(10), MEDIUM(20);  
    private int value;  
    private Size(int value) { this.value = value; }  
  }  
  ```  

## 8. `==` vs `equals()`  

- `==` сравнивает ссылки (безопасно, т.к. константы уникальны).  
- `equals()` вызывает `==` под капотом.  

## 9. Метод `ordinal()`  

- Возвращает порядковый номер константы (начинается с 0).  
- Пример: `Color.RED.ordinal()` → 0.  

## 10. Enum в `TreeSet`/`TreeMap`  

- Да. Сортировка по `natural order` (порядок объявления констант).  

## 11. Связь `ordinal()` и `compareTo()`  

- `compareTo()` использует `ordinal()` для сравнения.  

## 12. Enum в `switch case`  

- Да. Пример:  

  ```java
  switch (color) {  
    case RED: ... break;  
    case BLUE: ... break;  
  }  
  ```  

## 13. Получение всех значений Enum  

- Метод `values()`:  

  ```java
  Color[] colors = Color.values(); // [RED, GREEN, BLUE]  
  ```  
