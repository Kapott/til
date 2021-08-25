# Progress spinner in bash

Sometimes you just want someone to see your script is doing some work. Here you go.

```bash
sp="/-\|"
sc=0
spin() {
   printf "\b${sp:sc++:1}"
   ((sc==${#sp})) && sc=0
}
endspin() {
   printf "\r%s\n" "$@"
}

until work_done; do
   spin
   some_work ...
done
endspin
```