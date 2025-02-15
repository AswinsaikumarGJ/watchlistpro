import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_pro/presentation/bloc/watchlist_bloc.dart';
import 'package:watchlist_pro/presentation/bloc/watchlist_event.dart';
import 'package:watchlist_pro/presentation/screens/searchscreen.dart';
import 'package:watchlist_pro/presentation/widgets/stock_widget.dart';

import '../bloc/watchlist_state.dart';

class WatchList extends StatefulWidget {
  const WatchList({super.key});

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  String watchlistId = '1';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchlistBloc, WatchlistState>(
        builder: (context, state) {
      if (state is WatchlistInitial) {
        context.read<WatchlistBloc>().add(GetwatchlistEvent(watchlistId));
        return const Center(child: CircularProgressIndicator());
      } else if (state is WatchlistLoaded) {
        return DefaultTabController(
          length: state.watchlistCollection.length,
          child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: const Text('Watchlist'),
                bottom: TabBar(
                  indicatorColor: Colors.teal,
                  labelColor: Colors.teal,
                  tabs: state.watchlistCollection
                      .map(
                        (watchlist) => Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Watchlist ${watchlist.id}',
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Icon(
                                watchlist.icon,
                                size: 16,
                              )
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              body: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 18, right: 18, top: 10),
                    child: Builder(builder: (context) {
                      return TextFormField(
                          onTap: () {
                            int selectedTabIndex =
                                DefaultTabController.of(context).index;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SearchScreen(
                                    stocks: state
                                        .watchlistCollection[selectedTabIndex]
                                        .stocks,
                                  ),
                                ));
                          },
                          readOnly: true,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            hintText: "Search",
                            hintStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.teal.withOpacity(0.1),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide.none),
                          ));
                    }),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: state.watchlistCollection
                          .map(
                            (watchlist) =>
                                StockWidget(stocks: watchlist.stocks),
                          )
                          .toList(),
                    ),
                  ),
                ],
              )),
        );
      } else {
        return const Center(child: Text('Error loading watchlist'));
      }
    });
  }
}
