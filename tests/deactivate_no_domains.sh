this_file=`basename "$0"`
tmp_file=$(mktemp /tmp/focus_test_${this_file}.XXXXXXXXXX)
tmp_file2=$(mktemp /tmp/focus_test_${this_file}.XXXXXXXXXX)

hosts_content=""

expected_output="No domains to deactivate."

echo $hosts_content >> $tmp_file

HOSTS_FILE=$tmp_file ./focus deactivate > $tmp_file2 2>&1

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
