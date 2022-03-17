
$(document).on("turbolinks:load",
    function() {
    var htmlcode = $(".codemirror-textarea")[0];
    console.log(htmlcode)
    var editor = CodeMirror.fromTextArea(htmlcode, {
        lineNumbers : true,
        mode: "htmlmixed",
        htmlMode: true,
        tabMode: "indent"
    });
}
);

$(document).on("turbolinks:load",
    function() {
    var csscode = $(".code-textarea")[0];
    var editor = CodeMirror.fromTextArea(csscode, {
        lineNumbers : true,
        mode: "css", 
        tabMode: "indent"
    });
    }
);

$(document).on("turbolinks:load",
    function() {
    var baccode = $(".code-backend")[0];
    var editor = CodeMirror.fromTextArea(baccode, {
        lineNumbers : true,
        mode: "javascript",
        tabMode: "indent"
    });
});

// $("posts.module_post").ready(
//     function() {
//     var bactcode = $(".code-backend-2")[0];
//     var editor = CodeMirror.fromTextArea(bactcode, {
//         lineNumbers : true,
//         mode: "javascript",
//         tabMode: "indent"
//     });
// });