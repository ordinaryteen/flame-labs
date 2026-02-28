import 'package:flame_labs/archive/features/m2-synth/views/pages/testing_page.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  final String title;
  const SettingPage({super.key, required this.title});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  TextEditingController controller = TextEditingController();
  bool? isChecked = false;
  bool isSwitched = false;
  String? menuItem = 'e1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButton(
                  value: menuItem,
                  items: [
                    DropdownMenuItem(value: 'e1', child: Text("Mba I")),
                    DropdownMenuItem(value: 'e2', child: Text("Ika")),
                    DropdownMenuItem(value: 'e3', child: Text("Love u sm")),
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      menuItem = value;
                    });
                  },
                ),
                TextField(
                  controller: controller,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  onEditingComplete: () {
                    setState(() {});
                  },
                ),
                Divider(),
                SizedBox(
                  height: 24,
                ),
                Container(
                  child: Text(controller.text),
                ),
                SizedBox(
                  height: 24,
                ),
                Checkbox(
                  tristate: true,
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value;
                    });
                  },
                ),
                CheckboxListTile(
                  tristate: true,
                  title: Text("thunder"),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value;
                    });
                  },
                ),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                ),
                SwitchListTile.adaptive(
                  title: Text("thunderstrom"),
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                ),
                InkWell(
                  splashColor: Colors.grey,
                  onTap: () {
                    print('image');
                  },
                  child: Container(
                    color: const Color.fromARGB(221, 42, 42, 42),
                    width: 100,
                    height: 200,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return TestingPage();
                          },
                        ),
                      );
                    },
                    child: Text("Kita Usahakan Rumah Itu")),
                OutlinedButton(
                    onPressed: () {}, child: Text("Kita Usahakan Rumah Itu")),
                CloseButton(),
                BackButton(
                  onPressed: () {
                    print("halo");
                  },
                )
              ],
            )),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
