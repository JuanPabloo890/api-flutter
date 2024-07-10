import 'package:flutter/material.dart';
import '../models/chuck_norris_joke.dart';
import '../services/chuck_norris_service.dart';

class ChuckNorrisProvider with ChangeNotifier {
  ChuckNorrisJoke? _joke;
  bool _isLoading = false;

  ChuckNorrisJoke? get joke => _joke;
  bool get isLoading => _isLoading;

  final ChuckNorrisService _service = ChuckNorrisService();

  Future<void> fetchJoke() async {
    _isLoading = true;
    notifyListeners();

    try {
      _joke = await _service.fetchJoke();
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
