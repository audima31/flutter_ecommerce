import 'package:dio/dio.dart';
import 'package:ecommerce/models/dio.dart';

class DioService {
  final dio = Dio();
  Future<ResponseGetNewBelajarDio> getHttp() async {
    try {
      final response = await Dio()
          .get('https://api-berita-indonesia.vercel.app/antara/terbaru/');
      return ResponseGetNewBelajarDio.fromJson(
          response.data); // Pastikan ini sesuai
    } catch (e) {
      throw Exception('Failed to fetch data');
    }
  }
}
