import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_list/features/domain/entities/home_entities.dart';

import '../../../../../core/error/failures.dart';
import '../../../../domain/usecases/get_product_list_usecase.dart';
import '../../../widgets/flutter_toast.dart';

part 'product_list_event.dart';

part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final GetProductListUseCase getProductListUseCase;

  ProductListBloc({required this.getProductListUseCase}) : super(ProductListStateInitial()) {
    on<ProductListEventInitial>(_initial);
  }

  void _initial(ProductListEventInitial event, emit) async{
    try {
      emit(ProductListStateLoading());
      final response = await getProductListUseCase.call();
      response.fold((failure) {
        debugger();
        print("failure:$failure");
        emit(ProductListStateError(failure: failure));
      }, (response) {
        print("Success getting product list: ${response.message}");
        emit(ProductListStateLoaded(response: response));
      });
    } catch (e) {
      print(e);
      toastInfo(msg: e.toString());
    }
  }
}
