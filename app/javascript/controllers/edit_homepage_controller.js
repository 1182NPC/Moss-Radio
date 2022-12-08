import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-homepage"
export default class extends Controller {
  static targets = ["central_container", "chat", "showpage", "likes", "likebutton", "likeanimation"]

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
      .then((html) => {
        var parser = new DOMParser();
        var doc = parser.parseFromString(html, "text/html");
        this.central_containerTarget.innerHTML = ""
        this.central_containerTarget.appendChild(doc.getElementById("posts-view"));
        this.central_containerTarget.parentElement.scrollTo(0, 0)
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
      .then((html) => {
        var parser = new DOMParser();
        var doc = parser.parseFromString(html, "text/html");
        this.central_containerTarget.innerHTML = ""
        this.central_containerTarget.appendChild(doc.getElementById("radiosets-view"));
        this.central_containerTarget.parentElement.scrollTo(0, 0)
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
      .then((html) => {
        var parser = new DOMParser();
        var doc = parser.parseFromString(html, "text/html");
        this.central_containerTarget.innerHTML = ""
        this.central_containerTarget.appendChild(doc.getElementById("residents-view"));
        this.central_containerTarget.parentElement.scrollTo(0, 0)
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
      .then((html) => {
        var parser = new DOMParser();
        var doc = parser.parseFromString(html, "text/html");
        this.central_containerTarget.innerHTML = ""
        this.central_containerTarget.appendChild(doc.getElementById("blog-view"));
        this.central_containerTarget.parentElement.scrollTo(0, 0)
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
      .then((html) => {
        var parser = new DOMParser();
        var doc = parser.parseFromString(html, "text/html");
        this.central_containerTarget.innerHTML = ""
        this.central_containerTarget.appendChild(doc.getElementById("resident-show"));
        this.central_containerTarget.parentElement.scrollTo(0, 0)
    })
  }

  likepost(event) {
    const value = event.target.dataset.value
    const postlikeurl = `/posts/${value}/postlikes`
    fetch(postlikeurl, {
      method: "POST",
      headers: { "Accept": "application/json" },
    }).then(response => response.json()).then((result) => {
      console.log('Success:', result);
      this.likeanimationTarget.classList.add("animate__animated", "animate__tada")
      this.likesTarget.innerText = result.likes
      this.likebuttonTarget.style.display = "none";
    })
    .catch((error) => {
      console.error('Error:', error);
    });
  }

   show() {
    this.chatTarget.classList.toggle('active');
  }

}
