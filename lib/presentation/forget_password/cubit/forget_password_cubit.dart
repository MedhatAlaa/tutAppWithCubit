import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_tut_app/domain/usecase/forget_password_usecase.dart';
import 'package:new_tut_app/presentation/forget_password/cubit/forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this._forgetPasswordUseCase)
      : super(InitialForgetPasswordState());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  final ForgetPasswordUseCase _forgetPasswordUseCase;
  TextEditingController forgetPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void forgetPassword() async {
    emit(ForgetPasswordLoadingState());
    final response =
        await _forgetPasswordUseCase.execute(forgetPasswordController.text);

    response.fold((failure) {
      emit(ForgetPasswordErrorState(failure.message));
    }, (data) {
      print('forget password data is $data');
      emit(ForgetPasswordSuccessState(data));
    });
  }
}
