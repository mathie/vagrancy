class ruby::repo($stage = first) {
  apt::ppa {
    'ruby-ng-experimental':
      user => 'brightbox';
  }
}
