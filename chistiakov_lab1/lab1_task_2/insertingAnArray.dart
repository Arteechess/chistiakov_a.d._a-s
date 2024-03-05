import 'dart:io';
import 'dart:math';

void main() {
  stdout.write('Введите размер массива: ');
  int size = int.parse(stdin.readLineSync()!);

  List<int> randomArray = generateRandomArray(size);
  print('Сгенерированный массив: $randomArray');

  stdout.write('Введите элемент для поиска: ');
  int searchItem = int.parse(stdin.readLineSync()!);

  // Замер времени выполнения поиска
  DateTime startTime = DateTime.now();
  bool isFound = searchElement(randomArray, searchItem);
  DateTime endTime = DateTime.now();

  if (isFound) {
    print('Элемент $searchItem найден в массиве.');
  } else {
    print('Такого элемента в массиве нет.');
  }

  print('Время поиска элемента: ${endTime.difference(startTime).inMicroseconds} микросекунд.');

  stdout.write('Введите элемент для вставки: ');
  int insertItem = int.parse(stdin.readLineSync()!);

  // Замер времени выполнения вставки
  startTime = DateTime.now();
  List<int> newArray = insertElement(randomArray, insertItem);
  endTime = DateTime.now();

  print('Измененный массив после вставки: $newArray');
  print('Время вставки элемента: ${endTime.difference(startTime).inMicroseconds} микросекунд.');
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

List<int> insertElement(List<int> array, int element) {
  List<int> newArray = List.from(array);
  newArray.add(element);
  return newArray;
}
