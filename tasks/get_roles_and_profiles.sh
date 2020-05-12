cd /etc/puppetlabs/code/environments/$PT_code_environment
find *modules/{profile,role}/manifests -name *.pp -exec wc -l {} \;
