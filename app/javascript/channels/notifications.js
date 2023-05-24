LondevApp.notifications = LondevApp.cable.subscriptions.create('NotificationsChannel', {
    
    received: function(data){
        console.log(data)

    $("#notifications").removeClass('hidden')
        return $('#notifications').append(this.renderMessage(data));    
    },

    renderMessage: function(data) {
    
    //console.log(data)
    //var allcookies = document.cookie;
    //cookiearray = allcookies.split(';');
    //var user = getCookie('verified_user')

    return "<div class='border-card'><div class='content-wrapper'><p class='title'>"+ data.message + "</p><p class='title'>" +  data.created + "</p></div><i class='material-icons end-icon'>more_vert</i></div>";

    }
  }
)



