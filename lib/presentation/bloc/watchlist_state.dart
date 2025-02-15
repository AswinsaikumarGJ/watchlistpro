import '../../domain/entity/watchlist_model.dart';

abstract class WatchlistState {}

class WatchlistInitial extends WatchlistState {}

class WatchlistLoading extends WatchlistState {}

class WatchlistLoaded extends WatchlistState {
  final Watchlist watchlist;
  final List<Watchlist> watchlistCollection;
  WatchlistLoaded(this.watchlist, this.watchlistCollection);
}

class WatchlistError extends WatchlistState {
  final String message;
  WatchlistError(this.message);
}
