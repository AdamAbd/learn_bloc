Stream<int> boatStream() async* {
  for (var i = 0; i < 10; i++) {
    print('Sent boat no.$i');
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}

void main(List<String> args) async {
  Stream<int> stream = boatStream();

  stream.listen((event) {
    print('Received boat no.$event');
  });
}
