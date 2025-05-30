# Class Object. Equals and HashCode

## 1. Class Object  

Базовый класс всех объектов Java. Содержит методы: `equals()`, `hashCode()`, `toString()`, `clone()`, `finalize()`, `wait()`, `notify()`, `notifyAll()`.

## 2. Equals и HashCode  

- `equals()`: Сравнение объектов на семантическое равенство.  
- `hashCode()`: Генерация хэш-кода для использования в хэш-коллекциях (HashMap, HashSet).  

## 3. Контракт между equals и hashCode  

- Если `a.equals(b) == true`, то `a.hashCode() == b.hashCode()`.  
- Обратное неверно: одинаковые хэши не гарантируют равенство объектов.

## 4. Условия переопределения equals  

- Рефлексивность: `a.equals(a) == true`.  
- Симметричность: `a.equals(b) == b.equals(a)`.  
- Транзитивность: Если `a.equals(b)` и `b.equals(c)`, то `a.equals(c)`.  
- Консистентность: Результат не должен меняться между вызовами.  
- Неравенство с `null`: `a.equals(null) == false`.

## 5. Если не переопределить equals/hashCode  

- `equals()` сравнивает ссылки (`==`).  
- `hashCode()` возвращает адрес в памяти (не подходит для хэш-коллекций).

## 6. Значения без переопределения  

- `new Object().equals(new Object()) → false`.  
- `new Object().hashCode() ≠ new Object().hashCode()`.

## 7. Симметричность и `equals()`  

Симметричность нарушится, если в `equals()` участвуют разные классы. Пример:  

```java  
class A { ... }  
class B extends A { ... }  
a.equals(b) → true, но b.equals(a) → false.  
```

## 8. Коллизия hashCode  

Разные объекты имеют одинаковый хэш. Решения:  

- Хороший алгоритм хэширования.  
- В HashMap: связные списки/деревья в бакетах.

## 9. Изменение объекта в hash-коллекции  

Если объект изменен после добавления в коллекцию, его хэш может не соответствовать бакету → коллекция становится некорректной.

## 10. `instanceof` vs `getClass()`  

- `instanceof`: Разрешает сравнение с подклассами (может нарушить симметричность).  
- `getClass()`: Строгая проверка класса (гарантирует симметричность).

## 11. Метод clone()  

Создает копию объекта. Требует:  

- Реализации `Cloneable`.  
- Глубокого копирования (если объект содержит изменяемые поля).  
- Переопределения с `public` доступом.
