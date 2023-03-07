import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);
  // final List<Transaction> _usertransactions = [    //move to user transactions
  //   Transaction(
  //     id: 't1',
  //     title: 'New Shoes',
  //     amount: 69.99,
  //     date: DateTime.now(),
  //   ),
  //   Transaction(
  //     id: 't2',
  //     title: 'Weekly Groceries',
  //     amount: 16.53,
  //     date: DateTime.now(),
  //   ),
  // ];

  //final Function deleteTx;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No Transaction added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                // return Card(                     //without listtile
                //   child: Row(
                //     children: <Widget>[
                //       Container(
                //         margin: EdgeInsets.symmetric(
                //           vertical: 10,
                //           horizontal: 15,
                //         ),
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             //color: Colors.red,
                //             color: Theme.of(context).primaryColor,
                //             width: 2,
                //           ),
                //         ),
                //         padding: EdgeInsets.all(10),
                //         child: Text(
                //           '\$${transactions[index].amount.toStringAsFixed(2)}',
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20,
                //             //color: Colors.red,
                //             color: Theme.of(context).primaryColor,
                //           ),
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: <Widget>[
                //           Text(
                //             transactions[index].title,
                //             style: Theme.of(context)
                //                 .textTheme
                //                 .headline6, //TextStyle(
                //             //   fontSize: 16,
                //             //   fontWeight: FontWeight.bold,
                //             // ),
                //           ),
                //           Text(
                //             DateFormat.yMMMd().format(transactions[index].date),
                //             style: TextStyle(color: Colors.grey),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // );
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\PKR ${transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteTx(transactions[index].id),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
              //children: transactions.map((tx) {
              // return Card(                     //move to listview.buuilder this used for listview method
              //   child: Row(
              //     children: <Widget>[
              //       Container(
              //         margin: EdgeInsets.symmetric(
              //           vertical: 10,
              //           horizontal: 15,
              //         ),
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //             color: Colors.purple,
              //             width: 2,
              //           ),
              //         ),
              //         padding: EdgeInsets.all(10),
              //         child: Text(
              //           '\$${tx.amount}',
              //           style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             fontSize: 20,
              //             color: Colors.purple,
              //           ),
              //         ),
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: <Widget>[
              //           Text(
              //             tx.title,
              //             style: TextStyle(
              //               fontSize: 16,
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //           Text(
              //             DateFormat.yMMMd().format(tx.date),
              //             style: TextStyle(color: Colors.grey),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // );
              //}).toList(),
            ),
    );
  }
}
