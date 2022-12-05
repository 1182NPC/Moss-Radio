import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-homepage"
export default class extends Controller {
  static targets = ["central_container", "chat"]

  connect() {
    console.log("controller is here!")
  }


  blog(event) {
    event.preventDefault()
    const url = "/posts"
    fetch(url, {
      method: "GET",
      headers: { "Accept": "text/html" }
    })
      .then(response => response.text())
      .then((data) => {
        this.central_containerTarget.innerHTML = data
      })

  }

  radiosets(event) {
    event.preventDefault()
    const url = "/radiosets"
    fetch(url, {
      method: "GET",
      headers: { "Accept": "text/html" }
    })
      .then(response => response.text())
      .then((data) => {
        this.central_containerTarget.innerHTML = data
      })

  }

  residentlist(event) {
    event.preventDefault()
    const url = "/residents"
    fetch(url, {
      method: "GET",
      headers: { "Accept": "text/html" }
    })
      .then(response => response.text())
      .then((data) => {
        this.central_containerTarget.innerHTML = data
      })
  }


  post(event) {
    const value = event.target.dataset.value
    console.log(value)
    const url = `/posts/${value}`
    fetch(url, {
      method: "GET",
      headers: { "Accept": "text/html" }
    })
      .then(response => response.text())
      .then((data) => {
        this.central_containerTarget.innerHTML = data
      })
  }

  resident(event) {
    const value = event.target.dataset.value
    console.log(value)
    const url = `/residents/${value}`
    fetch(url, {
      method: "GET",
      headers: { "Accept": "text/html" }
    })
      .then(response => response.text())
      .then((data) => {
        this.central_containerTarget.innerHTML = data
      })
  }

  likepost(event) {
    const value = event.target.dataset.value
    console.log(value)
    const postlikeurl = `/posts/${value}/postlikes`
    fetch(postlikeurl, {
      method: "POST",
      headers: { "Accept": "text/html" }
    })
    this.post(event)
  }

   show() {
    this.chatTarget.classList.toggle('active');
  }



}
