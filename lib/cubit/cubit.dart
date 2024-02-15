import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hobber_test/cubit/states.dart';
import 'package:hobber_test/models/get_data_model.dart';
import 'package:hobber_test/models/post_data_model.dart';
import 'package:hobber_test/repository/data_repo.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  bool loading = false;
  List<GetDataModel> dataList = [];
  getData() async {
    dataList = [];
    try {
      //print('object');
      loading = true;
      emit(AppGetDataLoadingState());
      List values = await DataRepo.getData();
      print('values: $values');
      values.forEach((element) {
        dataList.add(
          GetDataModel(
            id: element['id'],
            description: element['description'],
            email: element['email'],
            title: element['title'],
            imgLink: element['img_link'],
          ),
        );
      });
      print(dataList.length);
      loading = false;
      emit(AppGetDataSuccessState());
    } catch (e) {
      print(e);
      loading = false;
      emit(AppGetDataFailureState());
    }
  }

  PostDataModel? postDataModel;
  postData(
      {required email,
      required description,
      required title,
      required imgLink}) async {
    try {
      //print('object');
      loading = true;
      emit(AppPostDataLoadingState());
      List value = await DataRepo.postData({
        'email': email,
        'description': description,
        'title': title,
        'img_link': imgLink,
      });
      postDataModel = PostDataModel(message: value[0]['message']);
      loading = false;
      emit(AppPostDataSuccessState());
      getData();
    } catch (e) {
      print(e);
      loading = false;
      emit(AppPostDataFailureState());
    }
    DataRepo.postData({
      'email': email,
      'description': description,
      'title': title,
      'img_link': imgLink
    });
  }

  PostDataModel? deleteDataModel;
  deleteData(id) async {
    try {
      //print('object');
      loading = true;
      emit(AppDeleteDataLoadingState());
      List value = await DataRepo.deleteData('$id');
      deleteDataModel = PostDataModel(message: value[0]['message']);
      loading = false;
      print(dataList.length);
      loading = false;
      emit(AppDeleteDataSuccessState());
    } catch (e) {
      print(e);
      loading = false;
      emit(AppDeleteDataFailureState());
    }
    getData();
  }

  PostDataModel? updateDataModel;
  updateData(
      {required email,
      required description,
      required title,
      required imgLink,
      required id}) async {
    print([email, description, title, imgLink, id]);
    //return;
    try {
      //print('object');
      loading = true;
      emit(AppUpdateDataLoadingState());
      List value = await DataRepo.updateData({
        'email': email,
        'description': description,
        'title': title,
        'img_link': imgLink
      }, '$id');
      updateDataModel = PostDataModel(message: value[0]['message']);
      loading = false;
      print(dataList.length);
      loading = false;
      emit(AppUpdateDataSuccessState());
    } catch (e) {
      print(e);
      loading = false;
      emit(AppUpdateDataFailureState());
    }
    getData();
  }
}
