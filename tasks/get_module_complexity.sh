cd /etc/puppetlabs/code/environments/$PT_code_environment
echo lines words modulename
find *modules/* -prune -type d | while IFS= read -r d; do
    echo "$(find $d/ -name '*.pp' -or -name '*.erb' -or -name '*.epp' -or -name '*.rb' | xargs cat | wc -l) $(find $d/ -name '*.pp' -or -name '*.erb' -or -name '*.epp' -or -name '*.rb' | xargs cat | wc -w) $d"
done