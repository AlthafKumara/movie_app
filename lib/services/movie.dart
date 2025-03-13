import 'dart:convert';

import 'package:app_movie/models/movie_model.dart';
import 'package:app_movie/models/response_data_list.dart';
import 'package:app_movie/models/user_login.dart';
import 'package:app_movie/services/url.dart' as url;
import 'package:http/http.dart' as http;

class MovieService {
  Future getMovie() async {
    UserLogin userLogin = UserLogin();
    var user = await userLogin.getUserLogin();
    if (user.status == false) {
      ResponseDataList response = ResponseDataList(
          status: false, message: "Anda Belum Login / Token Invalid");
      return response;
    }

    var uri = Uri.parse(url.BaseUrl + "/get_movie");
    Map<String, String> headers = {
      "Authorization": 'Bearer ${user.token}',
    };
    var getMovie = await http.get(uri, headers: headers);

    if (getMovie.statusCode == 200) {
      var data = json.decode(getMovie.body);
      if (data["status"] == true) {
        List movie = data["data"].map((r) => MovieModel.fromJson(r)).toList();
        ResponseDataList response = ResponseDataList(
            status: true, message: "Succes Load data", data: movie);
        return response;
      } else {
        ResponseDataList response =
            ResponseDataList(status: false, message: "Failed Load Data");
        return response;
      }
    } else {
      ResponseDataList response = ResponseDataList(
          status: false,
          message: "gagal load movie dengan code error ${getMovie.statusCode}");
      return response;
    }
  }
}
