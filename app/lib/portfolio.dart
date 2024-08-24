import 'package:flutter/material.dart';


List<Widget> myStocks = [];



class Portfolio extends StatefulWidget {
  const Portfolio({Key? key}) : super(key: key);


  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {

  addStock(String name, double price, double amount, double change, double changePercent) {
    setState(() {
      myStocks.add(Stock(name: name, price: price, amount: amount,change: change, changePercent: changePercent));
    });
  }
  @override
  void initState() {
    super.initState();
    myStocks = [];
    addStock('AAPL', 150.0, 2.4, 2.0, 1.0);
    addStock('GOOGLE', 2000.0, 1, 5.0, 2.0);
    addStock('TSLA', 700.0, 4, 10.0, 3.0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: myStocks,
    );
  }
}


class Stock extends StatefulWidget {
  final String name;
  final double price;
  final double amount;
  final double change;
  final double changePercent;

  Stock({
    required this.name,
    required this.price,
    required this.amount,
    required this.change,
    required this.changePercent,
  });

  @override
  State<Stock> createState() => _StockState();
}

class _StockState extends State<Stock> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 238, 238, 238)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/625px-Apple_logo_black.svg.png", width: 40, height: 40),
          Text(widget.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "IBMPlexSansKR")),
          Text(widget.amount.toString(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "IBMPlexSansKR")),

          Container(
            margin: const EdgeInsets.only(right:20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(widget.price.toString(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "IBMPlexSansKR")),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: widget.change > 0 ? Color(0xFF2D9596) : Color(0xFFC63C51)
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Text(widget.change > 0 ? "+${widget.change}" : "-${widget.change}", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "IBMPlexSansKR", color: Colors.white)),
                ),
            ]),
          )


        ],
      ),
    );
  }
}
