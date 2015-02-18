modal = {}

modal.modalShow = new ReactiveVar('')
modal.template = new ReactiveVar(null)
modal.data = new ReactiveVar(null)

modal.close = ->
  modal.modalShow.set ''

modal.render = (template, data, onOkCallback, onCancelCallback) ->
  modal.onOkCallback = onOkCallback
  modal.onCancelCallback = onCancelCallback
  modal.modalShow.set 'show'
  modal.template.set template
  modal.data.set data

Template.modal.helpers
  modalShow: -> modal.modalShow.get()
  template: -> modal.template.get()
  data: -> modal.data.get()

Template.modal.events
  'click .cancel': (e,t) ->
    modal.close()
  'click .ok': (e,t) ->
    modal.close()