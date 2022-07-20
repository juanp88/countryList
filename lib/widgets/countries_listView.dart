import 'package:countries/model/countriesResponse.dart';
import 'package:countries/model/country.dart';
import 'package:countries/viewModel/home_view_model.dart';
import 'package:countries/widgets/country_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountriesListView extends StatelessWidget {
  const CountriesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeViewModel>(context, listen: true);
    List<Country> countriesList = homeProvider.countryList;
    if (homeProvider.filteredCountry != '') {
      countriesList = countriesList
          .where((country) => country.name!
              .toLowerCase()
              .contains(homeProvider.filteredCountry.toString().toLowerCase()))
          .toList();
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: countriesList.length,
          itemBuilder: ((context, index) {
            Country country = countriesList[index];
            // implementar country tile
            return CountryTile(
                name: country.name.toString(),
                capital: country.capital.toString());
          })),
    );
  }
}
