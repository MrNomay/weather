// ignore_for_file: avoid_print
import 'package:http/http.dart' as http;
import 'package:weather/models/weathermodel.dart';
import 'package:weather/utils/key.dart';

Future<Weather> fetchweather(String location) async {
  try {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$key');
    var response = await http.get(url);
    var output = weatherFromJson(response.body);
    return output;
  } catch (e) {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=yamoussoukro&appid=$key');
    var response = await http.get(url);
    final output = weatherFromJson(response.body);
    print(e.toString());
    return output;
    
  }
}
