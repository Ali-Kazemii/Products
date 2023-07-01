import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_list/features/domain/entities/product_detail_entities.dart';
import 'package:product_list/global.dart';

import '../../../../../core/error/failures.dart';
import '../../../../domain/usecases/get_product_detail_usecase.dart';
import '../../../widgets/flutter_toast.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final GetProductDetailUseCase getProductDetailUseCase;

  ProductDetailBloc({required this.getProductDetailUseCase})
      : super(ProductDetailStateInitial(id:Global.storageService.getProductId())) {
    on<ProductDetailEventInitial>(_init);
    on<GetProductDetailEvent>(_getProductDetail);
  }

  void _init(ProductDetailEventInitial event, emit) async {
    try {
      emit(ProductDetailStateLoading());
      final response = await getProductDetailUseCase
          .call(ProductDetailRequestEntity(id: Global.storageService.getProductId()));
      response.fold((failure) {
        debugger();
        emit(ProductDetailStateError(failure: failure));
      }, (response) {
        emit(ProductDetailStateLoaded(response: response));
      });
    } catch (e) {
      print(e);
      toastInfo(msg: e.toString());
    }
  }

  void _getProductDetail(GetProductDetailEvent event, emit) async {
    try {
      emit(ProductDetailStateLoading());
      final response = await getProductDetailUseCase
          .call(ProductDetailRequestEntity(id: Global.storageService.getProductId()));
      response.fold((failure) {
        debugger();
        emit(ProductDetailStateError(failure: failure));
      }, (response) {
        emit(ProductDetailStateLoaded(response: response));
      });
    } catch (e) {
      print(e);
      toastInfo(msg: e.toString());
    }
  }
}
