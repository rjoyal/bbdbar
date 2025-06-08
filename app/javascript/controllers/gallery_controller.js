// app/javascript/controllers/gallery_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["thumbnail", "modal", "modalImage"]

    connect() {
        console.log("Gallery controller connected")
    }

    showLarge(event) {
        event.preventDefault()
        const imageUrl = event.currentTarget.querySelector('img').src
        const largeImageUrl = imageUrl.replace('/thumb/', '/gallery/')

        this.modalImageTarget.src = largeImageUrl
        this.modalTarget.classList.remove('hidden')
        document.body.classList.add('overflow-hidden')
    }

    closeModal() {
        this.modalTarget.classList.add('hidden')
        document.body.classList.remove('overflow-hidden')
    }

    // Close modal when clicking outside the image
    modalClick(event) {
        if (event.target === this.modalTarget) {
            this.closeModal()
        }
    }
}