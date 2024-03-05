import 'dart:io';
import 'dart:math';

void main() {
  stdout.write('Введите размер массива: ');
  int size = int.parse(stdin.readLineSync()!);

  List<int> randomArray = generateRandomArray(size);
  print('Сгенерированный массив: $randomArray');

  stdout.write('Введите элемент для поиска: ');
  int searchItem = int.parse(stdin.readLineSync()!);

  DateTime startTime = DateTime.now();
  bool isFound = searchElement(randomArray, searchItem);
  DateTime endTime = DateTime.now();

  if (isFound) {
    print('Элемент $searchItem найден в массиве.');
  } else {
    print('Такого элемента в массиве нет.');
  }

  print('Время поиска элемента: ${endTime.difference(startTime).inMicroseconds} микросекунд.');
}

List<int> generateRandomArray(int size) {
  Random random = Random();
  List<int> array = List.generate(size, (index) => random.nextInt(100));
  return array;
}

bool searchElement(List<int> array, int target) {
  for (int i = 0; i < array.length; i++) {
    if (array[i] == target) {
      return true;
    }
  }
  return false;
}
