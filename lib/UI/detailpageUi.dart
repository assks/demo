import 'package:flutter/material.dart';
import '../modals/datamodal.dart';


class Detail_UI extends StatefulWidget {
  final dynamic data;
  const Detail_UI({Key? key,required this.data}) : super(key: key);

  @override
  State<Detail_UI> createState() => _DetailUIState();
}

class _DetailUIState extends State<Detail_UI> {
  Datamodal? data;
  @override
  void initState() {
    data =widget.data['data'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(data!.id.toString()),),
      body: Column(
        children: [
          Text("Title:${data!.title.toString()}",style: const TextStyle(color: Colors.blue,fontSize: 20),),
          Text(data!.body.toString())


        ],
      ),
    );

  }

}
