import 'package:TamrielTrade/features/home/bloc/home_bloc.dart';
import 'package:TamrielTrade/models/autocomplete_result.dart';
import 'package:TamrielTrade/values/values.dart';
import 'package:TamrielTrade/views/horizontal_line.dart';
import 'package:TamrielTrade/views/item_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultCard extends StatelessWidget {
  final AutocompleteResult result;

  ResultCard(this.result);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<HomeBloc>().setAutocomplete(result),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_item(), HorizontalLine()],
      ),
    );
  }

  Widget _item() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.padding16, vertical: Dimensions.padding8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ItemImage("/content/icons/${result.icon}"),
          Container(
            width: Dimensions.padding12,
          ),
          Expanded(
              child: Text(
            result.value,
          ))
        ],
      ),
    );
  }
}
