this_file=`basename "$0"`
tmp_file=$(mktemp /tmp/focus_test_${this_file}.XXXXXXXXXX)
tmp_file2=$(mktemp /tmp/focus_test_${this_file}.XXXXXXXXXX)

hosts_content="#focus#\n#127.0.0.2 facebook.com\n#eofocus#"
expected_content="\
#focus#
#127.0.0.2 facebook.com
#eofocus#"

expected_output="facebook.com is already in focus."

echo $hosts_content >> $tmp_file

HOSTS_FILE=$tmp_file ./focus add facebook.com 2> $tmp_file2

contents="`cat $tmp_file`"
output=`cat $tmp_file2`

if [ "$contents" != "$expected_content" ]; then
  echo "Failure: $this_file."
  echo
  echo "expected hosts contents:"
  echo "$expected_content"
  echo 
  echo "got:"
  echo "$contents"
  exit 1
fi

if [ "$output" != "$expected_output" ]; then
  echo "Failure: $this_file."
  echo
  echo "expected stderr output"
  echo "$expected_output"
  echo 
  echo "got:"
  echo "$output"
  exit 1
fi
