// mendefinisikan fungsi
int factorial(int number) {
  if (number <= 0) {
    // termination case
    return 1;
  } else {
    // function invokes itself
    return number * factorial(number - 1);
  }
}

// memanggil fungsi
void main() {
  print(factorial(6));
}

// mengembalikan nilai
int factorialReturn(int number) {
  if (number <= 0) {
    return 1;
  } else {
    return number * factorialReturn(number - 1);
  }
}

// menambahkan parameter
int factorialWithParameter(int number) {
  if (number <= 0) {
    return 1;
  } else {
    return number * factorialWithParameter(number - 1);
  }
}