import 'package:watchlist_pro/data/datasource/watchlist_datasource.dart';
import 'package:watchlist_pro/data/repository/watchlist_repository.dart';
import 'package:watchlist_pro/domain/entity/watchlist_model.dart';

class WatchlistRepositoryImplementation implements WatchlistRepository {
  final WatchlistDatasource watchlistDatasource;

  WatchlistRepositoryImplementation({required this.watchlistDatasource});

  @override
  Watchlist getWatchlist(String watchlistId) {
    return watchlistDatasource
        .getWatchlists()
        .firstWhere((watchlist) => watchlist.id == watchlistId);
  }

  @override
  List<Watchlist> getWatchlistCollection() {
    return watchlistDatasource.getWatchlists();
  }
}
