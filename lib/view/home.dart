import 'package:countries/viewModel/home_view_model.dart';
import 'package:countries/widgets/countries_listView.dart';
import 'package:countries/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeViewModel>(context, listen: true);
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Expanded(flex: 1, child: SearchBar()),
          const Expanded(flex: 6, child: CountriesListView())
        ],
      ),
    ));
  }
}
