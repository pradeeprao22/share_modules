ImgApp.posts = ImgApp.cable.subscriptions.create('PostsChannel', {  
    
    received: function(data) {
      $("#posts").removeClass('hidden')
      return $('#posts').append(this.renderMessage(data));
    },
  
    renderMessage: function(data) {
      return "<p> <b>" + data.user + ": </b>" + data.content + "</p>";
    }

});  