#!/usr/bin/env bash
# This is based on Godot's clang-format.sh

# This script runs clang-format on all relevant files in the repo.
# This is the primary script responsible for fixing style violations.

set -uo pipefail

# Loop through all code files tracked by Git.
files=$(git ls-files -- '*.h' '*.cpp' ':!thirdparty')

if [ ! -z "$files" ]; then
    clang-format --Wno-error=unknown -i $files
fi

diff=$(git diff --color)

# If no diff has been generated all is OK, clean up, and exit.
if [ -z "$diff" ]; then
    printf "\e[1;32m*** Files in this commit comply with the clang-format style rules.\e[0m\n"
    exit 0
fi

# A diff has been created, notify the user, clean up, and exit.
printf "\n\e[1;33m*** The following changes must be made to comply with the formatting rules:\e[0m\n\n"
# Perl commands replace trailing spaces with `·` and tabs with `<TAB>`.
printf "$diff\n" | perl -pe 's/(.*[^ ])( +)(\e\[m)$/my $spaces="·" x length($2); sprintf("$1$spaces$3")/ge' | perl -pe 's/(.*[^\t])(\t+)(\e\[m)$/my $tabs="<TAB>" x length($2); sprintf("$1$tabs$3")/ge'

printf "\n\e[1;91m*** Please fix your commit(s) with 'git commit --amend' or 'git rebase -i <hash>'\e[0m\n"
exit 1
