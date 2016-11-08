this_file=`basename "$0"`
tmp_file=$(mktemp /tmp/focus_test_${this_file}.XXXXXXXXXX)

hosts_content="#focus#\n127.0.0.2 facebook.com\n#eofocus#"

expected_contents="\
#focus#
127.0.0.2 facebook.com
127.0.0.2 twitter.com
#eofocus#"

echo $hosts_content >> $tmp_file

HOSTS_FILE=$tmp_file ./focus add twitter.com > /dev/null

contents=`cat $tmp_file`

if [ "$contents" != "$expected_contents" ]; then
  echo "Failure: $this_file."
  echo
  echo "expected:"
  echo "$expected_contents"
  echo 
  echo "got:"
  echo "$contents"
  exit 1
fi
