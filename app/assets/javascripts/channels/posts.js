ImgApp.posts = ImgApp.cable.subscriptions.create('PostChannel', {  

    received: function(data) {
      // debug
      // window.alert(data.post)

      $("#post").removeClass('hidden')
      
      return $('#post').append(this.renderMessage(data));
    },
  
    renderMessage: function(data) {    
      return "<p>" + data.post + "</p>";
    }

});  