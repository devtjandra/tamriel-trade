import 'package:TamrielTrade/features/filter/bloc/filter_bloc.dart';
import 'package:TamrielTrade/models/category.dart';
import 'package:TamrielTrade/values/values.dart';
import 'package:TamrielTrade/views/horizontal_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = context.watch<FilterBloc>().category;
    final subcategory = context.watch<FilterBloc>().subcategory;
    final subsubcategory = context.watch<FilterBloc>().subsubcategory;

    return Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.padding24),
        child: Column(children: [
          _button(category != null ? category.name : "All",
              () => _showCategories(context)),
          if (category != null && category.subcategories != null)
            _button(subcategory != null ? subcategory.name : "All",
                () => _showSubcategories(context)),
          if (subcategory != null && subcategory.subsubcategories != null)
            _button(subsubcategory != null ? subsubcategory.name : "All",
                () => _showSubsubcategories(context))
        ]));
  }

  Widget _button(String text, VoidCallback onClick) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.padding4),
        child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0))),
            color: Colors.black87,
            onPressed: onClick,
            child: Text(text, style: TextStyle(color: Colors.white))));
  }

  void _showCategories(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.panelRadius)),
              child: Container(
                  height: 300,
                  child: SingleChildScrollView(
                    child:
                        Column(children: _categories(context, dialogContext)),
                  )));
        });
  }

  void _showSubcategories(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.panelRadius)),
              child: Container(
                  height: 300,
                  child: SingleChildScrollView(
                    child: Column(
                        children: _subcategories(context, dialogContext)),
                  )));
        });
  }

  void _showSubsubcategories(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.panelRadius)),
              child: Container(
                  height: 300,
                  child: SingleChildScrollView(
                    child: Column(
                        children: _subsubcategories(context, dialogContext)),
                  )));
        });
  }

  List<Widget> _categories(BuildContext context, BuildContext dialogContext) {
    List<Category> categories = context.read<FilterBloc>().categories;
    List<Widget> widgets = List();

    widgets.add(Container(height: Dimensions.padding16));

    widgets.add(Text("Select Category",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)));

    widgets.add(Container(height: Dimensions.padding12));

    categories.forEach((element) => widgets.add(_option(element.name, () {
          context.read<FilterBloc>().setCategory(element);
          Navigator.pop(dialogContext);
        })));

    widgets.add(Container(height: Dimensions.padding16));

    return widgets;
  }

  List<Widget> _subcategories(
      BuildContext context, BuildContext dialogContext) {
    final category = context.read<FilterBloc>().category;
    List<Subcategory> categories = category.subcategories;
    List<Widget> widgets = List();

    widgets.add(Container(height: Dimensions.padding16));

    widgets.add(Text("Select ${category.name} Category",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)));

    widgets.add(Container(height: Dimensions.padding12));

    categories.forEach((element) => widgets.add(_option(element.name, () {
          context.read<FilterBloc>().setSubcategory(element);
          Navigator.pop(dialogContext);
        })));

    widgets.add(Container(height: Dimensions.padding16));

    return widgets;
  }

  List<Widget> _subsubcategories(
      BuildContext context, BuildContext dialogContext) {
    final subcategory = context.read<FilterBloc>().subcategory;
    List<Subsubcategory> categories = subcategory.subsubcategories;
    List<Widget> widgets = List();

    widgets.add(Container(height: Dimensions.padding16));

    widgets.add(Text("Select ${subcategory.name} Category",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)));

    widgets.add(Container(height: Dimensions.padding12));

    categories.forEach((element) => widgets.add(_option(element.name, () {
          context.read<FilterBloc>().setSubsubcategory(element);
          Navigator.pop(dialogContext);
        })));

    widgets.add(Container(height: Dimensions.padding16));

    return widgets;
  }

  Widget _option(String text, VoidCallback onClick) {
    return InkWell(
        onTap: onClick,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          HorizontalLine(),
          Padding(
              padding: EdgeInsets.all(Dimensions.padding12), child: Text(text))
        ]));
  }
}
