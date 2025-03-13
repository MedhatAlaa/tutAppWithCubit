import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_tut_app/presentation/forget_password/cubit/forget_password_cubit.dart';
import 'package:new_tut_app/presentation/forget_password/cubit/forget_password_state.dart';
import 'package:new_tut_app/presentation/resources/assets_manger.dart';
import 'package:new_tut_app/presentation/resources/color_manger.dart';
import 'package:new_tut_app/presentation/resources/string_manger.dart';
import 'package:new_tut_app/presentation/reuse_component/reuse.dart';

import '../../app/di.dart';
import '../resources/values_manger.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ForgetPasswordCubit(sl()),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordSuccessState) {
            showToast(state.message, ToastState.SUCCESS);
          } else if (state is ForgetPasswordErrorState) {
            showToast(state.message, ToastState.ERROR);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(AppPaddingManger.p12),
                  child: Form(
                    key: context.read<ForgetPasswordCubit>().formKey,
                    child: Column(
                      children: [
                        Image.asset(AssetsManger.splashLogo),
                        const SizedBox(
                          height: AppSizeManger.s60,
                        ),
                        TextFormFiledComponent(
                          textEditingController: context
                              .read<ForgetPasswordCubit>()
                              .forgetPasswordController,
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
                          height: AppSizeManger.s24,
                        ),
                        ConditionalBuilder(
                          condition: state is! ForgetPasswordLoadingState,
                          builder: (BuildContext context) => SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (context
                                    .read<ForgetPasswordCubit>()
                                    .formKey
                                    .currentState!
                                    .validate()) {
                                  context
                                      .read<ForgetPasswordCubit>()
                                      .forgetPassword();
                                }
                              },
                              child: const Text(
                                AppStringManger.resetPassword,
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
                          child: Text(AppStringManger.receiveEmail,
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
