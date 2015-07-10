modal
=====

A modal package for Meteor.

Explanation
-----------

It's intended to be used with the package ```miguelalarcos:simple-binding```. You use the package this way:

```html
<body>
    {{> sbT template='demo' model=myModel }}
    {{> modal }}
</body>

<template name="demo">
    <input sb sb-bind="title">
    <button sb sb-click="ok">ok</button>
</template>

<template name="modal2">
    <div style="border: 2px solid seagreen; width: 500px;">
        <input sb sb-bind="x">
        <div sb sb-text="x"></div>
        <div>
            <div class="ui black cancel button">
                cancel
            </div>
            <div class="ui positive right labeled icon button ok">
                ok
                <i class="checkmark icon"></i>
            </div>
        </div>
    </div>
</template>
```

```coffee
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
```  

where ```modal.show``` is ```modal.show = (template, model, onOkCallback, onCancelCallback) -> ...```

