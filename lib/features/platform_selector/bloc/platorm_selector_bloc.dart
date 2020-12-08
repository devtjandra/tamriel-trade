import 'package:TamrielTrade/common/types.dart';
import 'package:TamrielTrade/features/home/bloc/home_bloc.dart';
import 'package:TamrielTrade/models/platform_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlatformSelectorBloc extends ChangeNotifier {
  final BuildContext _context;

  String region = Region.northAmerica;
  String console = Console.pc;

  PlatformSelectorBloc(this._context);

  void setRegion(String value) {
    region = value;
    notifyListeners();
  }

  void setConsole(String value) {
    console = value;
    notifyListeners();
  }

  void finish() {
    _context
        .read<HomeBloc>()
        .setPlatformOptions(PlatformOptions(region: region, console: console));
  }
}
