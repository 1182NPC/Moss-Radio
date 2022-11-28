import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "homepage", id: this.chatroomIdValue },
      { received: data => this.messagesTarget.insertAdjacentHTML("beforeend", data) }
    )
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Disconnected from the chatroom")
    this.channel.unsubscribe()
  }
}
