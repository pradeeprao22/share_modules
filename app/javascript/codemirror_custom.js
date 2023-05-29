document.addEventListener("DOMContentLoaded", () => {
    const htmlcode = $(".codemirror-textarea")[0];
    const editor = CodeMirror.fromTextArea(htmlcode, {
      lineNumbers: true,
      mode: "htmlmixed",
      htmlMode: true,
      tabMode: "indent",
    });
});

document.addEventListener("DOMContentLoaded", () => {
    const htmlcode = $(".code-textarea")[0];
    const editor = CodeMirror.fromTextArea(htmlcode, {
      lineNumbers: true,
      mode: "htmlmixed",
      htmlMode: true,
      tabMode: "indent",
    });
});

document.addEventListener("DOMContentLoaded", () => {
    const htmlcode = $(".code-backend")[0];
    const editor = CodeMirror.fromTextArea(htmlcode, {
      lineNumbers: true,
      mode: "htmlmixed",
      htmlMode: true,
      tabMode: "indent",
    });
});