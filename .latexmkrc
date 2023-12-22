#!/usr/bin/env perl
$latex = 'uplatex -kanji=utf-8 -synctex=1 %S';
$dvipdf = 'dvipdfmx -p a4 %S';
$bibtex = 'upbibtex';
$makeindex = 'mendex %O -o %D %S';
$pdf_mode = 3;
$pdf_update_method = 2;
$max_repeat = 5;

$pvc_view_file_via_temporary = 0;