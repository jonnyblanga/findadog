import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

flatpickr(".datepicker", {
    dateFormat: "Y-m-d",
    minDate: "2000-01-01",
    maxDate: "today"
})
