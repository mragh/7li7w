% FIND
% Some free Prolog tutorials
% A: http://www.cse.unsw.edu.au/~billw/prologdict.html
% A: http://www.csupomona.edu/~jrfisher/www/prolog_tutorial/contents.html
% Support forum
% https://groups.google.com/forum/#!forum/comp.lang.prolog
% An online reference for the Prolog version you're using
% A: http://www.gprolog.org/#manual
%DO
% Make a simple knowledge base. Represent some of your favorite books and authors
wrote(king, the_gunslinger).
wrote(king, it).
wrote(king, under_the_dome).
wrote(reynolds, revelation_space).
wrote(reynolds, absolution_gap).
wrote(vonnegut, slaughterhouse_five).
wrote(vonnegut, cats_cradle).
% Find all books in your knowledge base written by one author
% wrote(reynolds, X).  [then `a`]
% Make a knowledge base reprsenting musicians and instruments. Also represent musicians and their genre of music.
played(king, guitar).
played(hendrix, guitar).
played(davis, trumpet).
played(grohl, drums).
genre(hendrix, rock).
genre(davis, jazz).
genre(king, blues).
genre(grohl, rock).
% Find all musicians who play guitar.
% played(Musician, guitar). [then `a`]
