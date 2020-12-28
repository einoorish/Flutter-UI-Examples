import 'package:flutter/material.dart';

class StatsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                _StatCard('Total Cases', '1.81 M', Colors.orange),
                _StatCard('Deaths', '105 K', Colors.red),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                _StatCard('Recovered', '391 K', Colors.green),
                _StatCard('Active', '1.31 M', Colors.lightBlue),
                _StatCard('Critical', 'N/A', Colors.purple),
              ],
            ),
          ),
        ]
      )
    );
  }

}

class _StatCard extends StatelessWidget{
  
  final String title, count;
  final Color color;

  _StatCard(this.title, this.count, this.color);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10.0),),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w600,),
            ),
            Text(
              count,
              style: const TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold,),
            ),
          ],
        ),
      ),
    );
  }
  
  
  
}