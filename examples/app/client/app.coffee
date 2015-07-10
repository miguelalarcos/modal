class A extends sb.Model
  @schema:
    x:
      type: sb.Integer

class B extends sb.Model
  @schema:
    title:
      type: String
  ok: ->
    model = new A(x:8)
    ok = -> console.log model.x
    cancel = -> console.log 'cancel'
    modal.show('modal2', model, ok, cancel)

Template.body.helpers
  myModel: -> new B(title: 'insert coin')