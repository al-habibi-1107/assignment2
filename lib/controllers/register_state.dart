import 'package:assignment2/models/user_model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class RegisterCubit extends HydratedCubit<UserModel?> {
  RegisterCubit(UserModel? u) : super(u);

  Future<void> register(UserModel usr) async {
    await HydratedBloc.storage.clear();
    await HydratedBloc.storage.write('usr', usr.toJson());
    emit(usr);
  }

  void logout() => emit(null);

  @override
  UserModel fromJson(Map<String, dynamic> json) => UserModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(UserModel? state) {
    if (state == null) return {};
    return state.toJson();
  }
}
