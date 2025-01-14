import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/models/dio.dart';

class DartzService {
  //Buat return, left untuk gagal, right untuk yang benar
  Future<Either<Failure, ResponseGetNewBelajarDio>> getNews() async {
    try {
      final response = await Dio()
          .get('https://api-berita-indonesia.vercel.app/antara/terbaru/');

      if (response.statusCode == 200) {
        return Right(ResponseGetNewBelajarDio.fromJson(response.data));
      } else {
        return Left(Failure(message: 'Failed to fetch data'));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}

class Failure {
  String? message;
  Failure({this.message});
}
