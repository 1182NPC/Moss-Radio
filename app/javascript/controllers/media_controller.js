import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="media"
export default class extends Controller {
  static targets = ["player", "icon", "slider"]


  connect() {
    console.log('connected')
  }

  play() {
    if (this.iconTarget.classList.contains("fa-play")) {
    this.playerTarget.play()
    this.iconTarget.classList.remove("fa-play")
    this.iconTarget.classList.add("fa-pause")
    } else {
    this.playerTarget.pause()
    this.iconTarget.classList.remove("fa-pause")
    this.iconTarget.classList.add("fa-play")
    }
  }

  volume() {
    this.playerTarget.volume = this.sliderTarget.value / 100
  }
}
