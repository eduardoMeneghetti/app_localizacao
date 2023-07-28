import "package:flutter/material.dart";
import "package:geolocator/geolocator.dart";

class UserLocalizacao extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String error = '';

  LocalizacaoController() {
    getPosicao();
  }

  getPosicao() async {
    try {
      Position posicao = await _posicaoAtual();
      lat = posicao.latitude;
      long = posicao.longitude;
      print('Latitude: $lat, Longitude: $long');
    } catch (e) {
      error = e.toString();
    }
    notifyListeners();
  }

  Future<Position> _posicaoAtual() async {
    LocationPermission permissao;
    bool ativado = await Geolocator.isLocationServiceEnabled();
    if (!ativado) {
      print('Erro 1');
      return Future.error(
          'Por favor, habilite a geolocalização em seu aparelho!');
    }

    permissao = await Geolocator.checkPermission();
    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
      print('Erro 2');
      if (permissao == LocationPermission.denied) {
        return Future.error('Por Favor, autorize a localização no aparelho!');
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      print('Erro 3');
      return Future.error(
          'Você precisa autorizar a Geolocalicação no aparelho.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
