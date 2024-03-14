import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

export default class extends Controller {
  connect() {
    const date = new Date()
    flatpickr(this.element, {
      enableTime: true,
      minDate: "today",
      maxDate: date.fp_incr(14),
      minTime: date.getHours() + ":" + date.getMinutes(),
    });
  }
}