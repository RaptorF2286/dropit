
import "jquery";
import "jquery-validation";

document.addEventListener("turbolinks:load", () => {
  console.log("Inicializando Formulario");
  const element = $("new_post");
  if (!element) return false;

  element.validate({
    rules: {
      title: {
        required: true,
      },
      short_title: {
        required: true,
      },
      short_description: {
        required: true,
      },
      location: {
        required: true,
      },
      color: {
        required: true,
      },
    },
  });
});