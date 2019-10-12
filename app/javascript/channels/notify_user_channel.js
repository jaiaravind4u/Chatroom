import consumer from "./consumer"

consumer.subscriptions.create("NotifyUserChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data);
    if(Notification.permission === 'granted') {
      let title = data.title
      let options = {
        body: data.body
      }
      console.log(data);
      let notification = new Notification(title, options);
    } else {
      Notification.requestPermission();
    }
  }
});
