
import 'package:flutter/material.dart';

class CountryDropdown extends StatelessWidget {
  final List<String> countries;
  final String country;
  final Function(String) onChanged;

  const CountryDropdown({this.countries, this.country, this.onChanged,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      height: 40.0,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30.0)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: country,
          onChanged: onChanged,
          items: countries.map((countryName) => DropdownMenuItem(
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 12.0,
                  child: Image.asset('assets/images/${countryName.toLowerCase()}_flag.png',),
                ),
                const SizedBox(width: 8.0),
                Text(
                  countryName,
                  style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,),
                )
              ],
            ),
            value: countryName,
          )).toList(),
        )
      )
    );
  }


}