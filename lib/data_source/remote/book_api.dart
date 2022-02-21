import 'package:quran_widget_flutter/model/apis_response/my_response.dart';
import 'package:quran_widget_flutter/model/book.dart';
import 'package:quran_widget_flutter/network_helper/apis.dart';
import 'package:quran_widget_flutter/network_helper/dio_utils.dart';

class BookApi{

  Future<MyResponse<Book>> fetchBooksList() async {
    var response = await DioUtils.request(DioUtils.REQUEST_GET, Apis.FETCH_ALL_BOOKS);
    if (response.statusCode == 200) {
      return MyResponse<Book>.fromJson(response.data,Apis.LIST);
    } else {
      return MyResponse<Book>.init(Apis.CODE_ERROR, null, null);
    }
  }

  Future<MyResponse<Book>> fetchBookById(int bookId) async {
    var response = await DioUtils.request(DioUtils.REQUEST_GET, "${Apis.FETCH_ALL_BOOKS}$bookId");
    if (response.statusCode == 200) {
      return MyResponse<Book>.fromJson(response.data,Apis.SINGLE);
    } else {
      return MyResponse<Book>.init(Apis.CODE_ERROR, null, null);
    }
  }

}