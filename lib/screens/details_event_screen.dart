import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_height/bloc/get_all_data_model_bloc.dart';
import 'package:todo_height/data.dart';
import 'package:todo_height/screens/izars_servis.dart';
import 'package:todo_height/widgets/details_container.dart';

class DetailsEventScreen extends StatefulWidget {
  final Data data;
  const DetailsEventScreen({Key? key, required this.data}) : super(key: key);
  @override
  State<DetailsEventScreen> createState() => _DetailsEventScreenState();
}

class _DetailsEventScreenState extends State<DetailsEventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailsContainer(
            title: widget.data.name ?? "",
            subTitle: widget.data.description ?? "",
            time: widget.data.time ?? '',
            location: widget.data.lat ?? "",
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Remenber',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '15 minutes befor',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            widget.data.description ?? "",
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () =>
                        IsarService().removeData(widget.data.id).then((value) {
                      BlocProvider.of<GetAllDataModelBloc>(context)
                          .add(StartGetALlDataModelEvent());
                      Navigator.pop(context);
                    }),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: const Color(0xFFFEE8E9),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/delete.png',
                            height: 20,
                            width: 20,
                            fit: BoxFit.cover,
                            color: Colors.red,
                          ),
                          const SizedBox(width: 3),
                          const Text(
                            'Delete Event',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
