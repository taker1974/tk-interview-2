# Spring Data

## 1. Репозиторий в Spring Data  

Интерфейс для доступа к данным (CRUD-операции). Примеры:  

- `CrudRepository`: Базовые операции (save, findById, delete).  
- `JpaRepository`: Расширенный API (пагинация, сортировка).  

Использование:  

```java  
public interface UserRepository extends JpaRepository<User, Long> { ... }  
```  

## 2. Подключение к БД  

- Добавить зависимость (напр., `spring-boot-starter-data-jpa`).  
- Настроить `application.properties`:  

  ```properties  
  spring.datasource.url=jdbc:postgresql://localhost:5432/db  
  spring.datasource.username=user  
  spring.datasource.password=pass  
  ```  

## 3. Требования к Entity-классу  

- Аннотация `@Entity`.  
- Поле с `@Id` (первичный ключ).  
- Конструктор без аргументов (по умолчанию).  
- Геттеры/сеттеры для полей (опционально).  

## 4. Аннотация `@Query`  

Позволяет задать кастомный JPQL/SQL-запрос:  

```java  
@Query("SELECT u FROM User u WHERE u.active = true")  
List<User> findActiveUsers();  
```  

## 5. Фетч-стратегии  

Определяют, когда загружать связанные сущности:  

- EAGER: Немедленная загрузка (может привести к N+1).  
- LAZY: Ленивая загрузка (по умолчанию для `@ManyToMany`, `@OneToMany`).  

## 6. Проблема N+1  

Суть: При загрузке N сущностей выполняется N+1 запрос (1 для основного списка + N для связанных данных).  
Пример:  

```sql  
SELECT * FROM users;        -- 1 запрос  
SELECT * FROM orders WHERE user_id = 1;  
SELECT * FROM orders WHERE user_id = 2;  
...  
```  

Решение:  

- Использовать `JOIN FETCH` в JPQL:  

  ```java  
  @Query("SELECT u FROM User u JOIN FETCH u.orders")  
  List<User> findAllWithOrders();  
  ```  

- Настройка `@EntityGraph` для загрузки связей.
