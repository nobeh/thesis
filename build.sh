#!/bin/bash

# Commands
CMD_LATEX="latex -interaction=batchmode -halt-on-error -shell-escape -enable-write18"
CMD_PDFLATEX="pdflatex -interaction=batchmode -halt-on-error -shell-escape -enable-write18"
CMD_BIB="biber"

# Cleans LaTeX files
function clean {
   echo "Cleaning ... "
   echo -n "      "
   if [[ -f ".gitignore" ]]; then
      for f in $(cat .gitignore); do
         [[ -f $f && $f != ".todo.md" ]] && rm -rf "$f" && echo -n "$f "
      done 
   fi
   echo ""
   echo ""
}

# Build the LaTeX documents
function build {
   tex_file="$1"
   bib_file="$2"
   tex_file_name="$(basename ${tex_file})"
   tex_file_name="${tex_file_name%.*}"

   [[ -f "${tex_file_name}.pdf" ]] && rm "${tex_file_name}.pdf"
   [[ -f "${tex_file_name}.dvi" ]] && rm "${tex_file_name}.dvi"

   $CMD_PDFLATEX "${tex_file}"
   $CMD_BIB "${tex_file_name}"
   $CMD_PDFLATEX "${tex_file}"
   $CMD_PDFLATEX "${tex_file}"
}

# Main
clean
build "thesis.tex" "refs/refs"
exit 0
