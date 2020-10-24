class API {

  Future<bool> login(String username, String password) async {
    if (username == 'maria@gmail.com' && password == 'caseirinho') {
      return true;
    }
    return false;
  }
}
