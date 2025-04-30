#!/bin/bash
if [ -e "compile_commands.json" ]; then
    rm -rf compile_commands.json
    rm .clangd
fi

linux_command='python ~/lsp_config/gen_compile_commands.py'

cwd="$(pwd)"

eval $linux_command
sed -i 's/-mips32r2 -EL -msoft-float//g' $cwd/compile_commands.json
echo -e "CompileFlags:" > .clangd
echo -e "\tAdd: \n\t\t\"-ferror-limit=0\"" >> $cwd/.clangd
echo -ne "\tRemove: \n\t\t[" >> $cwd/.clangd
echo -ne "\"-mips32r2\", " >> .clangd
echo -ne "\"-fconserve-stack\", " >> .clangd
echo -ne "\"-fno-var-tracking-assignments\", " >> .clangd
echo -ne "]" >> $cwd/.clangd

#jq -s add **/*.json > merged.json
