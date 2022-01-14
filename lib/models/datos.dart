class Datos {
  final int? id;
  final String user;
  final String pass;

  Datos(
    this.id, {
    required this.user,
    required this.pass,
  });
  Map<String, dynamic> toMap() {
    return {'id': id, 'user': user, 'pass': pass};
  }
}
