# Spring Boot

## 1. Spring Boot и его преимущества  

- Фреймворк для быстрого создания Spring-приложений с минимальной конфигурацией.  
- Преимущества:  
  - Автоконфигурация (автоматическая настройка бинов).  
  - Встроенные серверы (Tomcat, Jetty).  
  - Стартер-зависимости (`spring-boot-starter-*`).  
  - Готовые решения для метрик, мониторинга (Actuator).  

## 2. Разница между Spring и Spring Boot  

- Spring: Базовый фреймворк с ручной настройкой (XML, аннотации).  
- Spring Boot: Надстройка над Spring с «умными» дефолтами и автоматизацией конфигурации.  

## 3. @Service, @Component, @Repository  

- @Component: Общая аннотация для любых бинов.  
- @Service: Специализация для бизнес-логики.  
- @Repository: Для DAO-слоя (добавляет обработку SQL-исключений).  

## 4. Аннотации Spring MVC  

- @Controller: Определяет класс как MVC-контроллер.  
- @RequestMapping, @GetMapping, @PostMapping: Маппинг URL.  
- @RequestParam, @PathVariable: Извлечение параметров запроса.  
- @ResponseBody: Возврат данных вместо представления.  

## 5. Аннотация @Value  

Инъекция значений из properties-файлов или переменных окружения.  
Пример:  

```java  
@Value("${app.name}")  
private String appName;  
```  

## 6. Spring Boot Starter  

Готовые наборы зависимостей для конкретных задач (например, `spring-boot-starter-web` включает Tomcat, Spring MVC).  
Использование: Добавить в `pom.xml` или `build.gradle`.  

## 7. Управление конфигурацией  

- `application.properties`/`application.yml`: Основные настройки.  
- Профили (`@Profile`): Конфигурации для разных сред (dev, prod).  
- `@ConfigurationProperties`: Привязка свойств к Java-классам.  

## 8. Инструменты разработки и тестирования  

- DevTools: Hot reload, автоматический перезапуск.  
- Actuator: Эндпоинты для мониторинга (/health, /metrics).  
- Тестирование:  
  - `@SpringBootTest` для интеграционных тестов.  
  - `@WebMvcTest` для тестирования контроллеров.  
  - `TestRestTemplate` для HTTP-запросов.  
