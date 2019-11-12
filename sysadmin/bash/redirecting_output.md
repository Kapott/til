# Redirecting output

Redirect output to file

    wine "foo.exe" > output.txt

Redirect output, append to file if it exists

    wine "foo.exe" >> output.txt

Redirect output and errors to file

    wine "foo.exe" &> output.txt

Redirect output and errors, append to file if it exists

    wine "foo.exe" &>> output.txt

Redirect output and errors to a file, and background the called process

    wine "foo.exe" > output.txt 2&>1 &
