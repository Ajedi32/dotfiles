# Enable the use of the `subl` command
subl () {
  subl_path='sublime_text'
  if test -t 0
  then
    "$subl_path" $*
  else
    timestamp=`date +%s`
    filename=$1
    shift
    if [ -z $filename ]; then filename=".temp$timestamp" ; fi
    touch "$filename"
    while read data
    do
      echo "$data" >> "$filename"
    done
    "$subl_path" "$filename" $*
    sleep 1
    rm "$filename"
  fi
}
