import 'package:flutter/material.dart';
import 'package:watchlist_pro/domain/entity/stock_model.dart';

class Watchlist {
  final String id;
  final IconData icon;
  final List<Stock> stocks;

  Watchlist({
    required this.id,
    required this.icon,
    required this.stocks,
  });
}