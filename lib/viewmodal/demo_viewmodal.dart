import '../../core/helper.dart';
import '../../core/locator.dart';
import '../../core/services/api.dart';
import '../modals/datamodal.dart';
import 'baseviewmodel.dart';

class DemoViewModel extends BaseViewModel {
  final _api = locator<Api>();

  late List<Datamodal> _data;
  List<Datamodal> get data => _data;

  DemoApi(id) async{
    setLoading();
    var value = await Helper.checkConnectivity();
    if (value) {
      _data = await _api.demo();
      print(_data);
      setSuccess('success');
    } else {
      setnoInternet('No Internet');
    }
    return value;
  }
}

