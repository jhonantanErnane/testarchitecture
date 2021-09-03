class PageNames {
  // General Pages
  static const String general = 'general';
  static const String demo1 = 'demo1';
  static const String demo2 = 'demo2';
  static const String demo3 = 'demo3';
  static const String demo4 = 'demo4';
  
  // Auth Pages
  static const String auth = 'auth';
  static const String login = 'login';
  static const String forgotPassword = 'forgotPassword';
  
  // Signup Pages
  static const String signup = 'signup';
  static const String initialData = 'initialData';
  static const String address = 'address';

  // Contact Pages
  static const String contact = 'contact';
  static const String contactHome = 'contactHome';
  static const String addEditContact = 'addEditContact';
  static const String editContact = 'editContact';
  static const String addContact = 'addContact';
  static const String view = 'view';


  static String getPath({required List<String> paths, bool isAbsolut = true}) {
    String path = '';
    paths.forEach((p) {
      if (path.isNotEmpty) {
        path += '/';
      }
      path += '$p';
    });
    path = isAbsolut ? '/$path' : path;
    print(path);
    return path;
  }
}
