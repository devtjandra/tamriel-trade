import 'package:TamrielTrade/common/types.dart';
import 'package:TamrielTrade/features/platform_selector/bloc/platorm_selector_bloc.dart';
import 'package:TamrielTrade/values/values.dart';
import 'package:TamrielTrade/views/radio_row.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class PlatformSelectorBody extends StatelessWidget {
  final regionOptions = [Region.northAmerica, Region.europe];
  final consoleOptions = [Console.pc, Console.ps, Console.xbox];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Container(
                height: Dimensions.padding24,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.padding24),
                alignment: Alignment.centerLeft,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text("Platform Options",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0)),
                      ),
                      _select(context),
                    ]),
              ),
              Container(
                height: Dimensions.padding24,
              ),
              RadioRow(
                  options: regionOptions,
                  selectedOption: context.watch<PlatformSelectorBloc>().region,
                  onSelect: (value) =>
                      context.read<PlatformSelectorBloc>().setRegion(value)),
              Container(
                height: Dimensions.padding12,
              ),
              RadioRow(
                  options: consoleOptions,
                  selectedOption: context.watch<PlatformSelectorBloc>().console,
                  onSelect: (value) =>
                      context.read<PlatformSelectorBloc>().setConsole(value)),
              Container(
                height: Dimensions.padding24,
              ),
            ])));
  }

  Widget _select(BuildContext context) {
    return RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0))),
        color: Colors.black87,
        onPressed: () => context.read<PlatformSelectorBloc>().finish(),
        child: Text("Select", style: TextStyle(color: Colors.white)));
  }
}
