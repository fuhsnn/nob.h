set -eu

all_tests() {
 for test_file in ../tests/*.c; do
  # win32 api
  if [[ $test_file == ../tests/win32_error.c ]]; then continue; fi
  # output unsorted (unstable for test)
  if [[ $test_file == ../tests/read_entire_dir.c ]]; then continue; fi

  $@ $test_file -I../ -o out && ./out
 done
}

(all_tests "$CC") 2>&1 | grep -v run_tests | md5sum | grep -q 31598b6b8755dd63e93158d1c8b47bd6
