// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

const DEFAULTS = {
  title: "確認",
  button: "OK",
  cancel: "キャンセル",
  variant: "primary",
}

Turbo.config.forms.confirm = (message, formElement, submitter) => {
  const dialog = document.getElementById("confirm-modal")

  // submitter(ボタン)→ form の順で属性を探し、なければデフォルト
  const opt = (key) =>
    submitter?.dataset[key] ?? formElement?.dataset[key] ?? DEFAULTS[key.replace("confirm", "").toLowerCase()]

  dialog.querySelector('[data-modal="title"]').textContent = opt("confirmTitle")
  dialog.querySelector('[data-modal="message"]').textContent = message
  dialog.querySelector('[data-modal="cancel"]').textContent = opt("confirmCancel")

  const confirmButton = dialog.querySelector('[data-modal="confirm"]')
  confirmButton.textContent = opt("confirmButton")
  confirmButton.classList.add(`btn--${opt("confirmVariant")}`)  // btn-danger / btn-primary

  dialog.showModal()

  return new Promise((resolve) => {
    dialog.addEventListener("close", () => {
      resolve(dialog.returnValue === "confirm")
    }, { once: true })

    dialog.querySelectorAll("button[value]").forEach((button) => {
      button.addEventListener("click", () => dialog.close(button.value), { once: true })
    })
  })
}
