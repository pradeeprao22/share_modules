$("#users-search #term").on("keyup", () => {
  const jqxhr = $.get(
    $("#users-search").attr("action"),
    { term: $("#users-search #term").val() },
    () => {
      const result = $("#users-result").html();
      if (!result) {
        $("#users-search #term").popover({
          content: "No result found.",
          placement: "bottom",
          html: true,
          trigger: "focus",
        });
      } else {
        $("#users-search #term").popover({
          content: $("#users-result"),
          placement: "bottom",
          html: true,
          trigger: "focus",
        });
      }
      $("#users-search #term").popover("show");
    }
  );
});