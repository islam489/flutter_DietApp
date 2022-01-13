 import 'package:flutter/material.dart';
 
  class _NavigationRailExample extends StatefulWidget {
     _NavigationRailExampleState createState() => _NavigationRailExampleState();
  }
  
 
  class _NavigationRailExampleState extends State<_NavigationRailExample> {
  
    int _selectedIndex;
 
    initState() {
      super.initState();
 
      _selectedIndex = 0;
    }
 
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar( title: Text('Woolha.com Flutter Tutorial')),
        body: Row(
          children: <Widget>[
            NavigationRail(
              selectedIndex: _selectedIndex,
              destinations: _buildDestinations(),
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
            VerticalDivider(),
            Expanded(
              child: Center(
                child: Text('Content of Menu $_selectedIndex'),
              ),
            ),
          ],
        ),
      );
    }
 
    List<NavigationRailDestination> _buildDestinations() {
      Icon icon = Icon(Icons.check_circle_outline);
 
      return [
        NavigationRailDestination(
          icon: icon,
          label: Text('Menu 1'),
        ),
        NavigationRailDestination(
          icon: icon,
          label: Text('Menu 2'),
        ),
        NavigationRailDestination(
          icon: icon,
          label: Text('Menu 3'),
        ),
      ];
    }
  }