import 'package:TamrielTrade/features/home/bloc/home_bloc.dart';
import 'package:TamrielTrade/features/home/ui/home_list.dart';
import 'package:TamrielTrade/features/home/ui/home_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ChangeNotifierProvider(
      create: (_) => HomeBloc(context),
      child: Scaffold(
        body: _body(),
      ),
    ));
  }

  Widget _body() {
    return Column(
      children: [
        HomeSearch(),
        Expanded(
          child: HomeList(),
        )
      ],
    );
  }
}
