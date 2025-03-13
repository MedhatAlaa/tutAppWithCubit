import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_tut_app/presentation/register/cubit/register_cubit.dart';
import 'package:new_tut_app/presentation/register/cubit/register_state.dart';

import '../../app/di.dart';
import '../resources/assets_manger.dart';
import '../resources/color_manger.dart';
import '../resources/string_manger.dart';
import '../resources/values_manger.dart';
import '../reuse_component/reuse.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(sl()),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {},
        builder: (context, state) {
          var registerCubit = RegisterCubit.get(context);
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(AppPaddingManger.p12),
                  child: Form(
                    key: registerCubit.formState,
                    child: Column(
                      children: [
                        Image.asset(AssetsManger.splashLogo),
                        const SizedBox(
                          height: AppSizeManger.s40,
                        ),
                        TextFormFiledComponent(
                          textEditingController: registerCubit.nameController,
                          textInputType: TextInputType.name,
                          labelText: AppStringManger.name,
                          hintText: AppStringManger.name,
                          textStyleColor: ColorManger.white,
                          cursorColor: ColorManger.primary,
                          validate: (name) {
                            if (name!.isEmpty) {
                              return AppStringManger.nameHint;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: AppSizeManger.s14,
                        ),
                        TextFormFiledComponent(
                          textEditingController: registerCubit.mobileController,
                          textInputType: TextInputType.number,
                          labelText: AppStringManger.mobileNumber,
                          hintText: AppStringManger.mobileNumber,
                          textStyleColor: ColorManger.white,
                          cursorColor: ColorManger.primary,
                          validate: (mobileNumber) {
                            if (mobileNumber!.length <= 8) {
                              return AppStringManger.mobileNumberHint;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: AppSizeManger.s14,
                        ),
                        TextFormFiledComponent(
                          textEditingController: registerCubit.emailController,
                          textInputType: TextInputType.emailAddress,
                          labelText: AppStringManger.email,
                          hintText: AppStringManger.email,
                          textStyleColor: ColorManger.white,
                          cursorColor: ColorManger.primary,
                          validate: (email) {
                            if (!email!
                                .contains(AppStringManger.emailCondition)) {
                              return AppStringManger.emailHint;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: AppSizeManger.s14,
                        ),
                        TextFormFiledComponent(
                          textEditingController:
                              registerCubit.passwordController,
                          textInputType: TextInputType.visiblePassword,
                          labelText: AppStringManger.password,
                          hintText: AppStringManger.password,
                          textStyleColor: ColorManger.white,
                          cursorColor: ColorManger.primary,
                          validate: (password) {
                            if (password!.length < 4) {
                              return AppStringManger.passwordHint;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: AppSizeManger.s24,
                        ),
                        ConditionalBuilder(
                          condition: state is! RegisterLoadingState,
                          builder: (BuildContext context) => SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (registerCubit.formState.currentState!
                                    .validate()) {
                                  registerCubit.register();
                                }
                              },
                              child: const Text(
                                AppStringManger.registerButton,
                              ),
                            ),
                          ),
                          fallback: (BuildContext context) => Center(
                            child: CircularProgressIndicator(
                              color: ColorManger.primary,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(AppStringManger.alreadyRegister,
                              style: Theme.of(context).textTheme.bodySmall),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
