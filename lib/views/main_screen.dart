import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hobber_test/cubit/cubit.dart';
import 'package:hobber_test/cubit/states.dart';
import 'package:hobber_test/helpers/nav_helper.dart';
import 'package:hobber_test/models/get_data_model.dart';
import 'package:hobber_test/views/create_screen.dart';
import 'package:hobber_test/views/edit_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  GetDataModel getDataModel = GetDataModel(
      id: 1,
      email: 'test@email.com',
      description: 'desc',
      imgLink: 'img_link',
      title: 'title');

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    navigateTo(context, CreateScreen());
                  },
                  icon: Icon(Icons.add))
            ],
          ),
          body: cubit.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 32,
                            backgroundImage: NetworkImage(
                              cubit.dataList[index].imgLink!,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cubit.dataList[index].title ?? 'Null'),
                              Text(cubit.dataList[index].email ?? 'Null'),
                              Text(cubit.dataList[index].description ?? 'Null'),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              navigateTo(
                                  context,
                                  EditScreen(
                                      getDataModel: cubit.dataList[index]));
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.orangeAccent,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              cubit.deleteData(cubit.dataList[index].id);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: cubit.dataList.length),
        );
      },
      listener: (context, state) {
        if (state is AppDeleteDataSuccessState) {
          Navigator.pop(context);
          var snackBar = SnackBar(
            content: Text('${AppCubit.get(context).postDataModel!.message}'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }

        if (state is AppUpdateDataSuccessState) {
          Navigator.pop(context);
          var snackBar = SnackBar(
            content: Text('${AppCubit.get(context).postDataModel!.message}'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
    );
  }
}
