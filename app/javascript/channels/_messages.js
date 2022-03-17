
import consumer from "./consumer"

//consumer.subscriptions

consumer.subscriptions.create('MessagesChannel', {
    
    received: function(data){

    // id messages
    $("#messages").removeClass('hidden')

        return $('#messages').append(this.renderMessage(data));    
    
    },

    renderMessage: function(data) {


        console.log(data.verified_user)
        console.log(data.user_rec)
        console.log(data.user_send)


        console.log(data.verified_user === data.user_rec)

        console.log(data.verified_user === data.user_send)
        //  html 
        if (data.verified_user === data.user_send){

            // return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
            return "<div class='outgoing_msg'><div class='sent_msg'><p>" + data.message + "</p><span class='time_date'>"  + data.created + "</span></div></div>";

       // } else if (data.user_rec === data.current_user) { 
        
         //   return "<div class='incoming_msg'><div class='received_msg'><div class='received_withd_msg'><p>" + data.message + "</p><span class='time_date'>"  + data.created + "</span></div></div></div>";

        } else if (data.verified_user === data.user_rec) {

            return "<div class='incoming_msg'><div class='received_msg'><div class='received_withd_msg'><p>" + data.message + "</p><span class='time_date'>"  + data.created + "</span></div></div></div>";
        } else {

            return "ERROR"
        }
    }

})