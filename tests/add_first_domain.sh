this_file=`basename "$0"`
tmp_file=$(mktemp /tmp/focus_test_${this_file}.XXXXXXXXXX)

HOSTS_FILE=$tmp_file ./focus add facebook.com > /dev/null

contents=`cat $tmp_file`
expected_contents="\
#focus#
#127.0.0.2 facebook.com
#eofocus#"

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
