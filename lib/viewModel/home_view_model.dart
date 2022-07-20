import 'package:countries/model/countriesResponse.dart';
import 'package:countries/model/country.dart';
import 'package:countries/services/countries_api.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel extends ChangeNotifier {
  List<Country> _countryList = [];
  bool _isLoading = false;
  String _filteredCountry = "";

  get countryList => _countryList;
  get isLoading => _isLoading;
  get filteredCountry => _filteredCountry;

  setCountryList(List<Country> list) {
    _countryList = list;
    notifyListeners();
  }

  setFilteredCountry(String country) {
    _filteredCountry = country;
    notifyListeners();
  }

  setIsLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  HomeViewModel() {
    getCountries();
  }

  getCountries() async {
    setIsLoading(true);
    var response = await CountriesAPi.getCountries() as countries;
    if (response.error == false) {
      setCountryList(response.data!);
    }
    setIsLoading(false);
  }
}
