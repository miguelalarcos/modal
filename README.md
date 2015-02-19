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
<template name="modalUpdateEvent">
    <div style="border: 2px solid seagreen; width: 500px;">
        <h3>You are going to edit the appointment for {{this.patient.nhc}} and date {{formatDateTime this.date}}</h3>
        {{#autoForm doc=this schema='modalSchema' id="modalUpdateForm" type="insert"}}
            <b>Text:</b>
            {{> afFieldInput name='text' rows="5" cols="50"}}
        {{/autoForm}}
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
      formId = $(t.find('form')).attr('id')
      if formId
        dct = AutoForm.getFormValues(formId)
        modal.onOkCallback(dct.insertDoc)
        AutoForm.resetForm(formId)
      else
        modal.onOkCallback()
    modal.close()
```