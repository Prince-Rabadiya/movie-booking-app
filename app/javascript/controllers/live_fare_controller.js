import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    fare: Number
  }

  connect() {
    this.updateTotalFare();
  }

  updateTotalFare() {
    const totalFareElement = document.getElementById('total-fare');
    const checkboxes = this.element.querySelectorAll('input[type="checkbox"]');
    let totalFare = 0;

    checkboxes.forEach(checkbox => {
      if (checkbox.checked) {
        const seatFare = this.fareValueForCheckbox(checkbox);
        totalFare += seatFare;
      }
    });

    totalFareElement.textContent = `Total Fare: ${totalFare}`;
  }

  fareValueForCheckbox(checkbox) {
    const fareValue = checkbox.getAttribute('data-live-fare-value');
    return fareValue ? parseInt(fareValue) : 0;
  }

  change(_event) {
    this.updateTotalFare();
  }
}