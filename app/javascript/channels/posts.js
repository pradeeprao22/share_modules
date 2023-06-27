import consumer from "./consumer"

consumer.subscriptions.create("PostChannel",{
    received(data) {

      $("#post").removeClass('hidden')
      
      return $('#post').append(this.renderMessage(data));
    },
    renderMessage(data) {    
      return "<p>" + data.post + "</p>";
    }
})