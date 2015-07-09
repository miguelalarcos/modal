class A extends sb.Model
  @schema:
    x:
      type: sb.Integer

ok = (x) -> console.log x.x
cancel = -> console.log 'cancel'
modal.show('modal2', new A {}, ok, cancel)
modal.close()

Template.body.events
  'click button': (e,t)->
    modal.show('modal2', new A(x:12), ok, cancel)
