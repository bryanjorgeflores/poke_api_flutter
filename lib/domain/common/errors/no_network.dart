class NoNetwork implements Exception {
  String title = '';
  String message = '';
  NoNetwork() {
    title = "Error inesperado";
    message = "Error al subir asistencias, verifique su conexión a internet";
  }
}
