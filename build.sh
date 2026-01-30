setLanguageOfPage(){
    PAGE_HTML_FILE_NAME=$1
    NEW_LANG_SHORT=$2
    sed -i -e 's/html lang=\"en\"/html lang=\"'$NEW_LANG_SHORT'\"/' "./site/$PAGE_HTML_FILE_NAME.html"
}

# install dependencies
pip3 install mkdocs-material
pip3 install mkdocs-enumerate-headings-plugin
pip3 install mkdocs-material-extensions

# update the dependencies
pip3 install --upgrade mkdocs-material
pip3 install --upgrade mkdocs-enumerate-headings-plugin
pip3 install --upgrade mkdocs-material-extensions

# generate markdown from doc
cd json_to_markdown_generator
npm run build

# generate web site from markdown
cd ..
$HOME/.local/bin/mkdocs build

cp "index.html" "./site/index.html"

setLanguageOfPage dillerin_ilginc_yapilari tr
setLanguageOfPage university_autonomy el
setLanguageOfPage art_movements tr
setLanguageOfPage what_time_is_it tr
setLanguageOfPage yalnizlik_paylasilmaz tr
setLanguageOfPage art_online_news tr
setLanguageOfPage dillerin_ilginc_yapilari tr
setLanguageOfPage hsts tr
setLanguageOfPage yazilim_lisanslari tr
setLanguageOfPage block_cypher tr

# Test locally
$HOME/.local/bin/mkdocs serve
