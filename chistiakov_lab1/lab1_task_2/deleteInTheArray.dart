import 'dart:io';
import 'dart:math';

void main() {
  stdout.write('Введите размер массива: ');
  int size = int.parse(stdin.readLineSync()!);

  List<int> randomArray = generateRandomArray(size);
  print('Сгенерированный массив: $randomArray');

  // Поиск элемента
  stdout.write('Введите элемент для поиска: ');
  int searchItem = int.parse(stdin.readLineSync()!);
  searchElementAndMeasureTime(randomArray, searchItem);

  // Вставка элемента
  stdout.write('Введите элемент для вставки: ');
  int insertItem = int.parse(stdin.readLineSync()!);
  insertElementAndMeasureTime(randomArray, insertItem);

  // Удаление элемента
  stdout.write('Введите элемент для удаления: ');
  int deleteItem = int.parse(stdin.readLineSync()!);
  deleteElementAndMeasureTime(randomArray, deleteItem);
}

List<int> generateRandomArray(int size) {
  Random random = Random();
  List<int> array = List.generate(size, (index) => random.nextInt(100));
  return array;
}

void searchElementAndMeasureTime(List<int> array, int target) {
  DateTime startTime = DateTime.now();
  bool isFound = searchElement(array, target);
  DateTime endTime = DateTime.now();

  if (isFound) {
    print('Элемент $target найден в массиве.');
  } else {
    print('Такого элемента в массиве нет.');
  }

  print('Время поиска элемента: ${endTime.difference(startTime).inMicroseconds} микросекунд.');
}

void insertElementAndMeasureTime(List<int> array, int element) {
  DateTime startTime = DateTime.now();
  List<int> newArray = insertElement(array, element);
  DateTime endTime = DateTime.now();

  print('Измененный массив после вставки: $newArray');
  print('Время вставки элемента: ${endTime.difference(startTime).inMicroseconds} микросекунд.');
}

void deleteElementAndMeasureTime(List<int> array, int element) {
  DateTime startTime = DateTime.now();
  List<int> newArray = deleteElement(array, element);
  DateTime endTime = DateTime.now();

  print('Измененный массив после удаления: $newArray');
  print('Время удаления элемента: ${endTime.difference(startTime).inMicroseconds} микросекунд.');
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

List<int> deleteElement(List<int> array, int element) {
  List<int> newArray = List.from(array);
  newArray.remove(element);
  return newArray;
}
