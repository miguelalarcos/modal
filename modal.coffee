modal = {}

modal.modalShow = new ReactiveVar('')
modal.template = new ReactiveVar(null)
modal.data = new ReactiveVar(null)

modal.close = ->
  modal.modalShow.set ''

modal.show = (template, data, onOkCallback, onCancelCallback) ->
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
    if modal.onCancelCallback
      modal.onCancelCallback()
    modal.close()
  'click .ok': (e,t) ->
    dct = {}
    for el in t.findAll('textarea')
      name = $(el).attr('name')
      value = $(el).val()
      dct[name] = value
    for el in t.findAll('input')
      name = $(el).attr('name')
      value = $(el).val()
      dct[name] = value
    if modal.onOkCallback
      modal.onOkCallback(dct)
    modal.close()