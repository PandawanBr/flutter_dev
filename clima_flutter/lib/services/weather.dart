import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(getUriCityWeather(cityName));
    return await networkHelper.getData();
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(getUriWeather(location));
    return await networkHelper.getData();
  }

  Uri getUriCityWeather(String cityName) {
    String apiKey = '57d51a6f8d5e3eeaedd6b8689470d164';
    Map<String, dynamic> queryParam = {};
    queryParam.putIfAbsent('q', () => cityName);
    queryParam.putIfAbsent('appid', () => apiKey);
    queryParam.putIfAbsent('units', () => 'metric');

    return getUri(queryParam);
  }

  Uri getUriWeather(Location location) {
    String apiKey = '57d51a6f8d5e3eeaedd6b8689470d164';
    Map<String, dynamic> queryParam = {};
    queryParam.putIfAbsent('lat', () => location.latitude.toString());
    queryParam.putIfAbsent('lon', () => location.longitude.toString());
    queryParam.putIfAbsent('appid', () => apiKey);
    queryParam.putIfAbsent('units', () => 'metric');

    return getUri(queryParam);
  }

  Uri getUri(Map<String, dynamic> queryParam) {
    return Uri(
        scheme: 'https',
        host: 'api.openweathermap.org',
        path: 'data/2.5/weather',
        queryParameters: queryParam);
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
