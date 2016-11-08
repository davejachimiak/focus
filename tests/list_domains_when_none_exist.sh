this_file=`basename "$0"`
tmp_file=$(mktemp /tmp/focus_test_${this_file}.XXXXXXXXXX)
tmp_file2=$(mktemp /tmp/focus_test_${this_file}.XXXXXXXXXX)

expected_output=""

echo $hosts_content >> $tmp_file

HOSTS_FILE=$tmp_file ./focus list > $tmp_file2 2>&1

output=`cat $tmp_file2`

if [ "$output" != "$expected_output" ]; then
  echo "Failure: $this_file."
  echo
  echo "expected output:"
  echo "$expected_output"
  echo 
  echo "got:"
  echo "$output"
  exit 1
fi
