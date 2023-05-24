$(document).ready(function() {
    var htmlcode = $(".codemirror-textarea")[0];
    var editor = CodeMirror.fromTextArea(htmlcode, {
        lineNumbers : true,
        mode: "htmlmixed",
        htmlMode: true,
        tabMode: "indent"
    });
});

$(document).ready(function() {
    var csscode = $(".code-textarea")[0];
    var editor = CodeMirror.fromTextArea(csscode, {
        lineNumbers : true,
        mode: "css",
        tabMode: "indent"
    });
});

$(document).ready(function() {
    var baccode = $(".code-backend")[0];
    var editor = CodeMirror.fromTextArea(baccode, {
        lineNumbers : true,
        mode: "javascript",
        tabMode: "indent"
    });
});