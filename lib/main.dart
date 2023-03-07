import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/chart.dart';
import 'package:flutter_complete_guide/widgets/transaction_list.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './widgets/chart.dart';
// import './widgets/transaction_list.dart';
import './models/transaction.dart';
//import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expanse app',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        // errorColor: Colors.red,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                button: TextStyle(color: Colors.white),
              ),
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  button: TextStyle(color: Colors.white),
                ),
          )
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
   @override
  _MyHomePageState createState() => _MyHomePageState();
}
  //final List<Transaction> transactions = [
  // Transaction(
  //   id: 't1',
  //   title: 'New Shoes',
  //   amount: 69.99,
  //   date: DateTime.now(),
  // ),
  // Transaction(
  //   id: 't2',
  //   title: 'Weekly Groceries',
  //   amount: 16.53,
  //   date: DateTime.now(),
  // ),
  //];
// String titleInput;
// String amountInput;
//final titleController =TextEditingController();   //move to new transaction
//final amountController =TextEditingController();
class _MyHomePageState extends State<MyHomePage> {
final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Weekly Groceries',
    //   amount: 16.53,
    //   date: DateTime.now(),
    // ),
  ];
  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }
void _addNewTransaction(String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );
    
    setState(() {
      _userTransactions.add(newTx);
    });
  }
void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expanse App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () =>_startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Chart(_recentTransactions),
            // Container(        //replaced with Chart
            //   width: double.infinity,
            //   child: Card(
            //     child: Text("Chart"),
            //     elevation: 5,
            //   ),
            // ),
            //NewTransaction(),     //move to user transaction
            // Card(                             //move to new transaction
            //   elevation: 5,
            //   child: Container(
            //     padding: EdgeInsets.all(10),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.end,
            //       children: <Widget>[
            //         TextField(
            //           decoration: InputDecoration(labelText: 'Title'),
            //           controller: titleController,
            //           // onChanged: (val) {
            //           //   titleInput = val;
            //           // },
            //         ),
            //         TextField(
            //           decoration: InputDecoration(labelText: 'Amount'),
            //           controller: amountController,
            //           //onChanged: (val) => amountInput = val,
            //         ),
            //         FlatButton(
            //           child: Text('Add Transaction'),
            //           textColor: Colors.purple,
            //           onPressed: () {
            //             print(titleController.text);
            //           },
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            //TransactionList()   //move to user_transaction
            // Column(                                   //copy to transactlist
            //   children: transactions.map((tx) {
            //     return Card(
            //       child: Row(
            //         children: <Widget>[
            //           Container(
            //             margin: EdgeInsets.symmetric(
            //               vertical: 10,
            //               horizontal: 15,
            //             ),
            //             decoration: BoxDecoration(
            //               border: Border.all(
            //                 color: Colors.purple,
            //                 width: 2,
            //               ),
            //             ),
            //             padding: EdgeInsets.all(10),
            //             child: Text(
            //               '\$${tx.amount}',
            //               style: TextStyle(
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 20,
            //                 color: Colors.purple,
            //               ),
            //             ),
            //           ),
            //           Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: <Widget>[
            //               Text(
            //                 tx.title,
            //                 style: TextStyle(
            //                   fontSize: 16,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //               Text(
            //                 DateFormat.yMMMd().format(tx.date),
            //                 style: TextStyle(color: Colors.grey),
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //     );
            //   }).toList(),
            // ),
            //UserTransactions()
            TransactionList(_userTransactions, _deleteTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () =>_startAddNewTransaction(context),
      ),
    );
  }
}
