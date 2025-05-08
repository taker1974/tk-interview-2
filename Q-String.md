# String

1. Класс String в Java  

- Неизменяемый (immutable) класс для работы с последовательностями символов.  
- Реализует интерфейсы `CharSequence`, `Serializable`, `Comparable<String>`.  
- Хранится в куче (heap), но с оптимизацией через строковый пул (String Pool).  

2. Способы создания String  

- Литерал: `String s = "text";` (попадает в String Pool).  
- Через конструктор: `new String("text")` (создает новый объект в куче).  
- Из массива символов: `new char[] {'t','e','x','t'}`.  
- Через `StringBuilder`/`StringBuffer`: `new StringBuilder().toString()`.  

3. Сравнение и сортировка строк  

- `==`: Сравнивает ссылки, а не содержимое.  
- `equals()`: Сравнивает содержимое строк.  
- `compareTo()`: Для сортировки (возвращает разницу в Unicode).  
- `Arrays.sort()` или `Collections.sort()` с компаратором.  

4. Строковый пул (String Pool)  

- Специальная область в heap для хранения уникальных строковых литералов.  
- Цель: Экономия памяти за счет переиспользования строк.  
- При создании через литерал (`"text"`) JVM сначала проверяет String Pool.  

5. String vs StringBuffer vs StringBuilder  

- String: Неизменяемый. Подходит для констант, ключей в `HashMap`.  
- StringBuffer: Изменяемый, потокобезопасный (синхронизированные методы).  
- StringBuilder: Изменяемый, не потокобезопасный, быстрее StringBuffer.  
- Использовать:  
  - `String` для редко меняющихся данных.  
  - `StringBuilder` для однопоточных операций.  
  - `StringBuffer` для многопоточных.  

Примеры:  

```java
// Создание строк
String s1 = "Hello";        // String Pool
String s2 = new String("Hello"); // Heap

// Сравнение
boolean isEqual = s1.equals(s2); // true

// StringBuilder
StringBuilder sb = new StringBuilder();
sb.append("Hello").append(" World");
String result = sb.toString(); // "Hello World"
```
