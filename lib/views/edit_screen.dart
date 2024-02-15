import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hobber_test/components/components.dart';
import 'package:hobber_test/cubit/cubit.dart';
import 'package:hobber_test/cubit/states.dart';
import 'package:hobber_test/models/get_data_model.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({
    super.key,
    required this.getDataModel,
  });
  final GetDataModel? getDataModel;
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: getDataModel!.title);
    TextEditingController emailController =
        TextEditingController(text: getDataModel!.email);
    TextEditingController descriptionController =
        TextEditingController(text: getDataModel!.description);
    TextEditingController imgController =
        TextEditingController(text: getDataModel!.imgLink);
    return BlocConsumer<AppCubit, AppState>(
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Edit User'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                AppTextFormField(
                  onChanged: (p0) {},
                  validator: (p0) {},
                  controller: titleController,
                  labelEn: 'Title',
                ),
                SizedBox(
                  height: 8,
                ),
                AppTextFormField(
                  onChanged: (p0) {},
                  validator: (p0) {},
                  controller: emailController,
                  labelEn: 'Email',
                ),
                SizedBox(
                  height: 8,
                ),
                AppTextFormField(
                  onChanged: (p0) {},
                  validator: (p0) {},
                  controller: descriptionController,
                  labelEn: 'Description',
                ),
                SizedBox(
                  height: 8,
                ),
                AppTextFormField(
                  onChanged: (p0) {},
                  validator: (p0) {},
                  controller: imgController,
                  labelEn: 'Image',
                ),
                SizedBox(
                  height: 20,
                ),
                cubit.loading
                    ? Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        onPressed: () {
                          cubit.updateData(
                              email: emailController.text,
                              description: descriptionController.text,
                              title: titleController.text,
                              imgLink: imgController.text,
                              id: getDataModel!.id);
                        },
                        child: Text('Update'))
              ],
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is AppPostDataSuccessState) {
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
