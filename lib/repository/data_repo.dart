import 'dart:convert';

import 'package:hobber_test/helpers/dio_helper.dart';
import 'package:hobber_test/helpers/endpoints.dart';
import 'package:hobber_test/models/get_data_model.dart';

class DataRepo {
  //List<GetDataModel>
  static getData() async {
    var resp = await DioHelper.getData(url: GET_DATA);
    final List responseData = resp.data;
    print('responseData:$responseData');
    return responseData;
    // .then((value) {
    //   //print(value.data);
    //   final List responseData = value.data;
    //   //print('responseData: ${responseData[0]}');
    //   return responseData;
    // }).catchError((error) {
    //   return error;
    // });
  }

  static postData(Map<String, dynamic> data) async {
    var resp = await DioHelper.postData(url: POST_DATA, data: data);
    final List responseData = resp.data;
    return responseData;
  }

  static deleteData(String id) async {
    var resp = await DioHelper.getData(url: '$DELETE_DATA&id=$id');
    final List responseData = resp.data;
    return responseData;
  }

  static updateData(Map<String, dynamic> data, String id) async {
    var resp = await DioHelper.getData(
        url:
            '$EDIT_DATA&id=$id&title=${data['title']}&description=${data['description']}&img_link=${data['img_link']}');
    final List responseData = resp.data;
    return responseData;
  }
}
