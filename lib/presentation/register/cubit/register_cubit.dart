import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_tut_app/domain/usecase/register_usecase.dart';
import 'package:new_tut_app/presentation/register/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._registerUseCase) : super(InitialRegisterState());

  final RegisterUseCase _registerUseCase;

  static RegisterCubit get(context) => BlocProvider.of(context);

  var nameController = TextEditingController();
  var mobileController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formState = GlobalKey<FormState>();

  void register() async {
    emit(RegisterLoadingState());
    final response = await _registerUseCase.execute(
        RegisterUseCaseInput(
          nameController.text,
          '+966',
          mobileController.text,
          emailController.text,
          passwordController.text,
          '',)
    );

    response.fold((failure) =>{
    emit(RegisterErrorState()),
    }, (data) => {
      print(data.customer!.name),
      emit(RegisterSuccessState()),
        });
  }
}
