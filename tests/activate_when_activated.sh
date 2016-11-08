this_file=`basename "$0"`
tmp_file=$(mktemp /tmp/focus_test_${this_file}.XXXXXXXXXX)

hosts_content="127.0.0.2 example.com\n\n#focus#\n127.0.0.2 facebook.com\n#eofocus#"

expected_contents="\
127.0.0.2 example.com

#focus#
127.0.0.2 facebook.com
#eofocus#"

echo $hosts_content >> $tmp_file

HOSTS_FILE=$tmp_file ./focus activate > /dev/null

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
