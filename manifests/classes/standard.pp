class standard {
  include stages

  class {
    'apt':
      stage => first;
  }
}
