import 'package:flutter/material.dart';
import 'package:watchlist_pro/domain/entity/stock_model.dart';

class StockWidget extends StatelessWidget {
  final List<Stock> stocks;

  const StockWidget({super.key, required this.stocks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: stocks.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(stocks[index].name),
                  Row(
                    children: [
                      const Icon(
                        Icons.arrow_drop_up_outlined,
                        color: Colors.teal,
                      ),
                      Text(
                        stocks[index].rate,
                        style: const TextStyle(color: Colors.teal),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SizedBox(
                    width: 200,
                    child: RichText(
                        text: TextSpan(
                            text: 'NSE  ',
                            style: const TextStyle(
                                fontSize: 12, color: Colors.black),
                            children: [
                          TextSpan(
                              text: '${stocks[index].incrementpercent}   ',
                              style: const TextStyle(
                                  color: Colors.teal, fontSize: 12)),
                          TextSpan(
                              text: stocks[index].decrementpercent,
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 12))
                        ])),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: Text(stocks[index].rateincreasedecrease),
                )
              ],
            ),
            if (index != stocks.length - 1)
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  color: Colors.grey.withOpacity(0.5),
                ),
              )
          ],
        );
      },
    );
  }
}
