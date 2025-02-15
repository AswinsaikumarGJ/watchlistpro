
abstract class WatchlistEvent {}

class GetwatchlistEvent extends WatchlistEvent {
  final String watchlistId;

  GetwatchlistEvent(this.watchlistId);
}
