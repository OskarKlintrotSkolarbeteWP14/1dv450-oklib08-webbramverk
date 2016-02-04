$("#app_menu > a").each(function () {
  if ($(this)[0].pathname === window.location.pathname)
    $(this).addClass("active")
  else
    $(this).removeClass("active")
})
