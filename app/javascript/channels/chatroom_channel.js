import consumer from "./consumer";


const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  const contentForm = document.getElementById('message_content');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;
    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('afterbegin', data);
        contentForm.value = "";
      }
      });
    }
  }

export { initChatroomCable };
