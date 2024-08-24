import 'package:flutter/material.dart';

List<Widget> mySpending = [];


class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(10),
         color: const Color.fromARGB(255, 238, 238, 238)
       ),
       alignment: const Alignment(-0.8,-0.8),
       width: screenSize.width * 0.9,
       height: 150,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           Container(
             margin: const EdgeInsets.only(left: 20),
             alignment: Alignment.centerLeft,
             child: const Text(
               'Your Balances:',
               style: TextStyle(
                   fontSize: 17,
                   fontFamily: "IBMPlexSansKR",
                   fontWeight: FontWeight.bold
               ),
             ),
           ),
           Column(
             children: [
               Container(
                 alignment: Alignment.centerLeft,
                 margin: const EdgeInsets.only(left: 20),
                 child: const Text(
                   '504,578₩',
                   style: TextStyle(
                       fontSize: 30,
                       fontFamily: "IBMPlexSansKR",
                       fontWeight: FontWeight.bold,
                   ),
                 ),
               ),
               Container(
                 alignment: Alignment.centerLeft,
                 margin: const EdgeInsets.only(left: 20),
                 child: const Text(
                   '4,578₩ (1.00%)',
                   style: TextStyle(
                       fontSize: 15 ,
                       fontFamily: "IBMPlexSansKR",
                       fontWeight: FontWeight.bold,
                       color: Color(0xFF2D9596)

                   ),
                 ),
               ),

             ],
           )

         ],
       ),
     );
  }
}

class Spending extends StatefulWidget {
  const Spending({super.key});

  @override
  State<Spending> createState() => _SpendingState();
}

class _SpendingState extends  State<Spending>{

  void addSpending(String name, double spend, bool isSpend) {
    mySpending.add(Spend(name: name, spend: spend, isSpend: isSpend));
  }
  @override
  void initState() {
    super.initState();
    addSpending('food', 20000.0, true);

  }
  void dispose() {
    super.dispose();
    mySpending = [];
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.9,

      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFEEEEEE),
      ),
      child: Column(
        children: mySpending,
      ),
    );
  }
}

class Spend extends StatelessWidget {

  final String name;
  final double spend;
  final bool isSpend;

  const Spend({super.key,
    required this.name,
    required this.spend,
    required this.isSpend,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.restaurant,
            size: 48,
          ),
          Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              fontFamily: "IBMPlexSansKR",
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            isSpend ? "- $spend" :" + $spend",
            style: TextStyle(
              fontSize: 20,
              fontFamily: "IBMPlexSansKR",
              fontWeight: FontWeight.bold,
              color: isSpend ? const Color(0xFFC63C51) : const Color(0xFF2D9596),
            ),
          )
        ],
      )
    );
  }

}
