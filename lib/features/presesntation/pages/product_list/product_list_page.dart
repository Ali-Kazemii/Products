import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/features/presesntation/pages/product_list/widget/product_list_widget.dart';
import 'package:product_list/features/presesntation/widgets/flutter_toast.dart';

import '../../widgets/loading_widget.dart';
import 'bloc/product_list_bloc.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: BlocBuilder<ProductListBloc, ProductListState>(builder: (context, state) {
          if (state is ProductListEventInitial) {
            return buildLoading();
          } else if (state is ProductListStateLoading) {
            return buildLoading();
          } else if (state is ProductListStateLoaded) {
            return buildProductList(context: context, list:state.response);
          } else if (state is ProductListStateError) {
            toastInfo(msg: state.failure.getMessage().toString());
            return const Center(child: Text("Error loading data.. please try again", style: TextStyle(color: Colors.redAccent),));
          }
          return Container();
        })
    );
  }
}


