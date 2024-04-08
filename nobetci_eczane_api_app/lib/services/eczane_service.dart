import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nobetci_eczane_api_app/models/eczane.dart';

class EczaneService extends ChangeNotifier {
  List<Eczane> _eczaneler = [];
  List<Eczane> get eczaneler => _eczaneler;
  set eczaneler(List<Eczane> value) {
    _eczaneler = value;
    notifyListeners();
  }

  Future<void> getEczaneData(String il, String ilce) async {
    final String url = "https://api.collectapi.com/health/dutyPharmacy?ilce=$ilce&il=$il";
    const Map<String, dynamic> headers = {
      "authorization": "apikey 2E2CMgg1ZT8esYjP78RpDD:3XVbDs0fDHZHq8QOb1Q4iF",
      "content-type": "application/json"
    };

    final dio = Dio();
    final response = await dio.get(url, options: Options(headers: headers));

    if (response.statusCode != 200) {
      return Future.error("Bir sorun oluştu...");
    }

    final List list = response.data["result"];
    final List<Eczane> eczaneList = list.map((e) => Eczane.fromJson(e)).toList();
    eczaneler = eczaneList;
  }
}
