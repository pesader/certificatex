while IFS= read -r line; do
    echo "$line" > name.txt

    # remove whitespace
    filename="${line// /_}"

    # go to lowercase
    filename=$(echo "$filename" | awk '{print tolower($0)}')

    # compile document
    pdflatex --output-directory ./build -jobname="$filename" main.tex
    pdflatex --output-directory ./build -jobname="$filename" main.tex

done < names.txt

# clear residues
rm build/*log
rm build/*aux
rm name.txt
