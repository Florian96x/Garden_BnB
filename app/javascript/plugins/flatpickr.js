// app/javascript/plugins/flatpickr.js
import flatpickr from "flatpickr";
// import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    altInput: true,
    altFormat: "F j, Y",
    dateFormat: "Y-m-d",
    minDate: "today",
  });
}


// const initFlatpickr = () => {
//   flatpickr("#range_start", {
//     altInput: true,
//     plugins: [new rangePlugin({ input: "#range_end"})]
//   });
// }

export { initFlatpickr };