import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../product/presentation/cubit/popular_product/popular_product_cubit.dart';
import '../product/presentation/cubit/product_cubit/product_cubit.dart';

export './presentation/cubit/category_cubit.dart';

import '../../core/error/failures.dart';
import '../../core/core.dart';
import 'presentation/cubit/category_cubit.dart';

part './data/models/category_model.dart';
part './data/models/list_category_model.dart';
part './data/repositories/category_repositories_impl.dart';
part './data/resources/category_remote_datasource.dart';
part './data/resources/category_remote_datasource_impl.dart';
part './data/resources/category_local_datasource.dart';
part './data/resources/category_local_datasource_impl.dart';
part './domain/entity/category_entity.dart';
part './domain/usecases/get_categories_usecases.dart';
part './domain/repositories/category_repositories.dart';
part './presentation/pages/categories.dart';
part './presentation/widgets/category_item.dart';
part './presentation/widgets/category_item_shimmer.dart';
part './presentation/widgets/category_shimmer.dart';
