import 'dart:core';

export './presentation/cubit/product_cubit/product_cubit.dart';
export './presentation/cubit/popular_product/popular_product_cubit.dart';
import 'package:dartz/dartz.dart';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shamo/features/product/presentation/cubit/popular_product/popular_product_cubit.dart';
import 'package:shamo/features/product/presentation/cubit/product_cubit/product_cubit.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/core.dart';
import '../../core/error/failures.dart';
import '../category/category.dart';
import '../galery/galery.dart';

part './data/models/list_product_model.dart';
part './data/models/product_model.dart';
part './data/resources/product_remote_datasource.dart';
part './data/resources/product_remote_datasource_impl.dart';
part './data/repositories/product_repositories_impl.dart';
part './domain/entity/product_entity.dart';
part './domain/repositories/product_repositories.dart';
part './domain/usecase/get_product_usecase.dart';
part './domain/usecase/get_popular_product_usecase.dart';
part 'presentation/pages/arrival_product.dart';
part 'presentation/pages/popular_product.dart';
part 'presentation/widget/popular_product_shimmer.dart';
part 'presentation/widget/arrival_product_shimmer.dart';
part 'presentation/widget/empty_product.dart';
