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
    // disable:
  });
}

export { initFlatpickr };
