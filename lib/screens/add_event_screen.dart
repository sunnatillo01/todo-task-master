import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_height/data.dart';

import '../bloc/get_all_data_model_bloc.dart';
import 'izars_servis.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({Key? key}) : super(key: key);

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final TextEditingController nameController1 = TextEditingController();

  final TextEditingController desController1 = TextEditingController();

  final TextEditingController locationController1 = TextEditingController();

  final TextEditingController timeController1 = TextEditingController();
  Color color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'images/back.png',
                height: 60,
                width: 60,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Event name',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF3F4F6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              controller: nameController1,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Event description',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            height: 140,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF3F4F6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              controller: desController1,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Event location',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF3F4F6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              controller: locationController1,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 60),
                                      child: AlertDialog(
                                        content: SizedBox(
                                          height: 300,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    color = Colors.blue;
                                                    setState(() {});
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    color: Colors.blue,
                                                    width: 50,
                                                    height: 50,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    color = Colors.orange;
                                                    setState(() {});
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    color: Colors.orange,
                                                    width: 50,
                                                    height: 50,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    color = Colors.red;
                                                    setState(() {});
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    color: Colors.red,
                                                    width: 50,
                                                    height: 50,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Container(
                            color: color,
                            width: 50,
                            height: 50,
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Event time',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF3F4F6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              controller: timeController1,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
      bottomSheet: InkWell(
        onTap: () {
          String colorIndex = "b";

          if (color == Colors.blue) {
            colorIndex = "b";
          } else if (color == Colors.orange) {
            colorIndex = "o";
          } else {
            colorIndex = "r";
          }
          print('*-*-*-*-*-*-*-*-*-');
          print(colorIndex);
          print('*-*-*-*-*-*-*-*-*-');

          Data data = Data()
            ..name = nameController1.text
            ..description = desController1.text
            ..lat = locationController1.text
            ..long = locationController1.text
            ..time = timeController1.text
            ..colorIndex = colorIndex;
          IsarService().saveData(data);
          BlocProvider.of<GetAllDataModelBloc>(context)
              .add(StartGetALlDataModelEvent());
          Navigator.pop(context);
        },
        child: Container(
          height: 50,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
          ),
          child: const Text(
            'Add',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
