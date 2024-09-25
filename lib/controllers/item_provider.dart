import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../services/api_service.dart';

class ItemProvider extends ChangeNotifier {
  List<Item> _items = [];
  bool _isLoading = false;
  bool _hasError = false;
  bool _isDarkMode = false;

  List<Item> get items => _items;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  Future<void> fetchItems() async {
    _isLoading = true;
    _hasError = false;
    notifyListeners();
    try {
      _items = await ApiService.fetchItems();
    } catch (e) {
      _hasError = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
