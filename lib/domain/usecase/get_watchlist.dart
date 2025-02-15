import 'package:watchlist_pro/data/repository/watchlist_repository.dart';
import 'package:watchlist_pro/domain/entity/watchlist_model.dart';

class GetWatchlist {
  final WatchlistRepository _watchlistRepository;

  GetWatchlist(this._watchlistRepository);

  Watchlist execute(String watchlistId) {
    return _watchlistRepository.getWatchlist(watchlistId);
  }

  List<Watchlist> getWatchlistCollection() {
    return _watchlistRepository.getWatchlistCollection();
  }
}
