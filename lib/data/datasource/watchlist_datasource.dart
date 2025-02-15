import 'package:flutter/material.dart';
import 'package:watchlist_pro/domain/entity/stock_model.dart';
import 'package:watchlist_pro/domain/entity/watchlist_model.dart';

class WatchlistDatasource {
  List<Watchlist> getWatchlists() {
    return [
      Watchlist(
        id: '1',
        icon: Icons.star,
        stocks: [
          Stock(
              id: '1',
              name: 'NATIONALUM',
              rate: '193.70',
              incrementpercent: '82 @ 193.71',
              decrementpercent: '30 @ 193.74',
              rateincreasedecrease: '+4.02 (2.11%)'),
          Stock(
              id: '2',
              name: 'WIPRO',
              rate: '310.15',
              incrementpercent: '164 @ 310.15',
              decrementpercent: '954 @ 310.20',
              rateincreasedecrease: '+0.05 (0.01%)'),
          Stock(
              id: '3',
              name: 'UPL',
              rate: '637.95',
              incrementpercent: '81 @ 638.00',
              decrementpercent: '87 @ 638.10',
              rateincreasedecrease: '+17.45 (2.81%)'),
          Stock(
              id: '4',
              name: 'ULTRACEMCO',
              rate: '11621.15',
              incrementpercent: '3 @ 11621.15',
              decrementpercent: '9 @ 11625.00',
              rateincreasedecrease: '+143.00 (1.24%)'),
          Stock(
              id: '5',
              name: 'TITAN',
              rate: '3264.05',
              incrementpercent: '84 @ 3264.05',
              decrementpercent: '34 @ 3264.20',
              rateincreasedecrease: '+8.60 (0.26%)'),
          Stock(
              id: '6',
              name: 'TECHM',
              rate: '1680.15',
              incrementpercent: '24 @ 1686.55',
              decrementpercent: '50 @ 1686.60',
              rateincreasedecrease: '+6.40 (0.38%)'),
          Stock(
              id: '7',
              name: 'TCS',
              rate: '3934.15',
              incrementpercent: '12 @ 3934.15',
              decrementpercent: '13 @ 3934.70',
              rateincreasedecrease: '+8.51 (0.20%)'),
        ],
      ),
      Watchlist(
        id: '2',
        icon: Icons.sunny,
        stocks: [
         Stock(
              id: '1',
              name: 'NATIONALUM',
              rate: '193.70',
              incrementpercent: '82 @ 193.71',
              decrementpercent: '30 @ 193.74',
              rateincreasedecrease: '+4.02 (2.11%)'),
          Stock(
              id: '2',
              name: 'WIPRO',
              rate: '310.15',
              incrementpercent: '164 @ 310.15',
              decrementpercent: '954 @ 310.20',
              rateincreasedecrease: '+0.05 (0.01%)'),
          Stock(
              id: '3',
              name: 'UPL',
              rate: '637.95',
              incrementpercent: '81 @ 638.00',
              decrementpercent: '87 @ 638.10',
              rateincreasedecrease: '+17.45 (2.81%)'),
        ],
      ),
    ];
  }
}
