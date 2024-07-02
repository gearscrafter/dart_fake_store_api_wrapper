#!/bin/bash
PROJECT_DIR=$(pwd)
# Lista de todos los archivos de prueba en el directorio test
tests=(
  "test/domain/repositories/cart_repository_test.dart"
  "test/domain/repositories/product_repository_test.dart"
  "test/infrastructure/datasources/remote_data_source_test.dart"
)

# Verificar la existencia de los archivos de prueba
for test in "${tests[@]}"; do
  if [[ ! -f $PROJECT_DIR/$test ]]; then
    echo "Error: Test file $test does not exist."
    exit 1
  fi
done

# Ejecutar pruebas unitarias
for test in "${tests[@]}"; do
  echo "Running unit test $test..."
  (cd $PROJECT_DIR && flutter test $test)
done
