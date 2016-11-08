this_file=`basename "$0"`
tmp_file=$(mktemp /tmp/focus_test_${this_file}.XXXXXXXXXX)

hosts_content="127.0.0.2 example.com\n#focus#\n#127.0.0.2 twitter.com\n#eofocus#"
expected_content="\
127.0.0.2 example.com"

echo $hosts_content >> $tmp_file

HOSTS_FILE=$tmp_file ./focus remove twitter.com > /dev/null

contents=`cat $tmp_file`

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
