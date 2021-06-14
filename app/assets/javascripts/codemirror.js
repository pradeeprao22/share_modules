$(document).ready(function(){
    var code = $(".codemirror-textarea")[0];
    var editor = CodeMirror.fromTextArea(code, {
        lineNumbers : true,
        mode: "htmlmixed",
        htmlMode: true,
        tabMode: "indent"
    });
});

$(document).ready(function(){
    var code = $(".code-textarea")[0];
    var editor = CodeMirror.fromTextArea(code, {
        lineNumbers : true,
        mode: "css",
        tabMode: "indent"
    });
});

$(document).ready(function(){
    var code = $(".code-backend")[0];
    var editor = CodeMirror.fromTextArea(code, {
        lineNumbers : true,
        mode: "javascript",
        tabMode: "indent"
    });
});

$(document).ready(function(){
    var code = $(".code-backend-2")[0];
    var editor = CodeMirror.fromTextArea(code, {
        lineNumbers : true,
        mode: "javascript",
        tabMode: "indent"
    });
});