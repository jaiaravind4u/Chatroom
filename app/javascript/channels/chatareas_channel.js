import consumer from "./consumer"

const chatarea_channel = consumer.subscriptions.create("ChatareasChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  speak: (chatarea_id, body) => {
    // Called when the subscriptions spits a message
    chatarea_channel.perform("speak", {chatarea_id: chatarea_id, body: body});
  },

  received(data) {
    let active_channel = $(`[data-behaviour='messages'][data-chatarea-id='${data.chatarea_id}']`);

    // if the channel is not active, then update respective channel about the information
    if (active_channel.length > 0) {
      let usernameTag = `<small class="d-block mt-2">${data.username}</small>`
      $(active_channel).append(data.message);

      // auto generated message would have different look and feel
      if(!data.is_auto_generated) {
        let messageContainer = $(`#message-${data.message_id}`);

        // check for the sender of the message before appending the css
        if ($(active_channel)[0].getAttribute('data-user-id') == data.current_user_id) {
          $(messageContainer).addClass("chat-message-self bg-info")
        } else {
          $(usernameTag).insertBefore($(messageContainer));
          $(messageContainer).addClass("bg-light");
        }

      }

      let scrollEl = $("#chat-area-section");

      if ($(scrollEl).length > 0) {
        scrollEl.animate({
          scrollTop: scrollEl.get(0).scrollHeight
        }, 100);
      }
    } else {
      $(`[data-behaviour='chatarea-link'][data-chatarea-id='${data.chatarea_id}']`).addClass("unread-status");
    }

    // update the short message for each conversation
    $(`#conversation-short-message-${data.chatarea_id}`).html(data.short_message)

    // check for messsage inactivity. would be better to be written as a background job.
    if(!data.is_auto_generated) {
      setTimeout(() => {
        fetch(`/chatareas/${data.chatarea_id}/messages/${data.message_id}/ping`);
      }, 30000)
    }
  }
});

export default chatarea_channel;