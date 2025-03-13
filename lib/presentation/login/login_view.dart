import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_tut_app/app/app_pref.dart';
import 'package:new_tut_app/presentation/login/cubit/login_cubit.dart';
import 'package:new_tut_app/presentation/resources/assets_manger.dart';
import 'package:new_tut_app/presentation/resources/color_manger.dart';
import 'package:new_tut_app/presentation/resources/values_manger.dart';
import 'package:new_tut_app/presentation/reuse_component/reuse.dart';
import '../../app/di.dart';
import '../resources/rouets_manger.dart';
import '../resources/string_manger.dart';
import 'cubit/login_state.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    AppPreferences appPreferences = AppPreferences(sl());
    return BlocProvider<LoginCubit>(
      create: (BuildContext context) => LoginCubit(sl()),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            appPreferences.setUserLoggedIn();
            Navigator.pushReplacementNamed(context, Routes.homeRoute);
          } else if (state is LoginErrorState) {
            showToast(state.message, ToastState.ERROR);
          }
        },
        builder: (BuildContext context, state) {
          var loginCubit = LoginCubit.get(context);
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(AppPaddingManger.p12),
                  child: Form(
                    key: loginCubit.formKey,
                    child: Column(
                      children: [
                        Image.asset(AssetsManger.splashLogo),
                        const SizedBox(
                          height: AppSizeManger.s60,
                        ),
                        TextFormFiledComponent(
                          textEditingController: loginCubit.emailController,
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
                          height: AppSizeManger.s20,
                        ),
                        TextFormFiledComponent(
                          textEditingController: loginCubit.passwordController,
                          textInputType: TextInputType.visiblePassword,
                          labelText: AppStringManger.password,
                          hintText: AppStringManger.password,
                          cursorColor: ColorManger.primary,
                          textStyleColor: ColorManger.white,
                          obscureText: loginCubit.isPassword,
                          suffixIcon: IconButton(
                            onPressed: () {
                              loginCubit.changeSuffixIcon();
                            },
                            icon: Icon(
                              loginCubit.suffixIcon,
                              color: loginCubit.iconColor,
                            ),
                          ),
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
                          condition: state is! LoginLoadingState,
                          builder: (BuildContext context) => SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (loginCubit.formKey.currentState!
                                    .validate()) {
                                  loginCubit.login();
                                }
                              },
                              child: const Text(
                                AppStringManger.login,
                              ),
                            ),
                          ),
                          fallback: (BuildContext context) => Center(
                            child: CircularProgressIndicator(
                              color: ColorManger.primary,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSizeManger.s12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Routes.forgetPasswordRoute);
                                },
                                child: Text(
                                  AppStringManger.forgetPassword,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Routes.registerRoute);
                                },
                                child: Text(
                                  AppStringManger.register,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                            ),
                          ],
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
