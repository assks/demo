import 'dart:convert';
import 'package:flutter/material.dart';



class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.NONE;

  ViewState get currentState => _state;
  String _message = 'Unknown Error';
  final bool _isloading = false;

  bool get isloading => _isloading;

  String get message => _message;

  bool get loading => currentState == ViewState.LOADING;

  bool get morefatch => currentState == ViewState.MOREFATCH;

  bool get refresh => currentState == ViewState.REFRESH;

  bool get hasError => currentState == ViewState.ERROR;

  bool get nointernet => currentState == ViewState.NOINTERNET;

  bool get nodata => currentState == ViewState.NONE;



  late String _image = "";

  String get image => _image;
  late String _kyc;
  String get kyc => _kyc;

  setLoading() {
    _state = ViewState.LOADING;
    notifyListeners();
  }
  setmorefatch(bool value) {
    _state = ViewState.MOREFATCH;
    notifyListeners();
  }

  setRefresh() {
    _state = ViewState.REFRESH;
    notifyListeners();
  }

  setError(String message) {
    _state = ViewState.ERROR;
    if (message.isEmpty) {
      message = 'Unknown error occurred';
    }
    _message = message;
    notifyListeners();
  }

  setSuccess(String success) {
    _state = ViewState.DATE_READY;
    notifyListeners();
  }

  setnodata(String success) {
    _state = ViewState.NONE;
    notifyListeners();
  }

  setnoInternet(String noInternet) {
    _state = ViewState.NOINTERNET;
    if (noInternet.isEmpty) {
      noInternet = 'Please check your Internet ';
    } else {
      noInternet = 'Please check your Internet else ';
    }
    _message = noInternet;
    notifyListeners();
  }
}

enum ViewState { NONE, LOADING, DATE_READY, ERROR, NOINTERNET,REFRESH,MOREFATCH }
