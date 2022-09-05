import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wallet/const.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: myBoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16, top: 32, right: 16, bottom: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      AvatarWelcome(),
                      Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                        size: 40,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  accountBalance(),
                  MyOutlinedButton('Choose card', () {}),
                  const SizedBox(
                    height: 25,
                  ),
                  buttons(),
                ],
              ),
            ),
          ),
          const LastTransaction(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.send,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }

  BoxDecoration myBoxDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          primaryColor,
          secondaryColor,
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      boxShadow: [
        BoxShadow(
          color: primaryColor,
          blurRadius: 15,
          offset: Offset(
            0,
            1,
          ),
        ),
      ],
    );
  }

  Row buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MySquareButton('Transfer', Icons.north_east, () {}),
        MySquareButton('Receive', Icons.south_west, () {}),
        MySquareButton('Top up', Icons.add, () {}),
        MySquareButton('More', Icons.dashboard, () {}),
      ],
    );
  }

  Column accountBalance() {
    return Column(
      children: [
        const Text(
          'Total Balance',
          style: TextStyle(
            color: Colors.white60,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.euro,
              color: Colors.white60,
              size: 40,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '350,12',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            )
          ],
        )
      ],
    );
  }
}

class LastTransaction extends StatelessWidget {
  const LastTransaction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Transactions',
              style: TextStyle(
                color: primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return TransactionItem(transactions[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final dynamic transactionItem;

  const TransactionItem(
    this.transactionItem, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: primaryColor,
                    child: Icon(
                      Icons.abc,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transactionItem['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        transactionItem['day'],
                        style: const TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Text(
                double.parse(transactionItem['amount'].toString())
                    .toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 20,
                  color: getAmountColor(
                    double.parse(transactionItem['amount'].toString()),
                  ),
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          const Divider(
            color: primaryColor,
          )
        ],
      ),
    );
  }

  Color getAmountColor(double amount) {
    if (amount > 0) {
      return primaryColor;
    } else {
      return Colors.red;
    }
  }
}

class MyOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback func;

  const MyOutlinedButton(
    this.text,
    this.func, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: func,
      style: ButtonStyle(
        side: MaterialStateProperty.all(
          const BorderSide(
            color: Colors.white,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

class MySquareButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback func;

  const MySquareButton(
    this.text,
    this.icon,
    this.func, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: func,
          child: Container(
            color: secondaryColor,
            height: 60,
            width: 60,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

class AvatarWelcome extends StatelessWidget {
  const AvatarWelcome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/images/ja.jpg',
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Hi DejfL',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Welcome to the wallet',
              style: TextStyle(
                color: Colors.white60,
              ),
            )
          ],
        )
      ],
    );
  }
}

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      elevation: 5,
      notchMargin: 5,
      child: Row(
        //children inside bottom appbar
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(
              Icons.home,
              color: primaryColor,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.payments,
              color: Colors.black38,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: Colors.black38,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.person_outline,
              color: Colors.black38,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
