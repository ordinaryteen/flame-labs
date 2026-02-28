import 'package:flutter/material.dart';

class GrammarDrillLayout extends StatelessWidget {
  const GrammarDrillLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "nigger",
        ),
        leading: Icon(Icons.abc_rounded),
      ),
      body: Body(),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "Beranda"),
          NavigationDestination(
              icon: Icon(
                Icons.person,
                color: Colors.blue,
              ),
              label: "Penghuni")
        ],
        onDestinationSelected: (int value) => print(value),
        selectedIndex: 1,
      ),
    );
  }

  Center Body() {
    return Center(
      child: Container(
        width: 340,
        height: 600,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.amberAccent,
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ListTile(
              tileColor: Colors.redAccent[400],
              title: Text(
                "mbak ika cntik",
              ),
              leading: Icon(Icons.abc_outlined),
              onTap: () => print('kita usahakan rumah itu'),
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14), color: Colors.blue),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 120,
                    margin: EdgeInsets.only(top: 12, bottom: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 238, 82, 58)),
                  ),
                  Container(
                    width: 80,
                    height: double.infinity,
                    margin: EdgeInsets.only(top: 12, bottom: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 238, 175, 58)),
                    child: Center(
                        child: Text(
                      "Ika :(",
                      style: TextStyle(fontSize: 20, color: Colors.amberAccent),
                    )),
                  ),
                  Container(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.only(top: 12, bottom: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 223, 238, 58)),
                      child: Center(
                        child: Text(
                          "Ika :(",
                          style: TextStyle(
                              fontSize: 20,
                              color: const Color.fromARGB(255, 56, 46, 11)),
                        ),
                      )),
                ],
              ),
            ),
            Container(
              height: 150,
              width: 123,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14), color: Colors.blue),
            ),
            Container(
                height: 150,
                width: 123,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: const Color.fromARGB(255, 243, 82, 33)),
                child: (Image.asset(
                  'assets/images/pinterest.jpeg',
                  fit: BoxFit.cover,
                ))),
          ],
        ),
      ),
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
