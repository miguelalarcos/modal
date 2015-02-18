modal
=====

A modal package for Meteor.

Explanation
-----------

You use the package this way:

```coffee
    ...
    onOk = (dct) ->xCalendar.update(_id, {text: dct.text, status: 'pending'})
    onCancel = -> xCalendar.remove _id
    modal.show('modalInsertEvent', event, onOk, onCancel)
```

where ```modal.show``` is ```modal.show = (template, data, onOkCallback, onCancelCallback) -> ...```

and the template:

```html
<template name="modalInsertEvent">
    <div id="modalInsertEventId" style="border: 2px solid seagreen; width: 500px;">
        <h3>You are going to give an appointment for {{this.patient.nhc}}</h3>
        <p><b>Text:</b></p>
        <textarea type="text" rows="5" cols="50" name='text'>{{this.text}}</textarea>
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

The ok callback is passed a dictionary with the name attribute and its value of every input and textarea of the template.