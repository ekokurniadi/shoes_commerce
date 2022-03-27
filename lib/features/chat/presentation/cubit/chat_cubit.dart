import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shamo/features/chat/data/models/list_chat_model.dart';
import 'package:shamo/features/chat/domain/usecases/get_list_message.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final GetListMessage getListMessage;
  ChatCubit({required this.getListMessage}) : super(ChatInitial());

  Future<void> getList() async {
    emit(ChatLoadingState());

    final result = await getListMessage();
    Future.delayed(const Duration(seconds: 2), () {
      result.fold((failed) => emit(ChatErrorState()),
          (response) => emit(GetListMessageState(listChatModel: response)));
    });
  }
}
