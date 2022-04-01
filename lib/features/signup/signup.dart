import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shamo/injection_container.dart';
import 'presentation/cubit/signup_cubit.dart';

import '../../core/core.dart';
import '../../core/error/failures.dart';

import '../profile/data/models/user_model.dart';
export './presentation/cubit/signup_cubit.dart';

part './data/repositories/signup_repositories_impl.dart';
part './data/resources/signup_remote_datasource.dart';
part './data/resources/signup_remote_datasource_impl.dart';
part './domain/repositories/signup_repositories.dart';
part './domain/usecase/signup_usecase.dart';
part './presentation/pages/signup_page.dart';
