import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../chat.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final GetListMessage getListMessage;
  ChatCubit({required this.getListMessage}) : super(ChatInitial());

  Future<void> getList() async {
    emit(ChatLoadingState());

    final result = await getListMessage();
    Future.delayed(const Duration(seconds: 1), () {
      result.fold((failed) => emit(ChatErrorState()),
          (response) => emit(GetListMessageState(listChatModel: response)));
    });
  }
}
