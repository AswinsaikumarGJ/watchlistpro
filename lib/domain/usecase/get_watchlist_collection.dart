import 'package:watchlist_pro/data/repository/watchlist_repository.dart';
import 'package:watchlist_pro/domain/entity/watchlist_model.dart';

class GetWatchlistCollection {
  final WatchlistRepository _watchlistRepository;

  GetWatchlistCollection(this._watchlistRepository);

  List<Watchlist> execute() {
    return _watchlistRepository.getWatchlistCollection();
  }
}