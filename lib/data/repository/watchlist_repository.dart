import 'package:watchlist_pro/domain/entity/watchlist_model.dart';

abstract class WatchlistRepository {
  Watchlist getWatchlist(String watchlistId);
  List<Watchlist> getWatchlistCollection();
}