modal
=====

A modal package for Meteor.

Explanation
-----------

It's intended to be used with the package ```miguelalarcos:simple-binding```. You use the package this way:

```coffee
    class A extends sb.Model
      @schema:
        x:
          type: sb.Integer
    onOk = (model) -> console.log model.x
    onCancel = -> console.log 'cancel'
    modal.show('modalInsertEvent', new A(x:8), onOk, onCancel)
```

where ```modal.show``` is ```modal.show = (template, model, onOkCallback, onCancelCallback) -> ...```

and the template:

```html
<template name="modalUpdateEvent">
    <div style="border: 2px solid seagreen; width: 500px;">
        <h3 sb sb-text="title"></h3>
        <input sb sb-bind="surname">
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

The ok callback is passed the model.

Issues
------

Currently, the first time the modal is shown, the model is not binding to the view. The solution at this time is to add the next code:

```coffee
Meteor.startup ->
  modal.show('modal2', new A {}, ok, cancel)
  modal.close()
```
