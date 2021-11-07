import 'package:assignment2/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class LoginCubit extends Cubit<UserModel?> {
  LoginCubit() : super(null);

  Future<bool> login(String uName, pass) async {
    var usr = await HydratedBloc.storage.read('usr');
    UserModel usrmod = UserModel.fromJson(usr);
    if (usrmod.username == uName && usrmod.password == pass) {
      return true;
    }
    return false;
  }
}
