import 'package:flutter/material.dart';

import '../baseview.dart';
import '../constants/routepath_constant.dart';
import '../modals/datamodal.dart';
import '../viewmodal/baseviewmodel.dart';
import '../viewmodal/demo_viewmodal.dart';

class DemoUI extends StatefulWidget {
  const DemoUI({Key? key}) : super(key: key);

  @override
  State<DemoUI> createState() => _DemoUIState();
}

class _DemoUIState extends State<DemoUI> {

  @override
  Widget build(BuildContext context) {
    return BaseView<DemoViewModel>(onModelReady: (modal) async {
      await modal.DemoApi(2);
    }, builder: (_, model, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Demo"),
        ),
        body: Stack(
          children: [
            if (model.loading) const Center(child: CircularProgressIndicator()),
            if (model.currentState == ViewState.DATE_READY)
              view(model.data, context, model),
            if (model.currentState == ViewState.NONE)
              const Center(child: Text("NONE")),
            if (model.currentState == ViewState.ERROR)
              const Center(child: Text("ERROR")),
            if (model.currentState == ViewState.NOINTERNET)
              const Center(child: Text("no internet")),
          ],
        ),
      );
    });
  }

  view(List<Datamodal> data, BuildContext context, DemoViewModel model) {
    return SafeArea(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, RoutePaths.DetailPage,
                    arguments: {
                      'data': data[index],
                    });
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Title:${data[index].title.toString()}"),
                      // Image.network("https:${data.forecast!.forecastday![index].day!.condition!.icon}", fit: BoxFit.fill),
                      Text((data[index].body.toString()))

                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
