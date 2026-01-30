mustache = require([process.cwd(), 'node_modules', 'mustache'].join('/'));

fs = require('fs');

var readedFileCount = 0;
var TOTAL_FILES_TO_READ = 2;

var dataTemplateBook;
var dataJsonStr;
var dataJson;

fs.readFile('src/books.html', 'utf8', function (err, fileContent) {
    
    if (err) {
        return console.log(err);
    }
    readedFileCount++;
    dataTemplateBook = fileContent;

    compilePages();
});

fs.readFile('src/data.json', 'utf8', function (err, fileContent) {
    
    if (err) {
        return console.log(err);
    }
    readedFileCount++;
    dataJsonStr = fileContent;

    compilePages();
});

function compilePages(){

    if(readedFileCount != TOTAL_FILES_TO_READ){
        return;
    }

    dataJson = JSON.parse(dataJsonStr);

    mustache.escape = function (text) { return text; };

    renderPage(dataTemplateBook, "books");
}

function renderPage(dataTemplate, file){

    var renderedPage = mustache.render(dataTemplate, dataJson);

    fs.writeFile('./../docs/' + file + '.md', renderedPage, function (err) {
        if (err) return console.log(err);
    });
}
