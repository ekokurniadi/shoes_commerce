export './presentation/cubit/chat_cubit.dart';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/core.dart';
import '../../core/error/failures.dart';
import 'data/resources/chat_data.dart';
import 'presentation/cubit/chat_cubit.dart';
import '../home/presentation/cubit/bottom_navigation_cubit.dart';

part './data/models/chat_model.dart';
part './data/models/list_chat_model.dart';
part './data/repositories/chat_repositories_impl.dart';
part './data/resources/chat_local_data_source.dart';
part './data/resources/chat_local_data_source_impl.dart';
part './domain/entity/chat_entity.dart';
part './domain/repositories/chat_repositories.dart';
part './domain/usecases/get_list_message.dart';
part './presentation/pages/chat.dart';
part './presentation/pages/detail_chat.dart';
part 'presentation/widgets/chat_card.dart';
part 'presentation/widgets/chat_list.dart';
part './presentation/widgets/empty_chat.dart';
part './presentation/widgets/chat_bubble.dart';
