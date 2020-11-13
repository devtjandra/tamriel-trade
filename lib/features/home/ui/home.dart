import 'package:TamrielTrade/features/autocomplete/ui/autocomplete.dart';
import 'package:TamrielTrade/features/filter/ui/filter.dart';
import 'package:TamrielTrade/features/home/bloc/home_bloc.dart';
import 'package:TamrielTrade/features/home/ui/home_list.dart';
import 'package:TamrielTrade/features/home/ui/home_search.dart';
import 'package:TamrielTrade/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Home extends StatelessWidget {
  final PanelController _filterController = PanelController();
  final PanelController _autocompleteController = PanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: ChangeNotifierProvider(
            create: (_) =>
                HomeBloc(context, _filterController, _autocompleteController),
            child: Stack(children: [
              SlidingUpPanel(
                controller: _filterController,
                minHeight: 0,
                maxHeight: 350,
                defaultPanelState: PanelState.CLOSED,
                panel: Filter(),
                borderRadius: BorderRadius.circular(30.0),
                body: SafeArea(
                  child: Scaffold(
                    body: _body(),
                  ),
                ),
              ),
              SlidingUpPanel(
                  controller: _autocompleteController,
                  minHeight: 0,
                  maxHeight: MediaQuery.of(context).size.height - 70,
                  defaultPanelState: PanelState.CLOSED,
                  panel: Autocomplete(),
                  borderRadius: BorderRadius.circular(30.0),
                  body: Container())
            ])));
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
