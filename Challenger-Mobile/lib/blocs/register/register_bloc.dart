import 'package:challenger_api_front/blocs/register/register_event.dart';
import 'package:challenger_api_front/blocs/register/register_state.dart';
import 'package:challenger_api_front/models/dto/register_dto.dart';
import 'package:challenger_api_front/repositories/auth/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository authRepository;

  RegisterBloc(this.authRepository) : super(RegisterInitial()) {
    on<DoRegisterEvent>(_doRegister);
  }

  void _doRegister(DoRegisterEvent event, Emitter<RegisterState> emit) async {
    emit(DoRegisterLoading());

    try {
      final RegisterDto registerDto = RegisterDto(
          username: event.username,
          email: event.email,
          avatar: event.avatar,
          password: event.password,
          verifyPassword: event.verifyPassword);
      final response = await authRepository.register(registerDto);
      emit(DoRegisterSuccess(response));
      return;
    } on Exception catch (e) {
      emit(DoRegisterError(e.toString()));
    }
  }
}
