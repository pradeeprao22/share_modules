$("#posts").click(function() {
    let url = "/posts"
    $.ajax({
        url: url,
        success: function(data) {
            console.log('success')
        },
        error: function() {
            console.log('failure')
        }
    });
})