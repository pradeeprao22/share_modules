LondevApp.messages = LondevApp.cable.subscriptions.create('MessagesChannel', {
    received: function(data){

    // id messages
    $("#messages").removeClass('hidden')

        return $('#messages').append(this.renderMessage(data));    
    
    },

    renderMessage: function(data) {
        var user = getCookie('verified_user')
        var cookie_user = parseInt(user)
        // console.log(data.current_user === u)
        // html 
        // <div class="incoming_msg_img"> <%= image_tag avatar_url(user), class: "card-type-icon with-border material-icons" %> </div>
    
        if (data.current_user === cookie_user){
            // return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
            return "<div class='outgoing_msg'><div class='sent_msg'><p>" + data.message + "</p><span class='time_date'>"  + data.created + "</span></div></div>";
            // } else if (data.user_rec === data.current_user) {  
            //  return "<div class='incoming_msg'><div class='received_msg'><div class='received_withd_msg'><p>" + data.message + "</p><span class='time_date'>"  + data.created + "</span></div></div></div>";
        } else {
            return "<div class='incoming_msg'><div class='incoming_msg_img'><img class='card-type-icon with-border material-icons' src='http://www.gravatar.com/avatar/9d496db5983cc0623a2c400e334382b3.jpg'></div><div class='received_msg'><div class='received_withd_msg'><p>" + data.message + "</p><span class='time_date'>"  + data.created + "</span></div></div></div>";
        }
    }

})