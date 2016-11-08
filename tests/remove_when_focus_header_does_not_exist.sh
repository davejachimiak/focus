this_file=`basename "$0"`
tmp_file=$(mktemp /tmp/focus_test_${this_file}.XXXXXXXXXX)
tmp_file2=$(mktemp /tmp/focus_test_${this_file}.XXXXXXXXXX)

hosts_content="127.0.0.2 facebook.com"

echo $hosts_content >> $tmp_file

HOSTS_FILE=$tmp_file ./focus remove twitter.com 2> $tmp_file2

output=`cat $tmp_file2`
expected_output="twitter.com not in focus."

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

