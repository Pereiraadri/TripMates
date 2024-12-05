pin "flatpickr", to: "https://cdn.jsdelivr.net/npm/flatpickr@4.6.9/dist/flatpickr.min.js"
# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "flatpickr" # @4.6.13
pin "@stimulus-components/clipboard", to: "@stimulus-components--clipboard.js" # @5.0.0
pin "sortablejs" # @1.15.6
pin "stimulus-confetti" # @1.0.1
pin "canvas-confetti" # @1.9.3
