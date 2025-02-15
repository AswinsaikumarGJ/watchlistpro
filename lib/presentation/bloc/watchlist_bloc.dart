import 'package:bloc/bloc.dart';
import 'package:watchlist_pro/domain/entity/watchlist_model.dart';
import 'package:watchlist_pro/domain/usecase/get_watchlist.dart';
import 'package:watchlist_pro/domain/usecase/get_watchlist_collection.dart';
import 'package:watchlist_pro/presentation/bloc/watchlist_event.dart';
import 'package:watchlist_pro/presentation/bloc/watchlist_state.dart';


class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  final GetWatchlist getWatchlist;
  final GetWatchlistCollection getWatchlistCollection;
  WatchlistBloc(this.getWatchlist, this.getWatchlistCollection) : super(WatchlistInitial()) {
    on<GetwatchlistEvent>(getwatchlist);
  }
  getwatchlist(GetwatchlistEvent event, Emitter<WatchlistState> emit) async {
    try {
      emit(WatchlistLoading());
          final Watchlist watchlist =
            getWatchlist.execute(event.watchlistId);
        final List<Watchlist> watchlistCollection =
            getWatchlistCollection.execute();
      emit(WatchlistLoaded(watchlist, watchlistCollection));
    } catch (e) {
      emit(WatchlistError("Something went wrong"));
    }
  }
}
