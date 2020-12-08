import 'package:TamrielTrade/features/platform_selector/bloc/platorm_selector_bloc.dart';
import 'package:TamrielTrade/features/platform_selector/ui/platform_selector_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlatformSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PlatformSelectorBloc(context),
      child: PlatformSelectorBody(),
    );
  }
}
