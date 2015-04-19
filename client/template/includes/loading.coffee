Template.loading.rendered = ->
  if ( ! Session.get('loadingSplash') )
    @loading = window.pleaseWait
      logo: '/meteor-icon.png'
      backgroundColor: '#282753'
      loadingHtml: message + spinner

    Session.set('loadingSplash', true) # just show loading splash once

Template.loading.destroyed = ->
  if ( @loading )
    @loading.finish()

message = '<p class="loading-message">Cargando...</p>'
spinner = '<div class="spinner">
<div class="rect1"></div>
<div class="rect2"></div>
<div class="rect3"></div>
<div class="rect4"></div>
<div class="rect5"></div>
</div>'