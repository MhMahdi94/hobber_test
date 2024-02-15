import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hobber_test/components/components.dart';
import 'package:hobber_test/cubit/cubit.dart';
import 'package:hobber_test/cubit/states.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController imgController = TextEditingController();
    return BlocConsumer<AppCubit, AppState>(
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Create User'),
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
                          cubit.postData(
                              email: emailController.text,
                              description: descriptionController.text,
                              title: titleController.text,
                              imgLink: imgController.text);
                        },
                        child: Text('Create'))
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
