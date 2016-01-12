#!/bin/bash

# Commands
CMD_LATEX="latex -interaction=batchmode -halt-on-error -shell-escape -enable-write18"
CMD_PDFLATEX="pdflatex -interaction=batchmode -halt-on-error -shell-escape -enable-write18"
CMD_BIB="bibtex"

# Cleans LaTeX files
function clean {
   if [[ -f ".gitignore" ]]; then
      for f in $(cat .gitignore); do
         [[ -f $f && $f != ".todo.md" ]] && rm $f
      done 
   fi
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
build "thesis.tex" "refs/mrefs"
clean
exit 0
