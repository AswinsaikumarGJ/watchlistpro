import 'package:flutter/material.dart';
import 'package:watchlist_pro/domain/entity/stock_model.dart';

class SearchScreen extends StatefulWidget {
  final List<Stock> stocks;
  const SearchScreen({super.key, required this.stocks});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> stockNames = <String>[];
  List<String> filteredStockNames = <String>[];

  @override
  void initState() {
    super.initState();
    for (var element in widget.stocks) {
      stockNames.add(element.name);
      filteredStockNames.add(element.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, top: 55),
            child: TextFormField(
              decoration: _getTextFormFieldDecoration(),
              onChanged: (String value) {
                filterList(value);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredStockNames.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: ListTile(
                    title: Text(filteredStockNames[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _getTextFormFieldDecoration() {
    return InputDecoration(
      labelStyle: const TextStyle(color: Colors.grey),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      prefixIcon: const Icon(
        Icons.search,
        color: Colors.grey,
      ),
      labelText: "Search",
      filled: true,
      fillColor: Colors.teal.withOpacity(0.1),
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none),
    );
  }

  void filterList(String value) {
    setState(() {
      filteredStockNames = stockNames.where(
        (stock) {
          return stock.toLowerCase().contains(
                value.toLowerCase(),
              );
        },
      ).toList();
    });
  }
}
