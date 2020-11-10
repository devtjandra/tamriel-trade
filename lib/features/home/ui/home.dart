import 'package:TamrielTrade/features/filter/ui/filter.dart';
import 'package:TamrielTrade/features/home/bloc/home_bloc.dart';
import 'package:TamrielTrade/features/home/ui/home_list.dart';
import 'package:TamrielTrade/features/home/ui/home_search.dart';
import 'package:TamrielTrade/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Home extends StatelessWidget {
  final PanelController _controller = PanelController();

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
        controller: _controller,
        minHeight: 0,
        maxHeight: 300,
        defaultPanelState: PanelState.CLOSED,
        panel: Filter(),
        borderRadius: BorderRadius.circular(30.0),
        body: SafeArea(
          child: ChangeNotifierProvider(
            create: (_) => HomeBloc(context, _controller),
            child: Scaffold(
              body: _body(),
            ),
          ),
        ));
  }

  Widget _body() {
    return Column(
      children: [
        HomeSearch(),
        Expanded(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [HomeList(), _shadow()],
          ),
        )
      ],
    );
  }

  Widget _shadow() {
    return Container(
        height: Dimensions.padding12,
        width: double.infinity,
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0x1a000000),
            const Color(0x00ffffff),
          ],
        )));
  }
}
