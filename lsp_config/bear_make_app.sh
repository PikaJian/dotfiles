#!/bin/bash
if [ -e "compile_commands.json" ]; then
    make clean
    rm -rf compile_commands.json
    rm .clangd
fi
bear_command='bear -l /home/pikajian/software_packages/usr/lib/x86_64-linux-gnu/bear/libear.so'

cwd="$(pwd)"

eval $bear_command make $1 $2
sed -i 's/-mips32r2 -EL -msoft-float//g' $cwd/compile_commands.json
echo -e "CompileFlags:" >> .clangd
echo -e "\tAdd: \n\t\t\"-ferror-limit=0\"" >> $cwd/.clangd
echo -e "\tRemove: \n\t\t\"-mips32r2\"" >> $cwd/.clangd

#jq -s add **/*.json > merged.json
