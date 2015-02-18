modal
=====

A modal package for Meteor.

Explanation
-----------

You use the package this way:

```coffee
    ...
    onOk = (text) ->xCalendar.update(_id, {text: text, status: 'pending'})
    onCancel = -> xCalendar.remove _id
    modal.render('modalInsertEvent', event, onOk, onCancel)
```

where ```modal.render``` is ```modal.render = (template, data, onOkCallback, onCancelCallback) -> ...```

```coffee
Template.modalInsertEvent.events
  'click .ok': (e,t)->
    val = $(t.find('textarea')).val()
    modal.onOkCallback(val)
    modal.close()
  'click .cancel': (e,t)->
    modal.onCancelCallback()
    modal.close()
```

and the template:

```html
<template name="modalInsertEvent">
    <div style="border: 2px solid seagreen; width: 500px;">
        <h3>You are going to give an appointment for {{this.patient.nhc}}</h3>
        <div class="ui input">
            text: <textarea type="text" rows="5" cols="50">{{this.text}}</textarea>
        </div>
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