// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `rails generate channel` command.
//
//= require action_cable
//= require_self
//= require_tree ./channels

(function() {
  this.App || (this.App = {});

  App.cable = ActionCable.createConsumer();

}).call(this);

$(document).on('turbolinks:load', function() {
  if (App.posts) {
    return App.posts.followVisibleprojects();
  }
});

App.posts = App.cable.subscriptions.create("postsChannel", {
  collection: function() {
    return $('.posts-box');
  },
  connected: function() {
    return setTimeout((function(_this) {
      return function() {
        return _this.followVisibleprojects();
      };
    })(this), 1000);
  },
  followVisibleposts: function() {
    var i, len, results, post, posts;
    posts = this.collection().map(function() {
      return $(this).attr('data-post');
    }).get();
    if (posts.length > 0) {
      results = [];
      for (i = 0, len = posts.length; i < len; i++) {
        post = posts[i];
        results.push(this.perform('follow', {
          post_id: post
        }));
      }
      return results;
    } else {
      return this.perform('unfollow');
    }
  },
  disconnected: function() {
    return this.perform('unfollow');
  },
  received: function(data) {
    var box;

    console.log("[ActionCable] [post] [" + data.id + "]", data);
    
    box = $(".post-box[data-post='" + data.id + "']");
    
    if (box) {
      return box.find('.box-body').first().replaceWith(data.html);
    }
    
  }
});
