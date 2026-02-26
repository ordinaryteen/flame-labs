import 'package:flutter/material.dart';

class GrammarDrillLayout extends StatelessWidget {
  const GrammarDrillLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grammar Drill: Layout & Content"),
      ),
      body: Center(
          // EXERCISE 1: The "Profile Card"
          // Goal: Type out the widgets manually to build muscle memory.
          // Do not copy-paste. Type the letters and let the IDE autocomplete!

          // TODO: Replace this SizedBox with your code.

          child: Container(
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      size: 80,
                      color: Colors.blue,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Mbak Ika',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite, color: Colors.red, size: 16),
                        SizedBox(width: 4),
                        Text('Flutter Developer'),
                      ],
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Follow'),
                    )
                  ]))),
    );
  }
}

/*
 ======================================================================
 📝 YOUR BLUEPRINT (Type this exact structure out above!)
 ======================================================================

 Container (
   decoration: BoxDecoration (
     color: Colors.blue[50],
     borderRadius: BorderRadius.circular(16),
   ),
   padding: EdgeInsets.all(20),
   child: Column (
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
       Icon (
         Icons.person,
         size: 80,
         color: Colors.blue,
       ),
       SizedBox(height: 16),
       Text (
         'Mbak Ika',
         style: TextStyle(
           fontSize: 24,
           fontWeight: FontWeight.bold,
         ),
       ),
       SizedBox(height: 8),
       Row (
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Icon(Icons.favorite, color: Colors.red, size: 16),
           SizedBox(width: 4),
           Text('Flutter Developer'),
         ],
       ),
       SizedBox(height: 24),
       ElevatedButton (
         onPressed: () {},
         child: Text('Follow'),
       )
     ]
   )
 )

 ======================================================================
*/
