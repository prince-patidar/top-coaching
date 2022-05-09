import consumer from "./consumer"

document.addEventListener('turbolinks:load', () =>{
  
  consumer.subscriptions.create("NotificationChannel", {
    connected() {
      // Called when the subscription is ready for use on the server
      console.log("Connected to NotificationChannel");
    },
    
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
    
    received(data) {
      // Called when there's incoming data on the websocket for this channel
      
      const unread_notifications = document.getElementById(`unread_notifications${data.user_id}`);
      const unread_notification_counts = document.getElementById(`unread_notification_counts${data.user_id}`);
      unread_notification_counts.innerHTML = parseInt(unread_notification_counts.innerHTML) + 1;
      unread_notifications.innerHTML +=
      `<li class="dropdown-item">
        <a href="notification_recipient_copies/${data.notification.id}" class="dropdown-item-text waves-effect waves-light unread">${data.notification.title}</a>
        <a href="/notification_recipient_copies/${data.id}" data-method="delete" ><i class="fas fa-solid fa-trash delete-notification"></i></a>
      </li>`
    }
  })
})
