// app/javascript/plugins/flatpickr.js
import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const initFlatpickr = () => {
  flatpickr("#range_start", {
    altInput: true,
    altFormat: "F j, Y",
    dateFormat: "Y-m-d",
    minDate: "today",
    plugins: [new rangePlugin({ input: "#range_end"})],
  });
}

const initFlatpickrWithBookedDays = (booked) => {
  flatpickr("#range_start", {
    altInput: true,
    altFormat: "F j, Y",
    dateFormat: "Y-m-d",
    minDate: "today",
    plugins: [new rangePlugin({ input: "#range_end"})],
    disable: booked
  });
}

const makeCalendar = () => {
  const bookingForm = document.getElementById('booking_form');
    if (bookingForm) {
      const booked = JSON.parse(bookingForm.dataset.booked);
      // check if booked is empty
      if (Object.keys(booked).length === 0)
        { initFlatpickr(); }
      else
        { initFlatpickrWithBookedDays(booked) }
    }
}

export { makeCalendar };
