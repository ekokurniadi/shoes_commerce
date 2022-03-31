import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shamo/core/utility/shared_preferences_helper.dart';
import 'package:shamo/features/profile/data/models/user_model.dart';
import 'package:shamo/injection_container.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> getUserProfile() async {
    emit(ProfileOnProcess());
    final SharedPreferencesHelper _sharedPreferencesHelper =
        sl<SharedPreferencesHelper>();

    await _sharedPreferencesHelper.getUserPreferences().then((value) {
      Future.delayed(const Duration(seconds: 2), () {
        emit(ProfileSuccess(userModel: value));
      });
      return value;
    });
  }
}
