// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

Event.addBehavior({

    "form.itemgestion select.itemgestion-proyecto:change": function(ev) {
        Hobo.ajaxRequest(window.location.href, ['cliente-menu'], 
                         { params: Form.serializeElements([this]), method: 'get',
                           spinnerNextTo: this, message: "Cargando clientes"} )
    }

})

Event.addBehavior({
    "form.parte select.parte-proyecto:change": function(ev) {
        Hobo.ajaxRequest(window.location.href, ['actividad-menu'],
                         { params: Form.serializeElements([this]), method: 'get',
                           spinnerNextTo: this, message: "Mostrando actividades disponibles"} )
    }

})

Event.addBehavior({
    "form.parte select.parte-anho:change": function(ev) {
        Hobo.ajaxRequest(window.location.href, ['semana-menu'],
                         { params: Form.serializeElements([this]), method: 'get',
                           spinnerNextTo: this, message: "Mostrando semanas disponibles"} )
    }

})