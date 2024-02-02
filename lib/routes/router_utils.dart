enum Pages {
  home,
  addTodo,
  settings,
  error,
}

extension AppPageExtension on Pages {
  String get screenPath {
    return switch (this) {
      Pages.home => '/',
      Pages.addTodo => 'add_todo',
      Pages.settings => 'settigns',
      Pages.error => 'error',
    };
  }

  String get screenName {
    return switch (this) {
      Pages.home => 'HOME',
      Pages.addTodo => 'ADDTODO',
      Pages.settings => 'SETTIGNS',
      Pages.error => 'ERROR',
    };
  }
}
