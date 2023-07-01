import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/features/presesntation/pages/productdetail/bloc/product_detail_bloc.dart';
import 'package:product_list/features/presesntation/pages/productdetail/widget/product_detail_widget.dart';

import '../../widgets/flutter_toast.dart';
import '../../widgets/loading_widget.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  @override
  void initState() {
    BlocProvider.of<ProductDetailBloc>(context).add(GetProductDetailEvent());
    super.initState();
  }

  @override
  void dispose() {
    BlocProvider.of<ProductDetailBloc>(context).close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
       Navigator.of(context).pop();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
            builder: (context, state) {
          if (state is ProductDetailStateInitial) {
            return buildLoading();
          } else if (state is ProductDetailStateLoading) {
            return buildLoading();
          } else if (state is ProductDetailStateLoaded) {
            return buildProductDetail(
                context: context, response: state.response);
          } else if (state is ProductDetailStateError) {
            toastInfo(msg: state.failure.getMessage().toString());
            return const Center(
                child: Text(
              "Error loading data.. please try again",
              style: TextStyle(color: Colors.redAccent),
            ));
          }
          return Container();
        }),
      ),
    );
  }
}
