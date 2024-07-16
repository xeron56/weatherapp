# Weather App 

A simple weather application built with Flutter showcasing clean architecture principles, dependency injection, network requests, state management, and testing.

## Architecture 

The app follows a clean architecture pattern, separating the code into three main layers:

**1. Presentation:** This layer is responsible for the user interface and user interactions.
.

**2. Domain:** This layer contains the business logic of the app, independent of any UI or data sources.


**3. Data:** This layer handles data access, retrieval, and persistence.

  

**Dependency Injection:**

- **GetIt** is employed for dependency injection, making it easy to manage and provide dependencies across the app. This promotes testability and maintainability.

                                 +-----------------+
                                 |     User        |
                                 +-------+----------+
                                         |
                                         | UI Events
                                         v
                   +---------------------------------------------------+
                   |              Presentation Layer (GetX)            |
                   +---------------------------------------------------+
                   | HomeScreen (Widget)                             |
                   | WeatherController (State Management & Logic)    |
                   |   - cityName (RxString)                         |
                   |   - weather (Rx<Weather?>)                       |
                   |   - isLoading (RxBool)                          |
                   |   - error (RxString)                            |
                   +-----------------------+--------------------------+
                                         |
                                         | GetWeather()
                                         |
                                         v
                   +---------------------------------------------------+
                   |              Domain Layer (Business Logic)        |
                   +---------------------------------------------------+
                   | GetWeatherUseCase                                |
                   |   - execute() / call()                         |
                   +-------+------------------------------------------+
                               |
                               | Depends on abstraction
                               v
                   +---------------------------------------------------+
                   |              Data Layer (Data Access)            |
                   +---------------------------------------------------+
                   | WeatherRepositoryImpl                          |
                   |   - getWeatherForCity()                        |
                   +-------+------------------------------------------+
                               |
                               | Uses
                               v
                   +-----------------+     
                   | WeatherRemoteDataSource |   
                   +-----------------+     
                   |   - getWeatherForCity()  
                   |        (Dio)           |   
                   +-----------------+     
                                         |
                                         | API Request
                                         v
                                 +---------------+
                                 | OpenWeatherMap |
                                 +---------------+ 

## Packages Used:

- **Flutter:** The core framework for building the app's user interface.
- **GetX:** A powerful and lightweight state management, navigation, and dependency injection solution for Flutter. 
- **Dio:** A powerful HTTP client for Dart, used for making network requests to the weather API.
- **Retrofit:** A type-safe HTTP client for Flutter and Dart, simplifying API communication.
- **json_annotation:**  Used for code generation to handle JSON serialization and deserialization. 
- **GetIt:** A simple service locator for dependency injection.
- **Pretty Dio Logger:** For logging network requests and responses, useful for debugging.
- **Dio Smart Retry:** For automatically retrying failed network requests, improving the app's resilience.
- **equatable:**  To simplify equality comparisons in Dart objects.
- **internet_connection_checker:**  To check for active internet connections.

**Testing:**

- **flutter_test:** The core Flutter testing framework.
- **mockito:**  A mocking framework for creating mock objects during testing. 


https://github.com/user-attachments/assets/3a5d0d35-2691-4b78-a61b-546afcdcad15



## Getting Started

**1. Clone the repository:**

   ```bash
   git clone https://github.com/xeron56/weatherapp.git
   ```

**2. Install dependencies:**

  ```bash
  flutter pub get
  ```

**3. Run the app:**

 ```bash
  flutter run
```  

 


