modal
=====

A modal package for Meteor.

Explanation
-----------

You use the package this way:

```coffee
    ...
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

The ok callback is passed an object result of the next code:

```coffee
  'click .ok': (e,t) ->
    if modal.onOkCallback
      modal.onOkCallback(this.model)
    modal.close()
```