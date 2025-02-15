import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_pro/data/datasource/watchlist_datasource.dart';
import 'package:watchlist_pro/data/repository/watchlist_repository_implementation.dart';
import 'package:watchlist_pro/domain/usecase/get_watchlist.dart';
import 'package:watchlist_pro/domain/usecase/get_watchlist_collection.dart';
import 'package:watchlist_pro/presentation/bloc/watchlist_bloc.dart';
import 'package:watchlist_pro/presentation/screens/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WatchlistBloc(
            GetWatchlist(
              WatchlistRepositoryImplementation(
                watchlistDatasource: WatchlistDatasource(),
              ),
            ),
            GetWatchlistCollection(
              WatchlistRepositoryImplementation(
                watchlistDatasource: WatchlistDatasource(),
              ),
            ),
          ),
        ),
      ],
      child: const MaterialApp(
        title: 'Watchlist Pro',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
